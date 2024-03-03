import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [customers, setCustomers] = useState([]);
  const [search, setSearch] = useState('');
  const [sortBy, setSortBy] = useState('created_at');
  const [sortOrder, setSortOrder] = useState('ASC');
  const [page, setPage] = useState(1);

  useEffect(() => {
    fetchData();
  }, [search, sortBy, sortOrder, page]);

  const fetchData = async () => {
    try {
      const response = await axios.get(`http://localhost:5000/customers`, {
        params: {
          page,
          search,
          sortBy,
          sortOrder,
        },
      });
      const formattedData = response.data.map((customer, index) => ({
        ...customer,
        sno: (page - 1) * 20 + index + 1,
        date: new Date(customer.created_at).toLocaleDateString(),
        time: new Date(customer.created_at).toLocaleTimeString(),
      }));
      setCustomers(formattedData);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  const handleSortChange = (e) => {
    setSortBy(e.target.value);
  };

  const handleSortOrderChange = () => {
    setSortOrder(sortOrder === 'ASC' ? 'DESC' : 'ASC');
  };

  return (
    <div className="container">
      <div className="input-container">
        <input
          type="text"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search by name or location"
        />
      </div>
      <div className="select-container">
        <select value={sortBy} onChange={handleSortChange}>
          <option value="created_at">Date</option>
          <option value="time">Time</option>
        </select>
      </div>
      <button className="button" onClick={handleSortOrderChange}>
        {sortOrder === 'ASC' ? 'ASC' : 'DESC'}
      </button>
      <div className="table-container">
        <table className="table">
          <thead>
            <tr>
              <th>S.No</th>
              <th>Customer Name</th>
              <th>Age</th>
              <th>Phone</th>
              <th>Location</th>
              <th>Date</th>
              <th>Time</th>
            </tr>
          </thead>
          <tbody>
            {customers.map((customer) => (
              <tr key={customer.id}>
                <td>{customer.sno}</td>
                <td>{customer.customer_name}</td>
                <td>{customer.age}</td>
                <td>{customer.phone}</td>
                <td>{customer.location}</td>
                <td>{customer.date}</td>
                <td>{customer.time}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <div className="pagination-container">
        <button className="button pagination-button" onClick={() => setPage((prevPage) => Math.max(prevPage - 1, 1))}>
          Prev
        </button>
        <button className="button pagination-button" onClick={() => setPage((prevPage) => prevPage + 1)}>Next</button>
      </div>
    </div>
  );
}

export default App;
