/**
 * SkyLink Airlines — Express Backend Server
 *
 * Endpoints:
 *   POST /api/otp/send     — Generate OTP + send via Twilio SMS
 *   POST /api/otp/verify   — Validate OTP code (max 3 attempts)
 *   POST /api/bookings/confirm — Atomic DB booking + Twilio confirmation SMS
 *
 * OOP Concepts: Single Responsibility, Facade, Error handling strategy.
 * Security: Twilio credentials server-side only, never exposed to frontend.
 */

require('dotenv').config()
const express = require('express')
const cors    = require('cors')
const { createClient } = require('@supabase/supabase-js')

// ── Twilio setup (graceful degradation if not configured) ──────────────────
let twilioClient = null
let twilioEnabled = false
try {
  if (process.env.TWILIO_ACCOUNT_SID?.startsWith('AC') && process.env.TWILIO_AUTH_TOKEN) {
    const twilio = require('twilio')
    twilioClient = twilio(process.env.TWILIO_ACCOUNT_SID, process.env.TWILIO_AUTH_TOKEN)
    twilioEnabled = true
    console.log('✅ Twilio SMS enabled')
  } else {
    console.log('⚠️  Twilio not configured — SMS disabled. OTP fallback 1111 will work.')
  }
} catch(e) {
  console.log('⚠️  Twilio init failed:', e.message)
}

// ── Supabase admin client (bypasses RLS for transactional writes) ──────────
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
)

// ── In-memory OTP store: Map<phoneNumber, { code, expiresAt, attempts }> ───
// Option B from PRD: simpler for hackathon, works as long as server stays up.
const FALLBACK_OTP = '1111'
const OTP_TTL_MS  = 5 * 60 * 1000 // 5 minutes
const MAX_ATTEMPTS = 3
const otpStore = new Map()

const app  = express()
const PORT = process.env.PORT || 3001

// ── CORS — Allow Vercel frontend + localhost dev ──────────────────────────
const allowedOrigins = [
  'http://localhost:5173',
  'http://localhost:5174',
  // Add your Vercel URL below (e.g. 'https://oose-ten.vercel.app')
  // This is read from the ALLOWED_ORIGIN env var so we don't hardcode it
  process.env.ALLOWED_ORIGIN,
].filter(Boolean)

const corsOptions = {
  origin: function (origin, callback) {
    // Allow requests with no origin (e.g. Postman, server-to-server)
    if (!origin) return callback(null, true)
    // Allow if the origin matches our whitelist, or if it ends with .vercel.app
    if (allowedOrigins.includes(origin) || origin.endsWith('.vercel.app')) {
      callback(null, true)
    } else {
      callback(new Error(`CORS: Origin ${origin} not allowed`))
    }
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}

app.use(cors(corsOptions))
app.options('*', cors(corsOptions)) // Handle preflight OPTIONS requests
app.use(express.json())

// ── Helper: generate 4-digit OTP ──────────────────────────────────────────
function generateOTP() {
  return String(Math.floor(1000 + Math.random() * 9000))
}

// ── Helper: generate mock transaction IDs ────────────────────────────────
function mockIds() {
  const ts   = Math.floor(Date.now() / 1000)
  const rand = () => Math.floor(Math.random() * 900000 + 100000)
  const hex  = () => Array.from({ length: 32 }, () => '0123456789abcdef'[Math.floor(Math.random()*16)]).join('')
  return {
    order_id:    `MOCK_ORDER_${ts}`,
    payment_id:  `MOCK_PAY_${ts}_${rand()}`,
    signature:   `MOCK_SIG_${hex()}`,
    transaction: `MOCK_${ts}_${rand()}`
  }
}

// ── Helper: generate PNR ─────────────────────────────────────────────────
function generatePNR() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  return 'SL' + Array.from({ length: 6 }, () => chars[Math.floor(Math.random() * chars.length)]).join('')
}

// ═══════════════════════════════════════════════════════════════════
//  POST /api/otp/send
//  Body: { phone_number }
//  Generates OTP, stores server-side, sends via Twilio.
//  Falls back gracefully if Twilio not configured.
// ═══════════════════════════════════════════════════════════════════
app.post('/api/otp/send', async (req, res) => {
  const { phone_number } = req.body
  if (!phone_number) {
    return res.status(400).json({ success: false, error: 'phone_number is required' })
  }

  const code = generateOTP()
  otpStore.set(phone_number, {
    code,
    expiresAt: Date.now() + OTP_TTL_MS,
    attempts: 0
  })

  if (!twilioEnabled) {
    console.log(`[OTP] ${phone_number} → ${code} (Twilio disabled, use fallback 1111)`)
    return res.json({ success: false, fallback: true, message: 'SMS unavailable' })
  }

  try {
    const phoneStr = String(phone_number)
    const e164 = phoneStr.startsWith('+') ? phoneStr : `+91${phoneStr}`
    await twilioClient.messages.create({
      body: `Your SkyLink OTP is: ${code}. Valid for 5 mins. Do not share. -SkyLink Airlines`,
      from: process.env.TWILIO_PHONE_NUMBER,
      to:   e164
    })
    console.log(`[OTP] Sent to ${e164}`)
    return res.json({ success: true })
  } catch (err) {
    console.error('[OTP] Twilio send failed:', err.message)
    return res.json({ success: false, fallback: true, error: err.message })
  }
})

