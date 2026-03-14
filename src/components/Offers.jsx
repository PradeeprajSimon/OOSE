export default function Offers() {
  const offers = [
    { title: 'Fly to Goa from ₹3,299', subtitle: 'Book your summer getaway now!', type: 'primary' },
    { title: 'Flat 15% Off on Domestic Flights', subtitle: 'Use code: SKYFLIGHT', type: 'secondary' },
  ]

  return (
    <section className="offers-section">
      <div className="container">
        <h2 className="section-title">Exciting Offers</h2>
        <div className="offers-grid">
          {offers.map((offer, i) => (
            <div key={i} className={`offer-card ${offer.type}`}>
              <h3 className="offer-title">{offer.title}</h3>
              <p className="offer-subtitle">{offer.subtitle}</p>
              <button className="btn-sky" style={{ width: 'fit-content' }}>View Offer</button>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
