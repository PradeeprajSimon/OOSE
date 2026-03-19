/**
 * SeatService — Manages all Seat data operations.
 *
 * OOP Concepts: Encapsulation, Single Responsibility Principle.
 *
 * DB Schema: seat_id, flight_id, seat_number, seat_class, is_booked, locked_until
 *
 * Cabin layout:
 *   Business (rows 1-3):  A, B | D, E  (4 seats / row = 12 total)
 *   Economy  (rows 4-20): A, B, C | D, E, F  (6 seats / row = 102 total)
 *   Grand total: 114 seats per flight
 */

import { supabase } from '../supabaseClient'

const TABLE_NAME = 'Seat'

// Column definitions per class
const CABIN_CONFIG = {
  Business: { rows: [1, 2, 3],   cols: ['A', 'B', 'D', 'E'] },
  Economy:  { rows: Array.from({ length: 17 }, (_, i) => i + 4), cols: ['A', 'B', 'C', 'D', 'E', 'F'] }
}

class SeatService {
  /**
   * Fetches seats for a specific flight.
   * Returns all seats including locked ones (UI will show locked seats as "held").
   * If no seats exist, auto-generates a realistic 114-seat cabin.
   * @param {number} flightId
   */
  async getSeatsForFlight(flightId) {
    const { data: existingSeats, error } = await supabase
      .from(TABLE_NAME)
      .select('*')
      .eq('flight_id', flightId)
      .order('seat_id', { ascending: true })

    if (error) throw new Error(error.message)

    if (existingSeats && existingSeats.length > 0) {
      return existingSeats
    }

    console.log(`Generating 114-seat cabin for flight ${flightId}...`)
    return await this._generateDefaultSeats(flightId)
  }

  /**
   * Generates a realistic 114-seat aircraft cabin and saves to DB.
   * Business (rows 1-3): A, B, D, E  — 2+2 layout, no centre column
   * Economy  (rows 4-20): A, B, C, D, E, F — 3+3 layout
   * ~30% of seats seeded as already booked for demo realism.
   * @private
   */
  async _generateDefaultSeats(flightId) {
    const seatsToInsert = []

    for (const [seatClass, config] of Object.entries(CABIN_CONFIG)) {
      for (const row of config.rows) {
        for (const col of config.cols) {
          seatsToInsert.push({
            flight_id: flightId,
            seat_number: `${row}${col}`,
            seat_class: seatClass,
            is_booked: Math.random() < 0.3   // ~30% pre-booked for realistic demo
          })
        }
      }
    }

    const { data: inserted, error } = await supabase
      .from(TABLE_NAME)
      .insert(seatsToInsert)
      .select()
      .order('seat_id', { ascending: true })

    if (error) throw new Error(error.message)
    return inserted
  }

  /**
   * Gets the count of truly available seats for a flight.
   * Excludes: is_booked=true AND seats with an active lock (locked_until > NOW()).
   * Returns 114 (max capacity) if no seats have been generated yet.
   * @param {number} flightId
   * @returns {number}
   */
  async getAvailableSeatsCount(flightId) {
    // Check if any seats exist first
    const { count: totalCount } = await supabase
      .from(TABLE_NAME)
      .select('seat_id', { count: 'exact', head: true })
      .eq('flight_id', flightId)

    if (!totalCount || totalCount === 0) return 114 // pre-generation default

    // Fetch unbooked seats and filter expired locks client-side
    const { data, error } = await supabase
      .from(TABLE_NAME)
      .select('seat_id, locked_until')
      .eq('flight_id', flightId)
      .eq('is_booked', false)

    if (error) throw new Error(error.message)

    const now = new Date()
    // A seat is truly available if: not booked AND (no lock OR lock has expired)
    const available = (data || []).filter(s => {
      if (!s.locked_until) return true
      return new Date(s.locked_until) <= now
    })

    return available.length
  }

  /**
   * Soft-locks a seat for 10 minutes to prevent race conditions during payment.
   * Called upon initiating payment (also done server-side in Edge Function).
   * @param {number} seatId
   */
  async lockSeat(seatId) {
    const lockedUntil = new Date(Date.now() + 10 * 60 * 1000).toISOString()
    const { error } = await supabase
      .from(TABLE_NAME)
      .update({ locked_until: lockedUntil })
      .eq('seat_id', seatId)
      .eq('is_booked', false) // safe-guard: only lock if not already booked

    if (error) throw new Error(error.message)
    return true
  }

  /**
   * Releases a seat lock (e.g. if payment is cancelled).
   * @param {number} seatId
   */
  async unlockSeat(seatId) {
    const { error } = await supabase
      .from(TABLE_NAME)
      .update({ locked_until: null })
      .eq('seat_id', seatId)
      .eq('is_booked', false)

    if (error) throw new Error(error.message)
    return true
  }

  /**
   * Directly books seats (legacy / fallback path, not used in Razorpay flow).
   * The Razorpay flow handles booking via the Edge Function.
   * @param {number[]} seatIds
   */
  async bookSeats(seatIds) {
    const { data: checkSeats, error: checkError } = await supabase
      .from(TABLE_NAME)
      .select('seat_id, is_booked')
      .in('seat_id', seatIds)

    if (checkError) throw new Error(checkError.message)

    const unavailable = checkSeats.filter(s => s.is_booked)
    if (unavailable.length > 0) {
      throw new Error('One or more selected seats are no longer available. Please select different seats.')
    }

    const { error: updateError } = await supabase
      .from(TABLE_NAME)
      .update({ is_booked: true, locked_until: null })
      .in('seat_id', seatIds)

    if (updateError) throw new Error(updateError.message)
    return true
  }
}

// Singleton instance
export const seatService = new SeatService()
