import React, { useState } from 'react';

const App = () => {
  const [formData, setFormData] = useState({
    name: '',
    employeeId: '',
    department: '',
    email: '',
  });

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    await fetch('<API_GATEWAY_URL>', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(formData),
    });
    alert('Form submitted successfully');
  };

  return (
    <form onSubmit={handleSubmit}>
      <input name="name" onChange={handleChange} placeholder="Name" required />
      <input name="employeeId" onChange={handleChange} placeholder="Employee ID" required />
      <input name="department" onChange={handleChange} placeholder="Department" required />
      <input name="email" type="email" onChange={handleChange} placeholder="Email" required />
      <button type="submit">Submit</button>
    </form>
  );
};

export default App;
