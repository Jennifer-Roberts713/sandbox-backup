import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    fetch('https://shopeasy-api-37747295474.us-central1.run.app/products')
      .then(res => res.json())
      .then(data => setProducts(data))
      .catch(err => console.error("API Error:", err));
  }, []);

  return (
    <div className="App">
      <h1>ShopEasy Store</h1>
      <div className="products">
        {products.length ? (
          products.map(p => (
            <div key={p.id} className="product">
              <h3>{p.name}</h3>
              <p>${p.price}</p>
            </div>
          ))
        ) : (
          <p>Loading products...</p>
        )}
      </div>
    </div>
  );
}

// Add this export
export default App;