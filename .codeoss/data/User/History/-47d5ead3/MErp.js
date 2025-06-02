const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = process.env.PORT || 8080;

app.use(express.json());

// Database connection
const pool = new Pool({
  host: process.env.DB_HOST,
  port: 5432,
  database: 'shopeasy',
  user: 'postgres',
  password: process.env.DB_PASSWORD
});

// Health check endpoint
app.get('/', (req, res) => {
  res.json({ 
    status: 'API is running',
    db_connected: !!pool
  });
});

// Get all products
app.get('/products', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM products');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});

// Get single product
app.get('/products/:id', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM products WHERE id = $1', [req.params.id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Product not found' });
    }
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});

// Start server
app.listen(port, () => {
  console.log(`ShopEasy API running on port ${port}`);
  console.log(`Database host: ${process.env.DB_HOST || 'Not configured'}`);
});