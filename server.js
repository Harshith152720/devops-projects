const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send(`<h1>Welcome to Harshith's Gaming Cafe</h1>
  <p>PCs • VR • PS5 • Snacks • Hours & Pricing here</p>`);
});

app.listen(port, () => console.log(`Listening on ${port}`));
