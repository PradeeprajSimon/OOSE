/**
 * FlightService — Manages all flight search and retrieval.
 *
 * OOP Concepts: Encapsulation, Abstraction, Open/Closed Principle.
 *
 * IMPORTANT: Column names match the actual Supabase 'Flight' table.
 * Existing columns: flight_id, source, destination, departure_time (timestamp), fare
 * Added columns: airline, flight_no, arrival_time, class, seats_available
 */

import { supabase } from '../supabaseClient'

const TABLE_NAME = 'Flight'

class FlightService {
  /**
   * Internally builds and executes the Supabase flight query.
   * Filters by source, destination, and the DATE part of departure_time.
   * @private
   */
  _buildQuery(criteria) {
    // departure_time is a TIMESTAMP, so we filter by date range:
    // from '2026-03-20 00:00:00' to '2026-03-20 23:59:59'
    const dayStart = `${criteria.date}T00:00:00`
    const dayEnd   = `${criteria.date}T23:59:59`

    let query = supabase
      .from(TABLE_NAME)
      .select('*')
      .eq('source', criteria.source)
      .eq('destination', criteria.destination)
      .gte('departure_time', dayStart)
      .lte('departure_time', dayEnd)

    // Sort results
    if (criteria.sortBy === 'fare') {
      query = query.order('fare', { ascending: true })
    } else if (criteria.sortBy === 'departure_time') {
      query = query.order('departure_time', { ascending: true })
    } else {
      query = query.order('fare', { ascending: true }) // default
    }

    return query
  }

  /**
   * Search flights by source, destination, and date.
   */
  async search(source, destination, date, sortBy = 'fare') {
    if (!source || !destination || !date)
      throw new Error('Source, destination, and date are required.')
    if (source === destination)
      throw new Error('Source and destination cannot be the same.')

    const { data, error } = await this._buildQuery({ source, destination, date, sortBy })
    if (error) throw new Error(error.message)
    return data || []
  }

  /**
   * Formats a timestamp into a readable time string.
   * @param {string} timestamp - e.g. '2026-03-20T06:00:00'
   * @returns {string} e.g. '06:00 AM'
   */
  formatTime(timestamp) {
    try {
      const d = new Date(timestamp)
      return d.toLocaleTimeString('en-IN', { hour: '2-digit', minute: '2-digit', hour12: true })
    } catch {
      return '—'
    }
  }

  /**
   * Calculates flight duration from two timestamps.
   * @param {string} dep - departure timestamp
   * @param {string} arr - arrival timestamp
   * @returns {string} e.g. '2h 55m'
   */
  formatDuration(dep, arr) {
    try {
      const depMs = new Date(dep).getTime()
      const arrMs = new Date(arr).getTime()
      let diff = Math.abs(arrMs - depMs) / 60000 // minutes
      return `${Math.floor(diff / 60)}h ${Math.round(diff % 60)}m`
    } catch {
      return '—'
    }
  }
}

// Singleton instance
export const flightService = new FlightService()
