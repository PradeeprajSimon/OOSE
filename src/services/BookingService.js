/**
 * BookingService — Manages the full booking lifecycle via local Express backend.
 *
 * Replaces the previous Supabase Edge Function implementation for PRD v5.0.
 */

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://localhost:3001/api';

/**
 * safeFetch — calls fetch and throws a clean error if the server returns HTML
 * (which happens when Render is cold-starting or the URL path is wrong).
 */
async function safeFetch(url, options) {
  let response;
  try {
    response = await fetch(url, options);
  } catch (networkErr) {
    // Pure fetch failure — server unreachable
    throw new Error(
      'Cannot reach the payment server. Please check your internet or try again in a few seconds.'
    );
  }

  const contentType = response.headers.get('content-type') || '';
  if (!contentType.includes('application/json')) {
    // Server returned HTML (404 page, 503 cold-start splash, Render spinning up)
    const text = await response.text();
    console.error('[BookingService] Non-JSON response from server:', text.substring(0, 200));
    throw new Error(
      `Server error (HTTP ${response.status}). The payment server may be starting up — please wait 10 seconds and try again.`
    );
  }

  const data = await response.json();
  return data;
}

class BookingService {
  /** Sends OTP via Twilio SMS. */
  async sendOtp(phoneNumber) {
    return safeFetch(`${API_BASE_URL}/otp/send`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ phone_number: phoneNumber })
    });
  }

  /** Verifies OTP code. */
  async verifyOtp(phoneNumber, otpCode) {
    return safeFetch(`${API_BASE_URL}/otp/verify`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ phone_number: phoneNumber, otp_code: otpCode })
    });
  }

  /** Finalizes the booking in the DB. */
  async confirmBooking(data) {
    return safeFetch(`${API_BASE_URL}/bookings/confirm`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });
  }

  /** Releases seat lock on failure. */
  async unlockSeat(seatId) {
    try {
      await fetch(`${API_BASE_URL}/seats/unlock`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ seat_id: seatId })
      });
    } catch (_) { /* Best-effort unlock, don't crash */ }
  }

  /** Health check — ping backend to wake it up before payment. */
  async ping() {
    try {
      const res = await fetch(`${API_BASE_URL}/health`);
      return res.ok;
    } catch (_) {
      return false;
    }
  }
}

export const bookingService = new BookingService();

