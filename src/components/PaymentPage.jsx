import { useState, useEffect } from 'react';
import Navbar from './Navbar';
import PaymentForm from './payment/PaymentForm';
import ProcessingScreen from './payment/ProcessingScreen';
import OtpScreen from './payment/OtpScreen';
import SuccessScreen from './payment/SuccessScreen';
import FailureScreen from './payment/FailureScreen';
import { bookingService } from '../services/BookingService';

/**
 * PaymentPage — Mock Payment Gateway for PRD v5.0.
 * 
 * Screens: 'form' → 'processing' → 'otp' → 'success' | 'failure'
 */

export default function PaymentPage({ 
  flight, selectedSeats, grandTotal, passengersCount, user, 
  onAuthClick, onLogout, onBack, onConfirmed 
}) {
  const [screen, setScreen] = useState('form');
  const [error, setError] = useState(null);
  const [bookingResult, setBookingResult] = useState(null);
  const [phone, setPhone] = useState(String(user?.phone || user?.Contact_no || ''));

  const passengerName = user?.Name || user?.name || user?.email || 'Passenger';
  const seat = selectedSeats[0];

  // Pre-warm the backend (wake up Render free tier) as soon as user enters payment page
  useEffect(() => {
    bookingService.ping();
  }, []);

  const handlePay = async (cardData) => {
    setScreen('processing');
    setError(null);
    try {
      // Small artificial delay to ensure the processing screen is visible (min 1.5s)
      const startTime = Date.now();
      
      const confirmRes = await bookingService.confirmBooking({
        flight_id: flight.flight_id,
        seat_id: seat.seat_id,
        passenger_id: user?.Passenger_id || user?.passenger_id || null,
        amount: grandTotal,
        phone_number: phone || '9999999999',
        card_last4: cardData.cardNumber.slice(-4),
        card_network: cardData.cardNetwork || 'Visa'
      });

      const elapsedTime = Date.now() - startTime;
      const remainingTime = Math.max(0, 1500 - elapsedTime);
      
      if (confirmRes.success) {
        const finalResult = {
          ...confirmRes,
          flight,
          selectedSeats,
          totalAmount: grandTotal,
          passengerName
        };
        setTimeout(() => {
          setBookingResult(finalResult);
          setScreen('success');
        }, remainingTime);
      } else {
        throw new Error(confirmRes.error || 'Booking confirmation failed');
      }
    } catch (err) {
      console.error('Final confirmation error:', err);
      setError(err.message || 'A server error occurred. Please try again.');
      setScreen('failure');
    }
  };

  const handleRetry = () => {
    setError(null);
    setScreen('form');
  };

  const handleNewSeat = () => {
    bookingService.unlockSeat(seat.seat_id);
    onBack();
  };

  return (
    <div className="payment-page-v5">
      <Navbar user={user} onAuthClick={onAuthClick} onLogout={onLogout} />
      
      <div className="payment-container main-content">
        {screen === 'form' && (
          <>
            <button className="btn-back-link" onClick={onBack}>← Back to Seat Selection</button>
            <div className="payment-header-v5">
              <h1>Secure Checkout</h1>
              <p>Complete your booking safely and quickly</p>
            </div>
            <PaymentForm 
              flight={flight}
              selectedSeats={selectedSeats}
              totalAmount={grandTotal}
              onPay={handlePay}
              passengerName={passengerName}
            />
          </>
        )}

        {screen === 'processing' && (
          <ProcessingScreen />
        )}

        {screen === 'success' && bookingResult && (
          <SuccessScreen 
            booking={bookingResult}
            onHome={(targetPage) => onConfirmed(bookingResult, targetPage || 'home')} 
          />
        )}

        {screen === 'failure' && (
          <FailureScreen 
            error={error}
            onRetry={handleRetry}
            onNewSeat={handleNewSeat}
          />
        )}
      </div>
    </div>
  );
}
