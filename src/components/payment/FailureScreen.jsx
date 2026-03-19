export default function FailureScreen({ error, onRetry, onNewSeat }) {
  return (
    <div className="failure-screen">
      <div className="failure-icon">❌</div>
      <h1>Payment Failed</h1>
      <p className="failure-reason">{error || 'Something went wrong while processing your payment.'}</p>
      
      <div className="failure-actions">
        <button className="btn-retry" onClick={onRetry}>Try Again</button>
        <button className="btn-new-seat" onClick={onNewSeat}>Choose Different Seat</button>
      </div>

      <p className="failure-support">If your money was deducted, it will be refunded within 5-7 working days.</p>
    </div>
  );
}