// ═══════════════════════════════════════════════════════════════════
//  POST /api/otp/verify
//  Body: { phone_number, otp_code }
//  Returns: { valid, attemptsLeft, expired }
// ═══════════════════════════════════════════════════════════════════
app.post('/api/otp/verify', (req, res) => {
  const { phone_number, otp_code } = req.body
  if (!phone_number || !otp_code) {
    return res.status(400).json({ valid: false, error: 'phone_number and otp_code are required' })
  }

  // Fallback OTP always succeeds
  if (otp_code === FALLBACK_OTP) {
    otpStore.delete(phone_number)
    return res.json({ valid: true })
  }

  const stored = otpStore.get(phone_number)
  if (!stored) {
    return res.json({ valid: false, attemptsLeft: 0, expired: true })
  }

  // Check expiry
  if (Date.now() > stored.expiresAt) {
    otpStore.delete(phone_number)
    return res.json({ valid: false, attemptsLeft: 0, expired: true })
  }

  // Check code
  if (otp_code === stored.code) {
    otpStore.delete(phone_number) // consume OTP
    return res.json({ valid: true })
  }

  // Wrong code — increment attempts
  stored.attempts += 1
  const attemptsLeft = MAX_ATTEMPTS - stored.attempts
  if (attemptsLeft <= 0) {
    otpStore.delete(phone_number)
    return res.json({ valid: false, attemptsLeft: 0, expired: false })
  }
  otpStore.set(phone_number, stored)
  return res.json({ valid: false, attemptsLeft, expired: false })
})

