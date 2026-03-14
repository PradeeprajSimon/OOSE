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
import './index.css'

/**
 * App — Root component managing page-level navigation state.
 *
 * OOP Concepts Used:
 *  - State as a Finite State Machine: 'page' state controls which page is rendered.
 *    Pages are: 'home' and 'results'. (State Pattern)
 *  - Composition: The app is composed of smaller, focused components.
 *  - Encapsulation: Auth state, user state, and search params are all managed here
 *    and passed down via props. Child components cannot directly mutate these.
 */

function App() {
  const [user, setUser] = useState(null)
  const [showAuth, setShowAuth] = useState(false)

  // Page-level navigation (State Pattern)
  const [page, setPage] = useState('home') // 'home' | 'results'
  const [searchParams, setSearchParams] = useState(null)

  const handleLogin = (userData) => {
    setUser(userData)
    setShowAuth(false)
  }

  const handleLogout = () => setUser(null)

  // Called by Hero when Search button is clicked
  const handleSearch = (params) => {
    setSearchParams(params)
    setPage('results')
  }

  // Show the Flight Results page
  if (page === 'results' && searchParams) {
    return (
      <>
        <FlightResultsPage
          searchParams={searchParams}
          user={user}
          onAuthClick={() => setShowAuth(true)}
          onLogout={handleLogout}
          onBack={() => setPage('home')}
        />
        {showAuth && (
          <Auth onClose={() => setShowAuth(false)} onLogin={handleLogin} />
        )}
      </>
    )
  }

  // Show the main Dashboard/Home page
  return (
    <div className="app">
      <Navbar user={user} onAuthClick={() => setShowAuth(true)} onLogout={handleLogout} />

      <main>
        <Hero onSearch={handleSearch} />
        <StatsBar />
        <PopularRoutes />
        <Features />
        <Offers />
      </main>

      <Footer />

      {showAuth && (
        <Auth onClose={() => setShowAuth(false)} onLogin={handleLogin} />
      )}
    </div>
  )
}

export default App
