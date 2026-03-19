import { useState, useEffect } from 'react'
import { flightService } from '../services/FlightService'
import { seatService } from '../services/SeatService'
import Navbar from './Navbar'

/**
 * FlightResultsPage — Full-page flight results view.
 *
 * OOP Concepts: Composition, Dependency Inversion, Single Responsibility.
 */

const SORT_OPTIONS = [
  { value: 'fare', label: '💰 Lowest Price' },
  { value: 'departure_time', label: '🕐 Earliest Departure' },
]

/**
 * FlightCard — Displays a single flight result.
 * Adapts to both old (airline, flight_no, etc.) and minimal (just fare, departure_time) schemas.
 */
function FlightCard({ flight, onBook }) {
  const depTime = flightService.formatTime(flight.departure_time)
  const arrTime = flight.arrival_time ? flightService.formatTime(flight.arrival_time) : null
  const duration = flight.arrival_time
    ? flightService.formatDuration(flight.departure_time, flight.arrival_time)
    : null
  const airline = flight.airline || 'SkyLink Airlines'
  const flightNo = flight.flight_no || `SL-${flight.flight_id}`
  const flightClass = flight.class || 'Economy'
  const fare = Number(flight.fare || 0)

  return (
    <div className="fr-card">
      <div className="fr-card-airline">
        <span className="fr-airline-name">✈ {airline}</span>
        <span className="fr-flight-no">{flightNo}</span>
      </div>

      <div className="fr-card-times">
        <div className="fr-time-block">
          <div className="fr-time">{depTime}</div>
          <div className="fr-code">{flight.source}</div>
        </div>
        {arrTime && (
          <>
            <div className="fr-duration-block">
              <div className="fr-duration-line">
                <div className="fr-dot" /><div className="fr-line" /><div className="fr-dot" />
              </div>
              <div className="fr-duration-label">{duration}</div>
            </div>
            <div className="fr-time-block">
              <div className="fr-time">{arrTime}</div>
              <div className="fr-code">{flight.destination}</div>
            </div>
          </>
        )}
        {!arrTime && (
          <div className="fr-time-block">
            <div className="fr-time" style={{ color: '#999' }}>→</div>
            <div className="fr-code">{flight.destination}</div>
          </div>
        )}
      </div>

      <div className="fr-card-class">
        <span className="fr-class-badge">{flightClass}</span>
        {flight.live_seats !== undefined && (
          <span className="fr-seats">{flight.live_seats} seats left</span>
        )}
      </div>

      <div className="fr-card-price">
        <div className="fr-price">₹{fare.toLocaleString('en-IN')}</div>
        <div className="fr-price-note">per person</div>
        <button className="btn-auth fr-book-btn" onClick={() => onBook(flight)}>
          Book Now
        </button>
      </div>
    </div>
  )
}

export default function FlightResultsPage({ searchParams, user, onAuthClick, onLogout, onBack, onBook }) {
  const { from, to, date, passengers } = searchParams

  const [results, setResults] = useState(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [sortBy, setSortBy] = useState('fare')

  // Auto-search when the page loads
  useEffect(() => {
    handleSearch()
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  async function handleSearch(newSort = sortBy) {
    setLoading(true); setError('')
    try {
      const data = await flightService.search(from.code, to.code, date, newSort)
      
      // Fetch live seat availability for each flight
      const flightsWithLiveSeats = await Promise.all(data.map(async (f) => {
        try {
          const liveSeats = await seatService.getAvailableSeatsCount(f.flight_id)
          return { ...f, live_seats: liveSeats }
        } catch (e) {
          return { ...f, live_seats: null } // Fallback gracefully
        }
      }))

      setResults(flightsWithLiveSeats)
      setSortBy(newSort)
    } catch (err) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  const handleSortChange = (val) => {
    setSortBy(val)
    handleSearch(val)
  }

  const handleBook = (flight) => {
    if (!user) {
      alert('Please log in to book a flight.')
      onAuthClick()
      return
    }
    // Pass flight info back up to App.jsx to navigate to Seat Selection
    onBook(flight)
  }

  return (
    <div className="app">
      <Navbar user={user} onAuthClick={onAuthClick} onLogout={onLogout} />

      <div className="fr-page">
        {/* Page Header */}
        <div className="fr-header">
          <div className="container">
            <button className="fr-back-btn" onClick={onBack}>← Back to Search</button>
            <h1 className="fr-title">
              {from.city} → {to.city}
            </h1>
            <p className="fr-subtitle">
              {new Date(date).toLocaleDateString('en-IN', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' })}
              &nbsp;·&nbsp; {passengers} Passenger{passengers > 1 ? 's' : ''}
            </p>
          </div>
        </div>

        <div className="container fr-body">
          {/* Sort Bar */}
          <div className="fr-sort-bar">
            <span style={{ fontWeight: 600, color: '#555' }}>Sort by:</span>
            {SORT_OPTIONS.map(opt => (
              <button
                key={opt.value}
                className={`fr-sort-btn ${sortBy === opt.value ? 'active' : ''}`}
                onClick={() => handleSortChange(opt.value)}
              >
                {opt.label}
              </button>
            ))}
            {results && (
              <span className="fr-count">{results.length} flight{results.length !== 1 ? 's' : ''} found</span>
            )}
          </div>

          {/* Loading State */}
          {loading && (
            <div className="fr-state-box">
              <div className="spinner" />
              <p>Fetching best flights for you...</p>
            </div>
          )}

          {/* Error State */}
          {!loading && error && (
            <div className="fr-state-box" style={{ color: '#c0392b' }}>
              <div style={{ fontSize: '2.5rem' }}>⚠️</div>
              <p>{error}</p>
              <button className="btn-auth" onClick={() => handleSearch()} style={{ maxWidth: '200px', marginTop: '16px' }}>
                Try Again
              </button>
            </div>
          )}

          {/* Empty State */}
          {!loading && !error && results && results.length === 0 && (
            <div className="fr-state-box">
              <div style={{ fontSize: '3rem' }}>🔍</div>
              <h3 style={{ marginTop: '12px', color: '#333' }}>No flights found</h3>
              <p style={{ color: '#999', marginTop: '8px' }}>
                No flights available from {from.city} to {to.city} on this date.
              </p>
              <button className="btn-auth" onClick={onBack} style={{ maxWidth: '220px', marginTop: '20px' }}>
                ← Modify Search
              </button>
            </div>
          )}

          {/* Flight Cards */}
          {!loading && !error && results && results.length > 0 && (
            <div className="fr-list">
              {results.map((flight, i) => (
                <FlightCard key={flight.flight_id || i} flight={flight} onBook={handleBook} />
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
