import Navbar from './Navbar'

/**
 * BookingConfirmedPage — Success page after a completed Razorpay payment.
 *
 * OOP Concepts: Presentation Component (pure render, no business logic).
 * Receives all data as props from App.jsx state — no API calls needed here.
 */

export default function BookingConfirmedPage({ booking, user, onAuthClick, onLogout, onHome, onViewReservations }) {
  const { ticket_id, pnr, flight, selectedSeats, totalAmount, passengerName } = booking

  const depTime = new Date(flight.departure_time).toLocaleString('en-IN', {
    weekday: 'long', day: 'numeric', month: 'long', year: 'numeric',
    hour: '2-digit', minute: '2-digit'
  })
  const arrTime = flight.arrival_time
    ? new Date(flight.arrival_time).toLocaleTimeString('en-IN', { hour: '2-digit', minute: '2-digit' })
    : '—'

  const handlePrintAndRedirect = () => {
    window.print()
    // Short delay helps ensure the print dialog opens before we redirect
    setTimeout(() => {
      onViewReservations()
    }, 1000)
  }

  return (
    <div style={{ minHeight: '100vh', background: 'linear-gradient(135deg, #001b94 0%, #0F6E56 100%)', display: 'flex', flexDirection: 'column' }}>
      <Navbar user={user} onAuthClick={onAuthClick} onLogout={onLogout} />

      <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '100px 24px 40px' }}>
        <div className="confirmed-card">

          {/* Success Header */}
          <div className="confirmed-header">
            <div className="confirmed-icon">✅</div>
            <h1 className="confirmed-title">Booking Confirmed!</h1>
            <p className="confirmed-subtitle">Your seats are reserved. Have a great flight!</p>
          </div>

          {/* PNR / Ticket ID */}
          <div className="confirmed-pnr-block">
            <div className="confirmed-pnr-label">PNR / Booking Reference</div>
            <div className="confirmed-pnr">{pnr || `SL${ticket_id}`}</div>
            <div className="confirmed-ticket-id">Ticket ID: #{ticket_id}</div>
          </div>

          {/* Divider */}
          <div className="confirmed-divider">
            <div className="confirmed-notch left" />
            <div className="confirmed-dash-line" />
            <div className="confirmed-notch right" />
          </div>

          {/* Flight Details */}
          <div className="confirmed-details">
            <div className="confirmed-route-row">
              <div className="confirmed-city">
                <div className="confirmed-code">{flight.source}</div>
                <div className="confirmed-city-label">Departure</div>
              </div>
              <div className="confirmed-plane">✈</div>
              <div className="confirmed-city" style={{ textAlign: 'right' }}>
                <div className="confirmed-code">{flight.destination}</div>
                <div className="confirmed-city-label">Arrival</div>
              </div>
            </div>

            <div className="confirmed-info-grid">
              <div className="confirmed-info-item">
                <span className="confirmed-info-label">Passenger</span>
                <span className="confirmed-info-value">{passengerName}</span>
              </div>
              <div className="confirmed-info-item">
                <span className="confirmed-info-label">Flight</span>
                <span className="confirmed-info-value">{flight.flight_no || `SL-${flight.flight_id}`}</span>
              </div>
              <div className="confirmed-info-item">
                <span className="confirmed-info-label">Departure</span>
                <span className="confirmed-info-value">{depTime}</span>
              </div>
              <div className="confirmed-info-item">
                <span className="confirmed-info-label">Arrival</span>
                <span className="confirmed-info-value">{arrTime}</span>
              </div>
              <div className="confirmed-info-item">
                <span className="confirmed-info-label">Seats</span>
                <span className="confirmed-info-value">
                  {selectedSeats.map(s => `${s.seat_number} (${s.seat_class})`).join(', ')}
                </span>
              </div>
              <div className="confirmed-info-item">
                <span className="confirmed-info-label">Amount Paid</span>
                <span className="confirmed-info-value confirmed-amount">₹{totalAmount.toLocaleString('en-IN')}</span>
              </div>
            </div>
          </div>

          {/* Actions */}
          <div className="confirmed-actions">
            <button className="confirmed-btn-home" onClick={onHome}>
              🏠 Back to Home
            </button>
            <button
              className="confirmed-btn-download"
              onClick={handlePrintAndRedirect}
            >
              🖨 Print / Save Ticket
            </button>
            <button
              className="confirmed-btn-reservations"
              onClick={onViewReservations}
              style={{
                backgroundColor: '#0F6E56',
                color: 'white',
                border: 'none',
                padding: '12px 24px',
                borderRadius: '8px',
                fontWeight: '600',
                cursor: 'pointer',
                transition: 'all 0.2s',
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                fontSize: '15px'
              }}
            >
              📋 View My Bookings
            </button>
          </div>

          <p className="confirmed-disclaimer">
            A confirmation email would be sent to {user?.email || 'your registered email'} · Keep your PNR handy at check-in
          </p>
        </div>
      </div>
    </div>
  )
}
