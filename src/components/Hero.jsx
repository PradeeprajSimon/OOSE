import { useState, useEffect, useRef } from 'react'
import { flightService } from '../services/FlightService'

/**
 * Hero component — Flight search widget.
 *
 * OOP Concepts Used:
 *  - Composition: AirportField is a sub-component (composed object).
 *  - Dependency Inversion: Uses FlightService rather than Supabase directly.
 *  - Encapsulation: All search state is encapsulated within this component.
 */

const AIRPORTS = [
  { code: 'DEL', city: 'Delhi', name: 'Indira Gandhi International' },
  { code: 'BOM', city: 'Mumbai', name: 'Chhatrapati Shivaji Maharaj International' },
  { code: 'BLR', city: 'Bangalore', name: 'Kempegowda International' },
  { code: 'MAA', city: 'Chennai', name: 'Chennai International' },
  { code: 'CCU', city: 'Kolkata', name: 'Netaji Subhas Chandra Bose International' },
  { code: 'HYD', city: 'Hyderabad', name: 'Rajiv Gandhi International' },
]

function AirportField({ label, value, onSelect, excludeCode }) {
  const [query, setQuery] = useState(value.city)
  const [open, setOpen] = useState(false)
  const ref = useRef(null)

  useEffect(() => { setQuery(value.city) }, [value])
  useEffect(() => {
    const handler = (e) => { if (ref.current && !ref.current.contains(e.target)) setOpen(false) }
    document.addEventListener('mousedown', handler)
    return () => document.removeEventListener('mousedown', handler)
  }, [])

  const filtered = AIRPORTS.filter(a =>
    a.code !== excludeCode &&
    (a.city.toLowerCase().includes(query.toLowerCase()) || a.code.toLowerCase().includes(query.toLowerCase()))
  )

  return (
    <div className="search-field" style={{ position: 'relative' }} ref={ref}>
      <div className={`search-field-inner ${open ? 'focused' : ''}`}>
        <div style={{ flex: 1 }}>
          <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#999', marginBottom: '4px' }}>{label}</div>
          <input type="text" className="airport-input" value={query}
            onChange={(e) => { setQuery(e.target.value); setOpen(true) }}
            onFocus={() => { setQuery(''); setOpen(true) }}
            placeholder={`Choose ${label}...`}
          />
          <div style={{ fontSize: '0.75rem', color: '#bbb' }}>{value.code} · {value.name.slice(0, 22)}...</div>
        </div>
      </div>
      {open && (
        <div className="dropdown-menu">
          {filtered.map(a => (
            <div key={a.code} className="dropdown-item" onMouseDown={() => { onSelect(a); setOpen(false) }}>
              <div><strong>{a.city}</strong><br /><span>{a.code} · {a.name}</span></div>
            </div>
          ))}
          {filtered.length === 0 && <div className="dropdown-item">No airports found</div>}
        </div>
      )}
    </div>
  )
}

export default function Hero({ onSearch }) {
  const [from, setFrom] = useState(AIRPORTS[0])
  const [to, setTo] = useState(AIRPORTS[1])
  const [passengers, setPassengers] = useState(1)
  const [departureDate, setDepartureDate] = useState('')

  const handleSearchClick = () => {
    if (!departureDate) { alert('Please select a departure date.'); return }
    // Pass search params up to App.jsx via onSearch callback
    onSearch({ from, to, date: departureDate, passengers })
  }

  return (
    <section className="hero">
      <div className="hero-bg" />
      <div className="container hero-content">
        <h1 className="hero-title">Fly Anywhere. <span>Pay Less.</span></h1>
        <p className="hero-subtitle">Search and book flights to 100+ destinations with the best fares.</p>

        <div className="search-widget">
          <div className="search-tabs">
            <button className="search-tab active">One Way</button>
            <button className="search-tab">Round Trip</button>
          </div>
          <div className="search-body">
            <div className="search-row">
              <AirportField label="FROM" value={from} onSelect={setFrom} excludeCode={to.code} />
              <AirportField label="TO" value={to} onSelect={setTo} excludeCode={from.code} />

              <div className="search-field-inner">
                <div style={{ flex: 1 }}>
                  <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#999', marginBottom: '4px' }}>DEPARTURE</div>
                  <input type="date"
                    style={{ border: 'none', background: 'transparent', fontSize: '1.25rem', fontWeight: 800, width: '100%', outline: 'none' }}
                    value={departureDate}
                    min={new Date().toISOString().split('T')[0]}
                    onChange={(e) => setDepartureDate(e.target.value)}
                  />
                </div>
              </div>

              <div className="search-field-inner">
                <div style={{ flex: 1 }}>
                  <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#999', marginBottom: '4px' }}>PASSENGERS</div>
                  <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                    <div style={{ fontSize: '1.25rem', fontWeight: 800 }}>{passengers} Adult{passengers > 1 ? 's' : ''}</div>
                    <div style={{ display: 'flex', gap: '8px' }}>
                      <button onClick={() => setPassengers(Math.max(1, passengers - 1))} style={{ width: '28px', height: '28px', background: '#eee', borderRadius: '50%', fontSize: '1.2rem', fontWeight: 800 }}>-</button>
                      <button onClick={() => setPassengers(Math.min(9, passengers + 1))} style={{ width: '28px', height: '28px', background: '#eee', borderRadius: '50%', fontSize: '1.2rem', fontWeight: 800 }}>+</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div style={{ display: 'flex', justifyContent: 'center' }}>
              <button className="btn-auth" style={{ maxWidth: '300px' }} onClick={handleSearchClick}>
                Search Flights ✈
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}
