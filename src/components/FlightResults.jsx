import { useState } from 'react'
import { supabase } from '../supabaseClient'

export default function FlightResults({ results, loading, error, onClose }) {
  if (loading) return (
    <div className="flight-results-overlay">
      <div className="flight-results-modal">
        <div style={{ textAlign: 'center', padding: '60px' }}>
          <div className="spinner" />
          <p style={{ marginTop: '16px', color: '#666' }}>Searching for flights...</p>
        </div>
      </div>
    </div>
  )

  if (error) return (
    <div className="flight-results-overlay">
      <div className="flight-results-modal">
        <div style={{ textAlign: 'center', padding: '60px', color: '#c0392b' }}>
          <div style={{ fontSize: '3rem' }}>⚠️</div>
          <p>{error}</p>
          <button className="btn-auth" style={{ marginTop: '20px', maxWidth: '200px' }} onClick={onClose}>
            Close
          </button>
        </div>
      </div>
    </div>
  )

  if (!results) return null

  return (
    <div className="flight-results-overlay" onClick={(e) => e.target === e.currentTarget && onClose()}>
      <div className="flight-results-modal">
        <div className="flight-results-header">
          <h2>Available Flights</h2>
          <button onClick={onClose} className="close-btn">✕</button>
        </div>
        <div className="flight-results-body">
          {results.length === 0 ? (
            <div style={{ textAlign: 'center', padding: '60px', color: '#999' }}>
              <div style={{ fontSize: '3rem' }}>✈️</div>
              <p style={{ marginTop: '16px' }}>No flights found for this route.</p>
            </div>
          ) : (
            results.map((flight, i) => (
              <div key={i} className="flight-card">
                <div className="flight-card-left">
                  <div className="flight-airline">✈ {flight.airline || 'SkyLink Airlines'}</div>
                  <div className="flight-number">{flight.flight_no || flight.id}</div>
                </div>
                <div className="flight-card-center">
                  <div className="flight-time">{flight.departure_time || '—'}</div>
                  <div className="flight-route">
                    {flight.source} → {flight.destination}
                  </div>
                  <div className="flight-time">{flight.arrival_time || '—'}</div>
                </div>
                <div className="flight-card-right">
                  <div className="flight-price">₹{flight.price?.toLocaleString() || '—'}</div>
                  <div className="flight-class">{flight.class || 'Economy'}</div>
                  <button className="btn-auth" style={{ padding: '10px 20px', fontSize: '0.85rem' }}>
                    Book
                  </button>
                </div>
              </div>
            ))
          )}
        </div>
      </div>
    </div>
  )
}
