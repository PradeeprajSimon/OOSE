export default function Features() {
  const features = [
    { icon: '💸', title: 'Lowest Fares', desc: 'Find the best deals on 100+ domestic and international routes.' },
    { icon: '🛡️', title: 'Secure Booking', desc: 'Your data and payments are protected with bank-grade security.' },
    { icon: '⚡', title: 'Instant E-Ticket', desc: 'Receive your ticket instantly via email and SMS after booking.' },
    { icon: '📞', title: '24/7 Support', desc: 'Our customer care team is always here to help with your queries.' },
  ]

  return (
    <section className="features-section">
      <div className="container">
        <h2 className="section-title">Why Fly SkyLink?</h2>
        <div className="features-grid">
          {features.map((feature, i) => (
            <div key={i} className="feature-card">
              <div className="feature-icon">{feature.icon}</div>
              <h3 className="feature-title">{feature.title}</h3>
              <p className="feature-desc">{feature.desc}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
