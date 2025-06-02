import { useState, useEffect } from 'react';

function App() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    fetch('https://shopeasy-api-37747295474.us-central1.run.app/products')
      .then(res => res.json())
      .then(data => setProducts(data));
  }, []);

  return (
    <div className="App">
      {products.map(p => (
        <div key={p.id} className="product">
          <h3>{p.name}</h3>
          <p>${p.price}</p>
        </div>
      ))}
    </div>
  );
}