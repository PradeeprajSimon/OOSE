import { useEffect } from 'react';

export default function ProcessingScreen({ onComplete }) {
  useEffect(() => {
    const timer = setTimeout(() => {
      onComplete();
    }, 2000);
    return () => clearTimeout(timer);
  }, [onComplete]);

  return (
    <div className="processing-overlay">
      <div className="processing-content">
        <div className="spinner large"></div>
        <h2>Processing your payment...</h2>
        <p>Please do not close this window or click back.</p>
      </div>
    </div>
  );
}
