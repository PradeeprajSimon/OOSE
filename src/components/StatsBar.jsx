export default function StatsBar() {
  const stats = [
    { number: '100+', label: 'Destinations' },
    { number: '2000+', label: 'Daily Flights' },
    { number: '100M+', label: 'Happy Passengers' },
    { number: '99.9%', label: 'On-Time Rate' },
  ]

  return (
    <section className="stats-section">
      <div className="container">
        <div className="stats-grid">
          {stats.map((stat, i) => (
            <div key={i} className="stat-item">
              <div className="stat-number">{stat.number}</div>
              <div className="stat-label">{stat.label}</div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
