import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [cart, setCart] = useState([]);
  const [darkMode, setDarkMode] = useState(false);

  useEffect(() => {
    fetch('https://shopeasy-api-37747295474.us-central1.run.app/products')
      .then(res => res.json())
      .then(data => {
        setProducts(data.map(p => ({ ...p, image: `/products/${p.id}.jpg` })));
        setLoading(false);
      })
      .catch(err => {
        console.error("API Error:", err);
        setLoading(false);
      });
  }, []);

  const addToCart = (product) => {
    setCart([...cart, product]);
  };

  return (
    <div className={`App ${darkMode ? 'dark' : ''}`}>
      <header className="App-header">
        <h1>ShopEasy Store</h1>
        <div className="header-controls">
          <button onClick={() => setDarkMode(!darkMode)}>
            {darkMode ? '☀️ Light Mode' : '🌙 Dark Mode'}
          </button>
          <span className="cart-count">🛒 {cart.length}</span>
        </div>
      </header>
      
      {loading ? (
        <p className="loading">Loading products...</p>
      ) : (
        <div className="products">
          {products.map(p => (
            <div key={p.id} className="product">
              <img src={p.image} alt={p.name} className="product-image" />
              <h3>{p.name}</h3>
              <p>${p.price.toFixed(2)}</p>
              <button onClick={() => addToCart(p)}>Add to Cart</button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

export default App;