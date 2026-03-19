import { useState, useEffect, useRef } from 'react';

export default function OtpScreen({ phoneNumber, onVerify, onResend, error }) {
  const [otp, setOtp] = useState(['', '', '', '']);
  const [timer, setTimer] = useState(30);
  const inputRefs = useRef([]);

  useEffect(() => {
    if (timer > 0) {
      const interval = setInterval(() => setTimer(t => t - 1), 1000);
      return () => clearInterval(interval);
    }
  }, [timer]);

  const handleChange = (index, value) => {
    if (!/^\d*$/.test(value)) return;

    const newOtp = [...otp];
    newOtp[index] = value.slice(-1);
    setOtp(newOtp);

    // Auto-advance
    if (value && index < 3) {
      inputRefs.current[index + 1].focus();
    }
  };

  const handleKeyDown = (index, e) => {
    if (e.key === 'Backspace' && !otp[index] && index > 0) {
      inputRefs.current[index - 1].focus();
    }
  };

  const handleVerify = () => {
    onVerify(otp.join(''));
  };

  const handleResend = () => {
    setTimer(30);
    setOtp(['', '', '', '']);
    onResend();
  };

  const isComplete = otp.every(digit => digit !== '');
  const phoneStr = String(phoneNumber || '');
  const displayPhone = phoneStr.slice(-4).padStart(10, 'X');

  return (
    <div className="otp-container">
      <div className="otp-header">
        <div className="otp-icon">📟</div>
        <h2>OTP Verification</h2>
        <p>Enter the 4-digit code sent to +91 {displayPhone}</p>
      </div>

      <div className="otp-inputs">
        {otp.map((digit, i) => (
          <input
            key={i}
            ref={el => inputRefs.current[i] = el}
            type="text"
            inputMode="numeric"
            maxLength={1}
            value={digit}
            onChange={e => handleChange(i, e.target.value)}
            onKeyDown={e => handleKeyDown(i, e)}
          />
        ))}
      </div>

      {error && <div className="otp-error">{error}</div>}

      <button 
        className="btn-pay" 
        disabled={!isComplete}
        onClick={handleVerify}
      >
        Verify & Confirm Booking
      </button>

      <div className="otp-footer">
        {timer > 0 ? (
          <span>Resend OTP in 0:{timer.toString().padStart(2, '0')}</span>
        ) : (
          <button className="btn-resend" onClick={handleResend}>Resend OTP</button>
        )}
      </div>

      <div className="otp-badge">
        <span className="teal-dot"></span>
        OTP sent via real-time SMS
      </div>
    </div>
  );
}
