const express = require('express');
const path = require('path');
const app = express();
const db = require('../db/fakeDb');

/* Define API routes */

// Get all posts
app.get('/api/posts', (req, res) => {
  const posts = db.getPosts();
  if (posts) {
    res.json(posts);
  } else {
    res.status(404).send('Not Found');
  }
});

// Get a specific post by id
app.get('/api/posts/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const post = db.getPost(id);
  if (post) {
    res.json(post);
  } else {
    res.status(404).send('Not Found');
  }
});

// For all other undefined routes, return 404
app.get('/api/*', (req, res) => {
  res.status(404).send('Not Found');
});

app.get('/', (req, res) => {
  res.send('hello world');
});

const port = 3000;
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});