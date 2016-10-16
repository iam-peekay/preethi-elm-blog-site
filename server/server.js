const express = require('express');
const path = require('path');
const app = express();
const db = require('../db/fakeDb');

app.get('/', (req, res) => {
  res.send('hello world');
});

const port = 3000;
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
