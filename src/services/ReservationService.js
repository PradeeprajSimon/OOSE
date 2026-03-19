/**
 * ReservationService — Manages individual user booking history.
 */

const API_BASE_URL = 'http://localhost:3002/api';

class ReservationService {
  /**
   * Fetches all reservations for a specific passenger.
   * Join data from Flight, Seat, and Ticket tables.
   */
  async getMyReservations(passengerId) {
    if (!passengerId) return [];
    try {
      const res = await fetch(`${API_BASE_URL}/reservations/${passengerId}`);
      const result = await res.json();
      if (result.success) {
        return result.data;
      }
      throw new Error(result.error || 'Failed to fetch reservations');
    } catch (err) {
      console.error('ReservationService Error:', err);
      throw err;
    }
  }
}

export const reservationService = new ReservationService();
