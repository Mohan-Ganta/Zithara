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

// API to fetch customers with search and sorting
app.get('/customers', async (req, res) => {
    try {
      const { page = 1, search = '', sortBy = 'created_at', sortOrder = 'ASC' } = req.query;
      let queryText;
      let queryParams;
      if (search) {
        // If search term is provided, apply search filter
        queryText = `
          SELECT * FROM customers 
          WHERE customer_name ILIKE $1 OR location ILIKE $1 
          ORDER BY ${sortBy} ${sortOrder}
          LIMIT 20 OFFSET $2
        `;
        queryParams = [`%${search}%`, (page - 1) * 20];
      } else {
        // If no search term is provided, return all records
        queryText = `
          SELECT * FROM customers 
          ORDER BY ${sortBy} ${sortOrder}
          LIMIT 20 OFFSET $1
        `;
        queryParams = [(page - 1) * 20];
      }
      const result = await pool.query(queryText, queryParams);
      res.json(result.rows);
    } catch (err) {
      console.error('Error executing query', err);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
