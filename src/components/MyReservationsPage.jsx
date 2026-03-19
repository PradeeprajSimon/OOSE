import { useState, useEffect } from 'react';
import Navbar from './Navbar';
import { reservationService } from '../services/ReservationService';
import TicketCard from './payment/TicketCard';

export default function MyReservationsPage({ user, onAuthClick, onLogout, onHome }) {
  const [reservations, setReservations] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchReservations();
  }, [user]);

  const fetchReservations = async () => {
    if (!user) return;
    const passengerId = user.Passenger_id || user.passenger_id;
    if (!passengerId) {
      setLoading(false);
      return;
    }

    try {
      setLoading(true);
      const data = await reservationService.getMyReservations(passengerId);
      setReservations(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="bg-gray-50" style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column' }}>
      <Navbar 
        user={user} 
        onAuthClick={onAuthClick} 
        onLogout={onLogout} 
        onToggleReservations={() => {}} // Already here
      />

      <div className="container main-content" style={{ marginTop: '100px', flex: 1, paddingBottom: '60px' }}>
        <div className="reservations-header">
          <button className="btn-back-link" onClick={onHome}>← Back to Home</button>
          <h1>My Reservations</h1>
          <p>Your upcoming and past journeys with SkyLink</p>
        </div>

        {loading && (
          <div style={{ display: 'flex', justifyContent: 'center', padding: '100px' }}>
            <div className="spinner large"></div>
          </div>
        )}

        {error && (
          <div className="error-card" style={{ maxWidth: '600px', margin: '40px auto', textAlign: 'center' }}>
            <span style={{ fontSize: '3rem' }}>❌</span>
            <h3>Failed to load bookings</h3>
            <p>{error}</p>
            <button className="btn-auth" onClick={fetchReservations}>Retry</button>
          </div>
        )}

        {!loading && !error && reservations.length === 0 && (
          <div className="empty-reservations" style={{ textAlign: 'center', padding: '100px 24px' }}>
            <div style={{ fontSize: '4rem', marginBottom: '20px' }}>✈️</div>
            <h3>No reservations found</h3>
            <p>You haven't booked any flights yet. Start your journey today!</p>
            <button className="btn-auth" onClick={onHome} style={{ marginTop: '20px' }}>Search Flights</button>
          </div>
        )}

        {!loading && !error && reservations.length > 0 && (
          <div className="reservations-list">
            {reservations.map(res => (
              <div key={res.reservation_id} className="reservation-item-wrapper" style={{ marginBottom: '40px' }}>
                <TicketCard 
                  booking={res} 
                  user={user} 
                  variant="compact" 
                />
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