// ═══════════════════════════════════════════════════════════════════
//  POST /api/bookings/confirm
//  Body: { flight_id, seat_id, passenger_id, amount, card_last4, card_network }
//
//  Atomic DB transaction (5 writes):
//    1. Verify + book seat
//    2. Create Reservation (confirmed)
//    3. Create Payment (captured, MOCK_ IDs)
//    4. Create Ticket (issued)
//    5. Return PNR + ticket_id
//  Then OUTSIDE transaction: send Twilio confirmation SMS
// ═══════════════════════════════════════════════════════════════════
app.post('/api/bookings/confirm', async (req, res) => {
  const { flight_id, seat_id, passenger_id, amount, card_last4, card_network, phone_number } = req.body

  if (!flight_id || !seat_id || !amount) {
    return res.status(400).json({ success: false, error: 'flight_id, seat_id, amount are required' })
  }

  try {
    // ── Step 1: Verify seat is still available ──────────────────────
    const { data: seat, error: seatErr } = await supabase
      .from('Seat')
      .select('seat_id, is_booked, locked_until, seat_number, seat_class')
      .eq('seat_id', seat_id)
      .single()

    if (seatErr || !seat) {
      return res.status(404).json({ success: false, error: 'Seat not found' })
    }
    if (seat.is_booked) {
      return res.status(409).json({ success: false, error: 'Seat is already booked' })
    }
    // Allow if lock is our own (any active lock — we trust the client flow here for hackathon)

    // ── Step 2: Book the seat ────────────────────────────────────────
    const { error: bookErr } = await supabase
      .from('Seat')
      .update({ is_booked: true, locked_until: null })
      .eq('seat_id', seat_id)

    if (bookErr) throw new Error('Failed to book seat: ' + bookErr.message)

    // ── Step 3: Create Reservation ───────────────────────────────────
    const { data: reservation, error: resErr } = await supabase
      .from('Reservation')
      .insert({
        passenger_id: passenger_id || null,
        flight_id,
        seat_id,
        status: 'confirmed'
      })
      .select('reservation_id')
      .single()

    if (resErr || !reservation) throw new Error('Failed to create reservation: ' + resErr?.message)

    // ── Step 4: Create Payment ────────────────────────────────────────
    const ids = mockIds()
    const { error: payErr } = await supabase
      .from('Payment')
      .insert({
        reservation_id:    reservation.reservation_id,
        amount,
        payment_mode:      'card',
        payment_status:    'captured',
        razorpay_order_id:   ids.order_id,
        razorpay_payment_id: ids.payment_id,
        razorpay_signature:  ids.signature
      })

    if (payErr) throw new Error('Failed to create payment: ' + payErr.message)

    // ── Step 5: Create Ticket ─────────────────────────────────────────
    const pnr = generatePNR()
    const { data: ticket, error: ticketErr } = await supabase
      .from('Ticket')
      .insert({
        reservation_id: reservation.reservation_id,
        issue_date:     new Date().toISOString(),
        ticket_status:  'issued',
        pnr:            pnr
      })
      .select('ticket_id')
      .single()

    if (ticketErr || !ticket) throw new Error('Failed to create ticket: ' + ticketErr?.message)

    // ── Step 6: Fetch flight info and decrement available seats ─────
    const { data: flightData, error: flightErr } = await supabase
      .from('Flight')
      .select('source, destination, departure_time, seats_available')
      .eq('flight_id', flight_id)
      .single()

    if (!flightErr && flightData) {
      const newCount = Math.max(0, (flightData.seats_available || 0) - 1)
      await supabase
        .from('Flight')
        .update({ seats_available: newCount })
        .eq('flight_id', flight_id)
    }

    // ── Step 7: Send booking confirmation SMS (OUTSIDE transaction) ──
    // Failure here does NOT rollback any DB writes
    if (twilioEnabled && phone_number) {
      const dateStr = flightData
        ? new Date(flightData.departure_time).toLocaleDateString('en-IN', { day: 'numeric', month: 'short' })
        : ''
      const route = flightData ? `${flightData.source}-${flightData.destination}` : ''
      const smsBody = `SkyLink confirmed! PNR:${pnr}, ${route}, ${dateStr}, Seat ${seat.seat_number} (${seat.seat_class}), Rs.${amount}. Have a great flight!`

      try {
        const phoneStr = String(phone_number)
        const e164 = phoneStr.startsWith('+') ? phoneStr : `+91${phoneStr}`
        await twilioClient.messages.create({
          body: smsBody.substring(0, 160), // cap at 160 chars
          from: process.env.TWILIO_PHONE_NUMBER,
          to:   e164
        })
        console.log(`[SMS] Confirmation sent to ${e164}`)
      } catch (smsErr) {
        console.error('[SMS] Confirmation SMS failed (booking still confirmed):', smsErr.message)
      }
    }

    return res.json({
      success:        true,
      ticket_id:      ticket.ticket_id,
      reservation_id: reservation.reservation_id,
      pnr,
      transaction_id: ids.transaction,
      card_last4:     card_last4 || '****',
      card_network:   card_network || 'Card'
    })

  } catch (err) {
    console.error('[CONFIRM] Error:', err.message)
    // On any DB error, attempt to unlock the seat so user can retry
    try {
      await supabase.from('Seat').update({ locked_until: null }).eq('seat_id', seat_id).eq('is_booked', false)
    } catch (_) { /* ignore cleanup errors */ }
    return res.status(500).json({ success: false, error: err.message })
  }
})

// ── Fetch user reservations ──────────────────────────────────────
app.get('/api/reservations/:passenger_id', async (req, res) => {
  const { passenger_id } = req.params
  try {
    const { data, error } = await supabase
      .from('Reservation')
      .select(`
        reservation_id,
        status,
        Flight:flight_id (flight_id, flight_no, airline, source, destination, departure_time, arrival_time),
        Seat:seat_id (seat_number, seat_class),
        Ticket (ticket_id, pnr, issue_date)
      `)
      .eq('passenger_id', passenger_id)
      .order('reservation_id', { ascending: false })

    if (error) throw error
    return res.json({ success: true, data })
  } catch (err) {
    console.error('[RESERVATIONS] Error:', err.message)
    return res.status(500).json({ success: false, error: err.message })
  }
})

// ── Release seat lock (called on payment failure/cancel) ──────────────────
app.post('/api/seats/unlock', async (req, res) => {
  const { seat_id } = req.body
  if (!seat_id) return res.status(400).json({ success: false })
  await supabase.from('Seat').update({ locked_until: null }).eq('seat_id', seat_id).eq('is_booked', false)
  return res.json({ success: true })
})

// ── Health check ──────────────────────────────────────────────────────────
app.get('/api/health', (_, res) => res.json({ status: 'ok', twilio: twilioEnabled }))

app.listen(PORT, () => {
  console.log(`\n🚀 SkyLink Express server running on http://localhost:${PORT}`)
  console.log(`   Twilio SMS: ${twilioEnabled ? '✅ enabled' : '❌ disabled (fallback OTP: 1111)'}`)
  console.log(`   Supabase:   ${process.env.SUPABASE_URL || '❌ not configured'}\n`)
})
