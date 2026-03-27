import { useEffect } from 'react';

export default function ProcessingScreen() {
  return (
    <div className="processing-overlay">
      <div className="processing-content">
        <div className="spinner large"></div>
        <h2>Processing your payment...</h2>
        <p>Please do not close this window or click back.</p>
        <p className="mt-4" style={{ fontSize: '0.85rem', color: '#666' }}>
          Communicating with secure payment gateway...
        </p>
      </div>
    </div>
  );
}
