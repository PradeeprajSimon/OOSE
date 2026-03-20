/**
 * BookingService — Manages the full booking lifecycle via local Express backend.
 *
 * Replaces the previous Supabase Edge Function implementation for PRD v5.0.
 */

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://localhost:3001/api';

class BookingService {
  /**
   * Sends OTP via Twilio SMS.
   * @param {string} phoneNumber 
   */
  async sendOtp(phoneNumber) {
    const res = await fetch(`${API_BASE_URL}/otp/send`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ phone_number: phoneNumber })
    });
    return await res.json();
  }

  /**
   * Verifies OTP code.
   * @param {string} phoneNumber 
   * @param {string} otpCode 
   */
  async verifyOtp(phoneNumber, otpCode) {
    const res = await fetch(`${API_BASE_URL}/otp/verify`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ phone_number: phoneNumber, otp_code: otpCode })
    });
    return await res.json();
  }

  /**
   * Finalizes the booking in the DB.
   * @param {Object} data 
   */
  async confirmBooking(data) {
    const res = await fetch(`${API_BASE_URL}/bookings/confirm`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });
    return await res.json();
  }

  /**
   * Releases seat lock on failure.
   * @param {number} seatId 
   */
  async unlockSeat(seatId) {
    await fetch(`${API_BASE_URL}/seats/unlock`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ seat_id: seatId })
    });
  }
}

export const bookingService = new BookingService();
