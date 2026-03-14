import { useState, useEffect } from 'react'

export default function Navbar({ user, onAuthClick, onLogout }) {
  const [scrolled, setScrolled] = useState(false)

  useEffect(() => {
    const handleScroll = () => setScrolled(window.scrollY > 20)
    window.addEventListener('scroll', handleScroll)
    return () => window.removeEventListener('scroll', handleScroll)
  }, [])

  return (
    <nav className={`navbar ${scrolled ? 'scrolled' : ''}`}>
      <div className="container navbar-inner">
        <a href="#" className="navbar-logo">
          <div className="navbar-logo-icon">✈</div>
          <div className="navbar-logo-text">
            <span className="navbar-logo-name">SkyLink</span>
            <span className="navbar-logo-tagline">Airlines</span>
          </div>
        </a>

        <div className="navbar-actions">
          {user ? (
            <div className="profile-btn">
              <div className="profile-avatar">{(user.Name || user.name)?.[0] || 'U'}</div>
              <span>{user.Name || user.name || 'User'}</span>
              <button 
                onClick={onLogout} 
                className="btn-outline-white" 
                style={{ marginLeft: '12px', padding: '6px 12px', fontSize: '0.75rem' }}
              >
                Logout
              </button>
            </div>
          ) : (
            <button className="btn-sky" onClick={onAuthClick}>
              Sign Up / Login
            </button>
          )}
        </div>
      </div>
    </nav>
  )
}
