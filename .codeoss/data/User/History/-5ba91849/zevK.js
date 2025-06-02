function App() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch('https://shopeasy-api-37747295474.us-central1.run.app/products')
      .then(res => res.json())
      .then(data => {
        setProducts(data);
        setLoading(false);
      })
      .catch(err => {
        console.error("API Error:", err);
        setLoading(false);
      });
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <h1>ShopEasy Store</h1>
      </header>
      
      {loading ? (
        <p className="loading">Loading products...</p>
      ) : (
        <div className="products">
          {products.map(p => (
            <div key={p.id} className="product">
              <h3>{p.name}</h3>
              <p>${p.price.toFixed(2)}</p>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}