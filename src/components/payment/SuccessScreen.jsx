import TicketCard from './TicketCard';
import { useState } from 'react';

export default function SuccessScreen({ booking, onHome }) {
  const [redirecting, setRedirecting] = useState(false);

  const handleDownload = () => {
    // Trigger the print dialog
    window.print();
    
    // Start the redirect process immediately after
    setRedirecting(true);
    
    // Short delay to let the print dialog initialize, then redirect
    setTimeout(() => {
      onHome('my-reservations');
    }, 2000);
  };

  return (
    <div className="success-screen">
      <div className="success-header">
        <div className="checkmark-circle">
          <div className="checkmark draw"></div>
        </div>
        <h1>Payment Successful!</h1>
        <p>Your journey with SkyLink Airlines is about to begin.</p>
      </div>

      <div className="ticket-presentation-area">
        <TicketCard booking={booking} user={null} variant="large" />
      </div>

      <div className="success-actions">
        <button className="btn-download-ticket" onClick={handleDownload}>
          <span style={{ fontSize: '1.2rem' }}>📥</span>
          {redirecting ? 'Preparing Reservations...' : 'Download / Print Ticket'}
        </button>
        
        <p className="success-footer-note">
          A copy of your ticket has been sent to your registered email and mobile number.
        </p>
      </div>
    </div>
  );
}
