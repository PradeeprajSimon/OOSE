// Supabase Edge Function: bookings-initiate
// Deno runtime · TypeScript
//
// POST /functions/v1/bookings-initiate
// Body: { flight_id, seat_id, passenger_id, amount_paise }
//
// Actions:
//   1. Validate seat is free and not locked by another session
//   2. Lock seat for 10 minutes
//   3. Create Reservation (status: pending)
//   4. Call Razorpay Orders API → create order
//   5. Create Payment row (status: created)
//   6. Return { razorpay_order_id, amount, reservation_id }

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const RAZORPAY_KEY_ID     = Deno.env.get('RAZORPAY_KEY_ID')!
const RAZORPAY_KEY_SECRET = Deno.env.get('RAZORPAY_KEY_SECRET')!
const SUPABASE_URL        = Deno.env.get('SUPABASE_URL')!
const SUPABASE_SERVICE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const { flight_id, seat_id, passenger_id, amount_paise } = await req.json()

    if (!flight_id || !seat_id || !amount_paise) {
      return Response.json({ error: 'Missing required fields: flight_id, seat_id, amount_paise' }, { status: 400, headers: corsHeaders })
    }

    // Use service role client to bypass RLS for atomic seat locking
    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    const now = new Date()

    // ── Step 1: Check seat availability ──────────────────────────────────
    const { data: seat, error: seatErr } = await supabase
      .from('Seat')
      .select('seat_id, is_booked, locked_until')
      .eq('seat_id', seat_id)
      .single()

    if (seatErr || !seat) {
      return Response.json({ error: 'Seat not found' }, { status: 404, headers: corsHeaders })
    }
    if (seat.is_booked) {
      return Response.json({ error: 'Seat is already booked' }, { status: 409, headers: corsHeaders })
    }
    if (seat.locked_until && new Date(seat.locked_until) > now) {
      return Response.json({ error: 'Seat is temporarily held by another user. Please select a different seat.' }, { status: 409, headers: corsHeaders })
    }

    // ── Step 2: Lock seat for 10 minutes ─────────────────────────────────
    const lockedUntil = new Date(Date.now() + 10 * 60 * 1000).toISOString()
    const { error: lockErr } = await supabase
      .from('Seat')
      .update({ locked_until: lockedUntil })
      .eq('seat_id', seat_id)

    if (lockErr) {
      return Response.json({ error: 'Failed to lock seat: ' + lockErr.message }, { status: 500, headers: corsHeaders })
    }

    // ── Step 3: Create Reservation ───────────────────────────────────────
    const { data: reservation, error: resErr } = await supabase
      .from('Reservation')
      .insert({
        passenger_id: passenger_id || null,
        flight_id,
        seat_id,
        status: 'pending'
      })
      .select('reservation_id')
      .single()

    if (resErr || !reservation) {
      // Rollback seat lock
      await supabase.from('Seat').update({ locked_until: null }).eq('seat_id', seat_id)
      return Response.json({ error: 'Failed to create reservation: ' + resErr?.message }, { status: 500, headers: corsHeaders })
    }

    // ── Step 4: Create Razorpay Order ─────────────────────────────────────
    const razorpayBasic = btoa(`${RAZORPAY_KEY_ID}:${RAZORPAY_KEY_SECRET}`)
    const rpRes = await fetch('https://api.razorpay.com/v1/orders', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Basic ${razorpayBasic}`
      },
      body: JSON.stringify({
        amount: amount_paise,
        currency: 'INR',
        receipt: `rcpt_res_${reservation.reservation_id}`,
        notes: { reservation_id: reservation.reservation_id, seat_id, flight_id }
      })
    })

    if (!rpRes.ok) {
      const rpErr = await rpRes.json()
      // Rollback: unlock seat, delete reservation
      await supabase.from('Seat').update({ locked_until: null }).eq('seat_id', seat_id)
      await supabase.from('Reservation').delete().eq('reservation_id', reservation.reservation_id)
      return Response.json({ error: 'Razorpay order creation failed: ' + (rpErr.error?.description || 'Unknown error') }, { status: 502, headers: corsHeaders })
    }

    const rpOrder = await rpRes.json()

    // ── Step 5: Create Payment row ────────────────────────────────────────
    const { error: payErr } = await supabase
      .from('Payment')
      .insert({
        reservation_id: reservation.reservation_id,
        amount: amount_paise / 100, // store in rupees
        payment_mode: 'razorpay',
        payment_status: 'created',
        razorpay_order_id: rpOrder.id
      })

    if (payErr) {
      console.error('Warning: Payment row creation failed:', payErr.message)
      // Non-fatal for now — verify step will handle it
    }

    return Response.json({
      razorpay_order_id: rpOrder.id,
      amount: rpOrder.amount, // in paise
      reservation_id: reservation.reservation_id
    }, { status: 200, headers: corsHeaders })

  } catch (err) {
    console.error('bookings-initiate error:', err)
    return Response.json({ error: err.message || 'Internal server error' }, { status: 500, headers: corsHeaders })
  }
})
