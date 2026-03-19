import { useState, useMemo } from 'react';

export default function PaymentForm({ flight, selectedSeats, totalAmount, onPay, passengerName }) {
  const [formData, setFormData] = useState({
    cardNumber: '',
    cardName: '',
    expiry: '',
    cvv: ''
  });
  const [errors, setErrors] = useState({});

  const passengersCount = 1; // Simplification for now
  const baseFare = Number(flight.fare || 0);
  const seatFee = selectedSeats.reduce((s, seat) => s + (seat.seat_class === 'Business' ? 2500 : 0), 0);
  const taxes = Math.round((baseFare + seatFee) * 0.18);

  // Card network detection
  const cardNetwork = useMemo(() => {
    const firstDigit = formData.cardNumber.replace(/\s/g, '').charAt(0);
    if (firstDigit === '4') return 'Visa';
    if (firstDigit === '5') return 'Mastercard';
    return null;
  }, [formData.cardNumber]);

  const formatCardNumber = (val) => {
    const digits = val.replace(/\D/g, '').substring(0, 16);
    return digits.replace(/(\d{4})(?=\d)/g, '$1 ').trim();
  };

  const formatExpiry = (val) => {
    const digits = val.replace(/\D/g, '').substring(0, 4);
    if (digits.length > 2) return `${digits.substring(0, 2)}/${digits.substring(2, 4)}`;
    return digits;
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    let formattedValue = value;

    if (name === 'cardNumber') formattedValue = formatCardNumber(value);
    if (name === 'expiry') formattedValue = formatExpiry(value);
    if (name === 'cvv') formattedValue = value.replace(/\D/g, '').substring(0, 3);

    setFormData(prev => ({ ...prev, [name]: formattedValue }));
    if (errors[name]) setErrors(prev => ({ ...prev, [name]: null }));
  };

  const validate = () => {
    const newErrors = {};
    const cleanCard = formData.cardNumber.replace(/\s/g, '');
    
    if (cleanCard.length !== 16) newErrors.cardNumber = 'Enter 16-digit card number';
    if (formData.cardName.trim().length < 2) newErrors.cardName = 'Enter name on card';
    
    const expiryMatch = formData.expiry.match(/^(\d{2})\/(\d{2})$/);
    if (!expiryMatch) {
      newErrors.expiry = 'MM/YY required';
    } else {
      const [_, m, y] = expiryMatch;
      const expDate = new Date(2000 + parseInt(y), parseInt(m) - 1);
      if (expDate < new Date()) newErrors.expiry = 'Card expired';
    }
    
    if (formData.cvv.length !== 3) newErrors.cvv = '3 digits';

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (validate()) {
      onPay(formData);
    }
  };

  const isFormValid = formData.cardNumber.length >= 16 && 
                      formData.cardName.length >= 2 && 
                      formData.expiry.length === 5 && 
                      formData.cvv.length === 3;

  return (
    <div className="payment-layout">
      {/* Left: Card Form */}
      <div className="payment-card-side">
        <h3 className="payment-section-title">Card Details</h3>
        <form onSubmit={handleSubmit} className="card-form">
          <div className="form-group">
            <label>Card Number</label>
            <div className="input-with-logo">
              <input 
                type="text"
                name="cardNumber"
                placeholder="0000 0000 0000 0000"
                value={formData.cardNumber}
                onChange={handleChange}
                className={errors.cardNumber ? 'error' : ''}
              />
              {cardNetwork === 'Visa' && <span className="card-logo visa">Visa</span>}
              {cardNetwork === 'Mastercard' && <span className="card-logo mc">Mastercard</span>}
            </div>
            {errors.cardNumber && <span className="error-text">{errors.cardNumber}</span>}
          </div>

          <div className="form-group">
            <label>Cardholder Name</label>
            <input 
              type="text"
              name="cardName"
              placeholder="Full Name"
              value={formData.cardName}
              onChange={handleChange}
              className={errors.cardName ? 'error' : ''}
            />
            {errors.cardName && <span className="error-text">{errors.cardName}</span>}
          </div>

          <div className="form-row">
            <div className="form-group">
              <label>Expiry Date</label>
              <input 
                type="text"
                name="expiry"
                placeholder="MM/YY"
                value={formData.expiry}
                onChange={handleChange}
                className={errors.expiry ? 'error' : ''}
              />
              {errors.expiry && <span className="error-text">{errors.expiry}</span>}
            </div>
            <div className="form-group">
              <label>CVV</label>
              <input 
                type="password"
                name="cvv"
                placeholder="***"
                value={formData.cvv}
                onChange={handleChange}
                className={errors.cvv ? 'error' : ''}
              />
              {errors.cvv && <span className="error-text">{errors.cvv}</span>}
            </div>
          </div>

          <button 
            type="submit" 
            className="btn-pay" 
            disabled={!isFormValid}
          >
            🔒 Pay ₹{totalAmount.toLocaleString('en-IN')} Securely
          </button>
        </form>
      </div>

      {/* Right: Order Summary */}
      <div className="payment-summary-side">
        <h3 className="payment-section-title">Order Summary</h3>
        <div className="summary-flight-mini">
          <div className="mini-route">{flight.source} → {flight.destination}</div>
          <div className="mini-details">{new Date(flight.departure_time).toDateString()} | {passengerName}</div>
          <div className="mini-seats">
            {selectedSeats.map(s => (
              <span key={s.seat_id} className="mini-seat-badge">💺 {s.seat_number} ({s.seat_class})</span>
            ))}
          </div>
        </div>
        
        <div className="fare-breakdown mini">
          <div className="fare-row"><span>Base Fare</span><span>₹{baseFare.toLocaleString('en-IN')}</span></div>
          {seatFee > 0 && <div className="fare-row"><span>Seat Selection</span><span>+₹{seatFee.toLocaleString('en-IN')}</span></div>}
          <div className="fare-row"><span>Taxes & GST (18%)</span><span>₹{taxes.toLocaleString('en-IN')}</span></div>
          <hr />
          <div className="fare-row total-row">
            <span>Total</span>
            <span className="total-amount">₹{totalAmount.toLocaleString('en-IN')}</span>
          </div>
        </div>

        <div className="secure-badge">
          <span className="lock-icon">🔒</span>
          <div>
            <strong>100% Secure Payment</strong>
            <p>Your details are protected with bank-grade encryption</p>
          </div>
        </div>
      </div>
    </div>
  );
}
