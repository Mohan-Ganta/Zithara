// server.js

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();
const port = 5000;

app.use(cors());
app.use(bodyParser.json());

// PostgreSQL connection configuration
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'Zithara',
  password: 'Cse@2003',
  port: 5432,
});

// Check database connection
pool.connect((err, client, release) => {
  if (err) {
    return console.error('Error acquiring client', err.stack);
  }
  console.log('DB connected successfully');
  release();
});

// API to fetch customers with pagination, search, and sorting
app.get('/customers', async (req, res) => {
  try {
    const { page = 1, limit = 20, search = '', sortBy = 'created_at', sortOrder = 'ASC' } = req.query;
    const offset = (page - 1) * limit;

    let query = `
      SELECT sno, customer_name, age, phone, location, 
             TO_CHAR(created_at, 'YYYY-MM-DD') AS date,
             TO_CHAR(created_at, 'HH24:MI:SS') AS time
      FROM customers
      WHERE customer_name ILIKE $1 OR location ILIKE $1
      ORDER BY ${sortBy} ${sortOrder}
      LIMIT $2 OFFSET $3
    `;

    const values = [`%${search}%`, limit, offset];
    const result = await pool.query(query, values);

    res.json(result.rows);
  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
