export default function PopularRoutes() {
  const routes = [
    { from: 'Delhi', to: 'Mumbai', price: '₹4,599', tag: 'Best Seller', img: '/mumbai.png' },
    { from: 'Bangalore', to: 'Goa', price: '₹3,299', tag: 'Hot Deal', img: '/goa.png' },
    { from: 'Chennai', to: 'Delhi', price: '₹5,899', tag: 'Frequent', img: '/delhi.png' },
    { from: 'Mumbai', to: 'Dubai', price: '₹14,999', tag: 'International', img: '/dubai.png' },
  ]

  return (
    <section className="routes-section">
      <div className="container">
        <h2 className="section-title">Popular Routes</h2>
        <p className="section-subtitle">Book your next adventure at the lowest fares.</p>
        <div className="routes-grid">
          {routes.map((route, i) => (
            <div key={i} className="route-card">
              <div className="route-img">
                <img src={route.img} alt={route.to} style={{ width: '100%', height: '100%', objectFit: 'cover' }} />
                <span className="route-tag">{route.tag}</span>
              </div>
              <div className="route-info">
                <div className="route-header">
                  <strong>{route.from} → {route.to}</strong>
                </div>
                <div className="route-footer">
                  <div className="price-box">{route.price}</div>
                  <button className="btn-auth" style={{ padding: '8px 16px', fontSize: '0.8rem' }}>Book Now</button>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
