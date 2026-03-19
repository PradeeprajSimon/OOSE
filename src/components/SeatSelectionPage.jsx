import { useState, useEffect } from 'react'
import { seatService } from '../services/SeatService'
import { flightService } from '../services/FlightService'
import Navbar from './Navbar'

/**
 * SeatSelectionPage — Real aircraft cabin layout seat selector.
 *
 * OOP Concepts: State as FSM, Encapsulation, Composition.
 *
 * Layout:
 *   Business (rows 1–3): A B | D E   (2+2, no C or F)
 *   Economy  (rows 4–20): A B C | D E F  (3+3)
 */

const SEAT_PRICES = {
  Business: 2500,
  Economy: 0
}

// Which columns exist per class, split by aisle side
const CLASS_COLUMNS = {
  Business: { left: ['A', 'B'], right: ['D', 'E'] },
  Economy:  { left: ['A', 'B', 'C'], right: ['D', 'E', 'F'] }
}

function getSeatClass(rowNum) {
  return rowNum <= 3 ? 'Business' : 'Economy'
}

export default function SeatSelectionPage({ flight, passengersCount, user, onAuthClick, onLogout, onBack, onProceedToPayment }) {
  const [seats, setSeats] = useState([])
  const [selectedSeats, setSelectedSeats] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [activeTab, setActiveTab] = useState('fares')

  useEffect(() => {
    fetchSeats()
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [flight])

  async function fetchSeats() {
    setLoading(true); setError('')
    try {
      const data = await seatService.getSeatsForFlight(flight.flight_id)
      setSeats(data)
    } catch (err) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  const isSeatLocked = (seat) => {
    if (!seat.locked_until) return false
    return new Date(seat.locked_until) > new Date()
  }

  const isSeatUnavailable = (seat) => seat.is_booked || isSeatLocked(seat)

  const toggleSeat = (seat) => {
    if (isSeatUnavailable(seat)) return

    if (selectedSeats.find(s => s.seat_id === seat.seat_id)) {
      setSelectedSeats(selectedSeats.filter(s => s.seat_id !== seat.seat_id))
    } else {
      if (selectedSeats.length >= passengersCount) {
        alert(`You can only select ${passengersCount} seat(s) for this booking.`)
        return
      }
      setSelectedSeats([...selectedSeats, seat])
    }
  }

  const handleProceed = () => {
    if (selectedSeats.length !== passengersCount) return
    // Navigate to payment page — actual seat lock happens server-side in the Edge Function
    onProceedToPayment(selectedSeats, grandTotal)
  }

  // Build row map from fetched seats
  const rowMap = {}
  seats.forEach(seat => {
    const rowNum = parseInt(seat.seat_number.replace(/\D/g, ''))
    if (!rowMap[rowNum]) rowMap[rowNum] = []
    rowMap[rowNum].push(seat)
  })
  const sortedRows = Object.keys(rowMap).map(Number).sort((a, b) => a - b)

  // Financial Math
  const baseFareTotal = Number(flight.fare || 0) * passengersCount
  const seatFeesTotal = selectedSeats.reduce((sum, seat) => sum + (SEAT_PRICES[seat.seat_class] || 0), 0)
  const taxes = Math.round((baseFareTotal + seatFeesTotal) * 0.18)
  const grandTotal = baseFareTotal + seatFeesTotal + taxes

  // Flight Info Formatting
  const depTime = flightService.formatTime(flight.departure_time)
  const arrTime = flight.arrival_time ? flightService.formatTime(flight.arrival_time) : null
  const duration = flight.arrival_time ? flightService.formatDuration(flight.departure_time, flight.arrival_time) : null
  const airline = flight.airline || 'SkyLink Airlines'
  const flightNo = flight.flight_no || `SL-${flight.flight_id}`

  return (
    <div className="bg-white" style={{ height: '100vh', display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
      <Navbar user={user} onAuthClick={onAuthClick} onLogout={onLogout} />

      <div className="seat-page-split">
        {/* =========================================
            LEFT COLUMN: AIRPLANE MAP
            ========================================= */}
        <div className="seat-plane-column">
          <div className="plane-header">
            <button className="plane-back-btn" onClick={onBack}>← Back</button>
            <div>
              <h3>Select Seats</h3>
              <p>Choose {passengersCount} seat(s) · {flight.source} → {flight.destination}</p>
            </div>
          </div>

          <div className="plane-container-wrapper">
            <div className="airplane-fuselage dense-fuselage">

              {loading && <div className="spinner" style={{ margin: '100px auto' }} />}
              {error && <div style={{ color: 'red', textAlign: 'center', padding: '20px' }}>{error}</div>}

              {!loading && !error && (
                <div className="seat-grid dense-grid">

                  {sortedRows.map(rowNum => {
                    const rowSeats = rowMap[rowNum].sort((a, b) => a.seat_number.localeCompare(b.seat_number))
                    const seatClass = getSeatClass(rowNum)
                    const columns = CLASS_COLUMNS[seatClass]

                    // Split into left and right groups by column letter
                    const col = (seat) => seat.seat_number.replace(/\d/g, '')
                    const leftSeats = rowSeats.filter(s => columns.left.includes(col(s)))
                    const rightSeats = rowSeats.filter(s => columns.right.includes(col(s)))

                    return (
                      <div key={rowNum} style={{ width: '100%' }}>
                        {rowNum === 1 && (
                          <div className="class-divider-dense" style={{ marginTop: 0 }}>
                            <hr /><span>Business Class (+₹2,500)</span><hr />
                          </div>
                        )}
                        {rowNum === 4 && (
                          <div className="class-divider-dense">
                            <hr /><span>Economy Class (Free)</span><hr />
                          </div>
                        )}

                        {/* Column header letters — shown only for first row of each class */}
                        {(rowNum === 1 || rowNum === 4) && (
                          <div className={`seat-col-header ${seatClass === 'Business' ? 'biz-header' : ''}`}>
                            {columns.left.map(l => <span key={l}>{l}</span>)}
                            <div className="aisle-spacer-dense" />
                            {columns.right.map(r => <span key={r}>{r}</span>)}
                          </div>
                        )}

                        <div className="seat-row dense-row">
                          {/* Left group */}
                          <div className="seat-group dense-group">
                            {leftSeats.map(seat => {
                              const isSelected = selectedSeats.some(s => s.seat_id === seat.seat_id)
                              const unavailable = isSeatUnavailable(seat)
                              const locked = isSeatLocked(seat)
                              return (
                                <button
                                  key={seat.seat_id}
                                  className={`seat-btn dense-btn${unavailable ? (locked ? ' locked' : ' booked') : ''}${isSelected ? ' selected' : ''}`}
                                  onClick={() => toggleSeat(seat)}
                                  disabled={unavailable}
                                  title={unavailable
                                    ? (locked ? 'Temporarily held by another user' : 'Already booked')
                                    : `${seat.seat_number} — ${seat.seat_class}${seat.seat_class === 'Business' ? ' (+₹2,500)' : ' (Free)'}`
                                  }
                                >
                                  {isSelected ? '✓' : (unavailable ? '×' : col(seat))}
                                </button>
                              )
                            })}
                          </div>

                          {/* Aisle marker with row number */}
                          <div className="aisle-marker-dense">{rowNum}</div>

                          {/* Right group */}
                          <div className="seat-group dense-group">
                            {rightSeats.map(seat => {
                              const isSelected = selectedSeats.some(s => s.seat_id === seat.seat_id)
                              const unavailable = isSeatUnavailable(seat)
                              const locked = isSeatLocked(seat)
                              return (
                                <button
                                  key={seat.seat_id}
                                  className={`seat-btn dense-btn${unavailable ? (locked ? ' locked' : ' booked') : ''}${isSelected ? ' selected' : ''}`}
                                  onClick={() => toggleSeat(seat)}
                                  disabled={unavailable}
                                  title={unavailable
                                    ? (locked ? 'Temporarily held by another user' : 'Already booked')
                                    : `${seat.seat_number} — ${seat.seat_class}${seat.seat_class === 'Business' ? ' (+₹2,500)' : ' (Free)'}`
                                  }
                                >
                                  {isSelected ? '✓' : (unavailable ? '×' : col(seat))}
                                </button>
                              )
                            })}
                          </div>
                        </div>
                      </div>
                    )
                  })}
                </div>
              )}
            </div>
          </div>

          {/* Legend with color swatches */}
          <div className="seat-legend-bar">
            <span><div className="seat-swatch swatch-available" /><span>Available</span></span>
            <span><div className="seat-swatch swatch-booked" /><span>Booked</span></span>
            <span><div className="seat-swatch swatch-locked" /><span>Held</span></span>
            <span><div className="seat-swatch swatch-selected" /><span>Selected</span></span>
          </div>
        </div>

        {/* =========================================
            RIGHT COLUMN: TABBED INFORMATION PANEL
            ========================================= */}
        <div className="seat-info-column">
          <div className="info-header">
            <h2 className="info-route">{flight.source} → {flight.destination}</h2>
            <p className="info-sub">{new Date(flight.departure_time).toLocaleDateString('en-IN', { weekday: 'short', month: 'short', day: 'numeric' })} | {passengersCount} Passenger(s)</p>
          </div>

          <div className="info-tabs">
            <button className={`tab-btn ${activeTab === 'fares' ? 'active' : ''}`} onClick={() => setActiveTab('fares')}>Seat &amp; Fare</button>
            <button className={`tab-btn ${activeTab === 'details' ? 'active' : ''}`} onClick={() => setActiveTab('details')}>Flight Details</button>
            <button className={`tab-btn ${activeTab === 'amenities' ? 'active' : ''}`} onClick={() => setActiveTab('amenities')}>Amenities</button>
            <button className={`tab-btn ${activeTab === 'policies' ? 'active' : ''}`} onClick={() => setActiveTab('policies')}>Policies</button>
          </div>

          <div className="tab-content">

            {/* TAB 1: FARE & PROCEED */}
            {activeTab === 'fares' && (
              <div className="tab-pane fare-pane">
                <div className="fare-breakdown">
                  <div className="fare-row">
                    <span>Base Fare ({passengersCount}x)</span>
                    <span>₹{baseFareTotal.toLocaleString('en-IN')}</span>
                  </div>
                  <div className="fare-row">
                    <span>
                      Seat Selection
                      {selectedSeats.length > 0 && <span className="seat-tags"> ({selectedSeats.map(s => s.seat_number).join(', ')})</span>}
                    </span>
                    <span style={{ color: seatFeesTotal > 0 ? 'var(--navy)' : 'var(--green)' }}>
                      {seatFeesTotal > 0 ? `+₹${seatFeesTotal.toLocaleString('en-IN')}` : 'Free'}
                    </span>
                  </div>
                  <div className="fare-row">
                    <span>Taxes &amp; GST (18%)</span>
                    <span>₹{taxes.toLocaleString('en-IN')}</span>
                  </div>
                  <hr className="fare-divider" />
                  <div className="fare-row total-row">
                    <span>Total Amount</span>
                    <span className="total-amount">₹{grandTotal.toLocaleString('en-IN')}</span>
                  </div>
                </div>

                <div className="selected-seats-card">
                  <h4>Selected Seats ({selectedSeats.length}/{passengersCount})</h4>
                  <div className="seat-chips">
                    {selectedSeats.length === 0 && <span className="no-seats">No seats selected yet. Click on the map to select.</span>}
                    {selectedSeats.map(seat => (
                      <div key={seat.seat_id} className={`seat-chip ${seat.seat_class.toLowerCase()}`}>
                        <strong>{seat.seat_number}</strong>
                        <small>{seat.seat_class}</small>
                      </div>
                    ))}
                  </div>
                </div>

                <div className="proceed-box">
                  <button
                    className="btn-auth btn-proceed"
                    onClick={handleProceed}
                    disabled={selectedSeats.length !== passengersCount}
                  >
                    {selectedSeats.length === passengersCount
                      ? `Proceed to Pay ₹${grandTotal.toLocaleString('en-IN')} →`
                      : `Select ${passengersCount - selectedSeats.length} more seat(s)`}
                  </button>
                </div>
              </div>
            )}

            {/* TAB 2: FLIGHT DETAILS */}
            {activeTab === 'details' && (
              <div className="tab-pane detail-pane">
                <div className="detail-airline">
                  <strong>✈ {airline}</strong> • {flightNo}
                </div>
                <div className="timeline-container">
                  <div className="timeline-point">
                    <div className="timeline-time">{depTime}</div>
                    <div className="timeline-dot"></div>
                    <div className="timeline-code">
                      <h4>{flight.source}</h4>
                      <p>Terminal 1, Departure Gates</p>
                    </div>
                  </div>
                  <div className="timeline-line">
                    <span className="timeline-duration">{duration} Flight</span>
                  </div>
                  <div className="timeline-point">
                    <div className="timeline-time">{arrTime || '—'}</div>
                    <div className="timeline-dot"></div>
                    <div className="timeline-code">
                      <h4>{flight.destination}</h4>
                      <p>Terminal 2, Arrivals</p>
                    </div>
                  </div>
                </div>
              </div>
            )}

            {/* TAB 3: AMENITIES */}
            {activeTab === 'amenities' && (
              <div className="tab-pane amenities-pane">
                <h3 className="pane-title">What&apos;s included in this flight:</h3>
                <div className="amenity-grid">
                  <div className="amenity-item">
                    <div className="amenity-icon">🥡</div>
                    <strong>Complimentary Meals</strong>
                    <p>Hot meals served in Business, snacks in Economy.</p>
                  </div>
                  <div className="amenity-item">
                    <div className="amenity-icon">💻</div>
                    <strong>In-flight WiFi</strong>
                    <p>Available for purchase after takeoff.</p>
                  </div>
                  <div className="amenity-item">
                    <div className="amenity-icon">🔌</div>
                    <strong>USB Power</strong>
                    <p>Available at every seat in all classes.</p>
                  </div>
                  <div className="amenity-item">
                    <div className="amenity-icon">🎬</div>
                    <strong>Entertainment</strong>
                    <p>Seatback screens with movies &amp; shows.</p>
                  </div>
                </div>
              </div>
            )}

            {/* TAB 4: POLICIES */}
            {activeTab === 'policies' && (
              <div className="tab-pane policies-pane">
                <div className="policy-box">
                  <h4>Baggage Allowance</h4>
                  <ul className="policy-list">
                    <li><strong>Cabin Bag:</strong> 7 kg per passenger</li>
                    <li><strong>Check-in Bag:</strong> 15 kg per passenger</li>
                    <li>Extra weight charged at ₹500/kg at the counter.</li>
                  </ul>
                </div>
                <div className="policy-box mt-4">
                  <h4>Cancellation Policy</h4>
                  <ul className="policy-list">
                    <li><strong>0–2 hours before departure:</strong> Non-refundable</li>
                    <li><strong>2–48 hours before departure:</strong> ₹3,500 cancellation fee</li>
                    <li><strong>48+ hours before departure:</strong> ₹3,000 cancellation fee</li>
                  </ul>
                </div>
              </div>
            )}

          </div>
        </div>
      </div>
    </div>
  )
}
