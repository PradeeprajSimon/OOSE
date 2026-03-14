import { useState } from 'react'
import { authService } from '../services/AuthService'
import { passengerService } from '../services/PassengerService'

export default function Auth({ onClose, onLogin }) {
  const [step, setStep] = useState(1)      // 1: Email, 2: OTP, 3: Details
  const [isSignUp, setIsSignUp] = useState(false)
  const [email, setEmail] = useState('')
  const [otp, setOtp] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const [details, setDetails] = useState({
    name: '', contact_no: '', age: '', gender: 'Male', address: ''
  })

  const handleEmailSubmit = async (e) => {
    e.preventDefault()
    setLoading(true); setError('')
    try {
      await authService.sendOtp(email)
      setStep(2)
    } catch (err) {
      setError(err.message)
    } finally { setLoading(false) }
  }

  const handleOtpVerify = async (e) => {
    e.preventDefault()
    setLoading(true); setError('')
    try {
      await authService.verifyOtp(email, otp)
      const existing = await passengerService.getByEmail(email)
      if (existing) {
        // Returning user — log in directly
        onLogin(existing)
      } else {
        // New user — collect passenger details
        setStep(3)
      }
    } catch (err) {
      setError(err.message)
    } finally { setLoading(false) }
  }

  const handleDetailsSubmit = async (e) => {
    e.preventDefault()
    setLoading(true); setError('')
    try {
      const user = await authService.getCurrentUser()
      const passenger = await passengerService.create(email, details, user?.id)
      onLogin(passenger)
    } catch (err) {
      setError(err.message)
    } finally { setLoading(false) }
  }

  const titles = {
    1: isSignUp ? 'Create Your Account' : 'Welcome Back',
    2: 'Verify Your Email',
    3: 'Complete Your Profile',
  }
  const subtitles = {
    1: isSignUp ? 'Enter your email to get started' : 'Enter your email to receive an OTP',
    2: `We sent an 8-digit code to ${email}`,
    3: 'Tell us about yourself to finish sign up',
  }

  return (
    <div className="auth-overlay" onClick={(e) => e.target === e.currentTarget && onClose()}>
      <div className="auth-modal">
        <div className="auth-header">
          <h2 className="auth-title">{titles[step]}</h2>
          <p className="auth-subtitle">{subtitles[step]}</p>
        </div>

        <div className="auth-body">
          {error && (
            <div style={{ background: '#fff0f0', color: '#c0392b', padding: '12px 16px', borderRadius: '8px', marginBottom: '20px', fontSize: '0.9rem' }}>
              ⚠️ {error}
            </div>
          )}

          {/* ── Step 1: Email ── */}
          {step === 1 && (
            <form onSubmit={handleEmailSubmit}>
              <div className="form-group">
                <label className="form-label">Email Address</label>
                <input type="email" className="form-input" placeholder="name@example.com"
                  value={email} onChange={(e) => setEmail(e.target.value)} required />
              </div>
              <button type="submit" className="btn-auth" disabled={loading}>
                {loading ? 'Sending OTP...' : 'Get OTP →'}
              </button>
              {/* Sign Up / Login Toggle */}
              <p style={{ textAlign: 'center', marginTop: '20px', fontSize: '0.9rem', color: '#888' }}>
                {isSignUp ? 'Already have an account? ' : "Don't have an account? "}
                <span
                  style={{ color: 'var(--navy)', fontWeight: 700, cursor: 'pointer' }}
                  onClick={() => { setIsSignUp(!isSignUp); setError('') }}
                >
                  {isSignUp ? 'Login' : 'Sign Up'}
                </span>
              </p>
            </form>
          )}

          {/* ── Step 2: OTP (8 digits from Supabase) ── */}
          {step === 2 && (
            <form onSubmit={handleOtpVerify}>
              <div className="form-group">
                <label className="form-label">Enter 8-Digit OTP</label>
                <input
                  type="text"
                  className="form-input"
                  style={{ textAlign: 'center', letterSpacing: '8px', fontSize: '1.5rem' }}
                  placeholder="--------"
                  maxLength="8"
                  inputMode="numeric"
                  value={otp}
                  onChange={(e) => setOtp(e.target.value.replace(/\D/g, ''))}
                  required
                />
                <p style={{ fontSize: '0.78rem', color: '#aaa', marginTop: '8px', textAlign: 'center' }}>
                  Check your email inbox for the code from Supabase Auth
                </p>
              </div>
              <button type="submit" className="btn-auth" disabled={loading || otp.length < 6}>
                {loading ? 'Verifying...' : 'Verify & Continue'}
              </button>
              <p style={{ textAlign: 'center', marginTop: '16px', fontSize: '0.85rem' }}>
                <span style={{ color: 'var(--navy)', fontWeight: 600, cursor: 'pointer' }}
                  onClick={() => { setStep(1); setError(''); setOtp('') }}>
                  ← Edit Email
                </span>
              </p>
            </form>
          )}

          {/* ── Step 3: Passenger Details ── */}
          {step === 3 && (
            <form onSubmit={handleDetailsSubmit}>
              <div className="form-group">
                <label className="form-label">Full Name</label>
                <input type="text" className="form-input" placeholder="Enter your full name"
                  value={details.name} onChange={(e) => setDetails({ ...details, name: e.target.value })} required />
              </div>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px' }}>
                <div className="form-group">
                  <label className="form-label">Contact No</label>
                  <input type="tel" className="form-input" placeholder="+91 XXXXX XXXXX"
                    value={details.contact_no} onChange={(e) => setDetails({ ...details, contact_no: e.target.value })} required />
                </div>
                <div className="form-group">
                  <label className="form-label">Age</label>
                  <input type="number" className="form-input" placeholder="25" min="1" max="120"
                    value={details.age} onChange={(e) => setDetails({ ...details, age: e.target.value })} required />
                </div>
              </div>
              <div className="form-group">
                <label className="form-label">Gender</label>
                <select className="form-input" value={details.gender}
                  onChange={(e) => setDetails({ ...details, gender: e.target.value })}>
                  <option>Male</option>
                  <option>Female</option>
                  <option>Other</option>
                </select>
              </div>
              <div className="form-group">
                <label className="form-label">Address</label>
                <input type="text" className="form-input" placeholder="City, State"
                  value={details.address} onChange={(e) => setDetails({ ...details, address: e.target.value })} />
              </div>
              <button type="submit" className="btn-auth" style={{ marginTop: '12px' }} disabled={loading}>
                {loading ? 'Saving...' : 'Save & Complete ✓'}
              </button>
            </form>
          )}
        </div>
      </div>
    </div>
  )
}
