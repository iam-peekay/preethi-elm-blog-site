const express = require('express');
const path = require('path');
const app = express();
const db = require('../db/fakeDb');
const bunyan = require('bunyan');
const log = bunyan.createLogger({name: "preethi-elm-blog-api"});

/* Add CORS headers */
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
  res.setHeader('Access-Control-Allow-Credentials', true);

  next();
});

/* Define API routes */

// Get all posts
app.get('/api/posts', (req, res) => {
  const posts = db.getPosts();
  if (posts) {
    res.json(posts);
    
    log.info({
      endpoint: req.url,
      description: 'get all posts successful',
    });
  } else {
    log.error({
      endpoint: req.url,
      description: 'get all posts error',
      error: req.error,
    });

    res.status(404).send({ id: 'not_found', message: 'Posts not found' });
  }
});

// Get a specific post by id
app.get('/api/posts/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const post = db.getPost(id);
  if (post) {
    res.json(post);

    log.info({
      endpoint: req.url,
      description: `get posts id ${id} successful`,
    });
  } else {
    log.error({
      endpoint: req.url,
      description: `get posts id ${id} error`,
      error: req.error,
    });

    res.status(404).send({ id: 'not_found', message: `Post not found` });
  }
});

// For all other undefined routes, return 404
app.get('/api/*', (req, res) => {
  res.status(404).send({ id: 'not_found', message: `Route not found` });
});

app.get('/', (req, res) => {
  res.send('hello world');
});

const port = 3000;
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
