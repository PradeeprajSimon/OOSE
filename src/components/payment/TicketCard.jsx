import { flightService } from '../../services/FlightService';

export default function TicketCard({ booking, user, variant = 'compact' }) {
  if (!booking) return null;

  const flight = booking.Flight || booking.flight;
  const seat = booking.Seat || (booking.selectedSeats ? booking.selectedSeats[0] : null);
  const ticket = booking.Ticket?.[0] || booking.Ticket || booking;
  const passengerName = user?.Name || user?.name || booking.passengerName || 'Passenger';
  
  const pnr = ticket.pnr || booking.pnr || 'SL-PENDING';
  const depTime = new Date(flight.departure_time);
  const arrTime = new Date(flight.arrival_time);

  return (
    <div className={`ticket-frame ${variant}`}>
      <div className="ticket-main">
        <div className="ticket-header">
          <div className="airline-brand">
            <span className="logo-icon">✈</span>
            <div className="brand-text">
              <strong>SkyLink Airlines</strong>
              <span>Boarding Pass</span>
            </div>
          </div>
          <div className="ticket-pnr">
            <span className="label">PNR / BOOKING REF</span>
            <span className="value">{pnr}</span>
          </div>
        </div>

        <div className="ticket-body">
          <div className="passenger-section">
            <div className="info-block">
              <span className="label">PASSENGER NAME</span>
              <span className="value uppercase">{passengerName}</span>
            </div>
            <div className="info-block align-right">
              <span className="label">FLIGHT NO</span>
              <span className="value">{flight.flight_no}</span>
            </div>
          </div>

          <div className="route-section">
            <div className="route-point">
              <span className="city-code">{flight.source?.slice(0, 3).toUpperCase()}</span>
              <span className="city-name">{flight.source}</span>
              <span className="time">{flightService.formatTime(flight.departure_time)}</span>
            </div>
            
            <div className="route-path">
              <div className="path-line"></div>
              <span className="plane-icon">✈</span>
            </div>

            <div className="route-point align-right">
              <span className="city-code">{flight.destination?.slice(0, 3).toUpperCase()}</span>
              <span className="city-name">{flight.destination}</span>
              <span className="time">{flightService.formatTime(flight.arrival_time)}</span>
            </div>
          </div>

          <div className="details-section">
            <div className="info-block">
              <span className="label">DATE</span>
              <span className="value">{depTime.toLocaleDateString('en-IN', { day: 'numeric', month: 'short', year: 'numeric' })}</span>
            </div>
            <div className="info-block">
              <span className="label">SEAT</span>
              <span className="value">{seat?.seat_number || 'TBD'} ({seat?.seat_class || 'ECO'})</span>
            </div>
            <div className="info-block align-right">
              <span className="label">GATE</span>
              <span className="value">G-24</span>
            </div>
          </div>
        </div>
      </div>

      <div className="ticket-divider">
        <div className="notch top"></div>
        <div className="dashed-line"></div>
        <div className="notch bottom"></div>
      </div>

      <div className="ticket-stub">
        <div className="stub-header">
          <span className="label">TICKET ID</span>
          <span className="value">#{ticket.ticket_id || 'DEMO'}</span>
        </div>
        <div className="stub-qr">
          {/* Mock QR code using a simple SVG-like pattern for realism */}
          <div className="mock-qr">
            {[...Array(25)].map((_, i) => (
              <div key={i} className={`qr-pixel ${Math.random() > 0.5 ? 'black' : ''}`}></div>
            ))}
          </div>
        </div>
        <div className="stub-footer">
          <span className="label">TERMINAL</span>
          <span className="value">T3</span>
        </div>
      </div>
    </div>
  );
}
