import { useState } from 'react'
import Navbar from './components/Navbar'
import Hero from './components/Hero'
import Auth from './components/Auth'
import StatsBar from './components/StatsBar'
import PopularRoutes from './components/PopularRoutes'
import Features from './components/Features'
import Offers from './components/Offers'
import Footer from './components/Footer'
import FlightResultsPage from './components/FlightResultsPage'
import SeatSelectionPage from './components/SeatSelectionPage'
import PaymentPage from './components/PaymentPage'
import BookingConfirmedPage from './components/BookingConfirmedPage'
import MyReservationsPage from './components/MyReservationsPage'
import './index.css'

/**
 * App — Root component managing page-level navigation via a Finite State Machine.
 *
 * OOP Concepts:
 *  - State Pattern: 'page' controls which view renders.
 *    Pages: 'home' | 'results' | 'seat-selection' | 'payment' | 'booking-confirmed'
 *  - Composition: Smaller, focused components composed together.
 *  - Encapsulation: All cross-page state (user, booking, flight) lives here.
 */

function App() {
  const [user, setUser] = useState(null)
  const [showAuth, setShowAuth] = useState(false)

  // Page-level navigation state
  const [page, setPage] = useState('home')
  const [searchParams, setSearchParams] = useState(null)
  const [selectedFlight, setSelectedFlight] = useState(null)

  // Booking funnel state — passed across payment pages
  const [paymentData, setPaymentData] = useState(null)  // { selectedSeats, grandTotal }
  const [bookingResult, setBookingResult] = useState(null) // { ticket_id, pnr, flight, ... }

  const handleLogin = (userData) => {
    setUser(userData)
    setShowAuth(false)
  }

  const handleLogout = () => setUser(null)

  const handleSearch = (params) => {
    setSearchParams(params)
    setPage('results')
  }

  const handleBook = (flight) => {
    setSelectedFlight(flight)
    setPage('seat-selection')
  }

  /** Called by SeatSelectionPage when user has selected seats and clicks "Proceed to Pay" */
  const handleProceedToPayment = (selectedSeats, grandTotal) => {
    setPaymentData({ selectedSeats, grandTotal })
    setPage('payment')
  }

  /** Called by PaymentPage after successful Razorpay verification + DB writes */
  const handleBookingConfirmed = (confirmationData, targetPage = 'booking-confirmed') => {
    setBookingResult(confirmationData)
    setPage(targetPage)
  }

  // ── My Reservations Page ────────────────────────────────────────────────
  if (page === 'my-reservations') {
    return (
      <>
        <MyReservationsPage
          user={user}
          onAuthClick={() => setShowAuth(true)}
          onLogout={handleLogout}
          onHome={() => setPage('home')}
        />
        {showAuth && <Auth onClose={() => setShowAuth(false)} onLogin={handleLogin} />}
      </>
    )
  }

  // ── Booking Confirmed Page ───────────────────────────────────────────────
  if (page === 'booking-confirmed' && bookingResult) {
    return (
      <>
        <BookingConfirmedPage
          booking={bookingResult}
          user={user}
          onAuthClick={() => setShowAuth(true)}
          onLogout={handleLogout}
          onHome={() => {
            setPage('home')
            setSelectedFlight(null)
            setPaymentData(null)
            setBookingResult(null)
          }}
        />
        {showAuth && <Auth onClose={() => setShowAuth(false)} onLogin={handleLogin} />}
      </>
    )
  }

  // ── Payment Page ────────────────────────────────────────────────────────
  if (page === 'payment' && selectedFlight && paymentData) {
    return (
      <>
        <PaymentPage
          flight={selectedFlight}
          selectedSeats={paymentData.selectedSeats}
          grandTotal={paymentData.grandTotal}
          passengersCount={searchParams?.passengers || 1}
          user={user}
          onAuthClick={() => setShowAuth(true)}
          onLogout={handleLogout}
          onBack={() => setPage('seat-selection')}
          onConfirmed={handleBookingConfirmed}
        />
        {showAuth && <Auth onClose={() => setShowAuth(false)} onLogin={handleLogin} />}
      </>
    )
  }

  // ── Seat Selection Page ──────────────────────────────────────────────────
  if (page === 'seat-selection' && selectedFlight) {
    return (
      <>
        <SeatSelectionPage
          flight={selectedFlight}
          passengersCount={searchParams?.passengers || 1}
          user={user}
          onAuthClick={() => setShowAuth(true)}
          onLogout={handleLogout}
          onBack={() => setPage('results')}
          onProceedToPayment={handleProceedToPayment}
        />
        {showAuth && <Auth onClose={() => setShowAuth(false)} onLogin={handleLogin} />}
      </>
    )
  }

  // ── Flight Results Page ──────────────────────────────────────────────────
  if (page === 'results' && searchParams) {
    return (
      <>
        <FlightResultsPage
          searchParams={searchParams}
          user={user}
          onAuthClick={() => setShowAuth(true)}
          onLogout={handleLogout}
          onBack={() => setPage('home')}
          onBook={handleBook}
        />
        {showAuth && <Auth onClose={() => setShowAuth(false)} onLogin={handleLogin} />}
      </>
    )
  }

  // ── Home Page ─────────────────────────────────────────────────────────────
  return (
    <div className="app">
      <Navbar 
        user={user} 
        onAuthClick={() => setShowAuth(true)} 
        onLogout={handleLogout} 
        onToggleReservations={() => setPage('my-reservations')}
      />
      <main>
        <Hero onSearch={handleSearch} />
        <StatsBar />
        <PopularRoutes />
        <Features />
        <Offers />
      </main>
      <Footer />
      {showAuth && <Auth onClose={() => setShowAuth(false)} onLogin={handleLogin} />}
    </div>
  )
}

export default App
