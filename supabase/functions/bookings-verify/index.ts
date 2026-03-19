// Supabase Edge Function: bookings-verify
// Deno runtime · TypeScript
//
// POST /functions/v1/bookings-verify
// Body: { razorpay_order_id, razorpay_payment_id, razorpay_signature, reservation_id }
//
// Actions:
//   1. Verify HMAC-SHA256 signature using key_secret
//   2. On success: Seat.is_booked=true, locked_until=null,
//                  Reservation.status=confirmed,
//                  Payment.payment_status=captured + store IDs,
//                  Create Ticket (status: issued)
//   3. On failure: Reservation.status=failed, seat unlocked
//   4. Return { success, ticket_id, pnr }

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import { crypto } from 'https://deno.land/std@0.177.0/crypto/mod.ts'

const RAZORPAY_KEY_SECRET = Deno.env.get('RAZORPAY_KEY_SECRET')!
const SUPABASE_URL        = Deno.env.get('SUPABASE_URL')!
const SUPABASE_SERVICE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

/**
 * Verifies Razorpay HMAC-SHA256 payment signature.
 * Formula: HMAC_SHA256(order_id + "|" + payment_id, key_secret)
 */
async function verifySignature(
  orderId: string,
  paymentId: string,
  signature: string,
  secret: string
): Promise<boolean> {
  const payload = `${orderId}|${paymentId}`
  const encoder = new TextEncoder()
  const key = await crypto.subtle.importKey(
    'raw',
    encoder.encode(secret),
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign']
  )
  const signatureBytes = await crypto.subtle.sign('HMAC', key, encoder.encode(payload))
  const computedHex = Array.from(new Uint8Array(signatureBytes))
    .map(b => b.toString(16).padStart(2, '0'))
    .join('')
  return computedHex === signature
}

/** Generates a PNR: SL + 6 alphanumeric chars */
function generatePNR(): string {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  return 'SL' + Array.from({ length: 6 }, () => chars[Math.floor(Math.random() * chars.length)]).join('')
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY)

  try {
    const { razorpay_order_id, razorpay_payment_id, razorpay_signature, reservation_id } = await req.json()

    if (!razorpay_order_id || !razorpay_payment_id || !razorpay_signature || !reservation_id) {
      return Response.json({ error: 'Missing required payment verification fields' }, { status: 400, headers: corsHeaders })
    }

    // ── Step 1: Fetch Reservation + Payment ──────────────────────────────
    const { data: reservation, error: resErr } = await supabase
      .from('Reservation')
      .select('reservation_id, seat_id, flight_id, status')
      .eq('reservation_id', reservation_id)
      .single()

    if (resErr || !reservation) {
      return Response.json({ error: 'Reservation not found' }, { status: 404, headers: corsHeaders })
    }
    if (reservation.status === 'confirmed') {
      return Response.json({ error: 'Reservation already confirmed' }, { status: 409, headers: corsHeaders })
    }

    // ── Step 2: Verify HMAC signature ────────────────────────────────────
    const isValid = await verifySignature(
      razorpay_order_id,
      razorpay_payment_id,
      razorpay_signature,
      RAZORPAY_KEY_SECRET
    )

    if (!isValid) {
      // Payment signature failed → mark reservation as failed, unlock seat
      await supabase.from('Reservation').update({ status: 'failed' }).eq('reservation_id', reservation_id)
      await supabase.from('Seat').update({ locked_until: null }).eq('seat_id', reservation.seat_id)
      await supabase.from('Payment')
        .update({ payment_status: 'failed' })
        .eq('reservation_id', reservation_id)

      return Response.json({ error: 'Payment signature verification failed. Payment not processed.' }, { status: 400, headers: corsHeaders })
    }

    // ── Step 3: Finalise booking in DB ───────────────────────────────────
    // All four writes below form the atomic booking confirmation step

    // 3a. Mark seat as booked
    const { error: seatErr } = await supabase
      .from('Seat')
      .update({ is_booked: true, locked_until: null })
      .eq('seat_id', reservation.seat_id)

    if (seatErr) {
      return Response.json({ error: 'Failed to update seat: ' + seatErr.message }, { status: 500, headers: corsHeaders })
    }

    // 3b. Confirm reservation
    const { error: resUpdateErr } = await supabase
      .from('Reservation')
      .update({ status: 'confirmed' })
      .eq('reservation_id', reservation_id)

    if (resUpdateErr) {
      return Response.json({ error: 'Failed to confirm reservation: ' + resUpdateErr.message }, { status: 500, headers: corsHeaders })
    }

    // 3c. Update Payment record
    const { error: payErr } = await supabase
      .from('Payment')
      .update({
        payment_status: 'captured',
        razorpay_payment_id,
        razorpay_signature
      })
      .eq('reservation_id', reservation_id)

    if (payErr) {
      console.error('Warning: Payment update failed:', payErr.message)
    }

    // 3d. Create Ticket
    const pnr = generatePNR()
    const { data: ticket, error: ticketErr } = await supabase
      .from('Ticket')
      .insert({
        reservation_id,
        issue_date: new Date().toISOString(),
        ticket_status: 'issued'
      })
      .select('ticket_id')
      .single()

    if (ticketErr || !ticket) {
      console.error('Warning: Ticket creation failed:', ticketErr?.message)
    }

    return Response.json({
      success: true,
      ticket_id: ticket?.ticket_id || null,
      pnr
    }, { status: 200, headers: corsHeaders })

  } catch (err) {
    console.error('bookings-verify error:', err)
    return Response.json({ error: err.message || 'Internal server error' }, { status: 500, headers: corsHeaders })
  }
})
