require('dotenv').config();
const express = require('express');
const cors = require('cors');
const dns = require('dns');
const {URL} = require('url')
const app = express();

// Basic Configuration
const port = process.env.PORT || 3000;

app.use(cors());
//Middleware to parse URLs
app.use(express.urlencoded({extended:false}));

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

//In-memory storage for URL mappings
const urlStorage = [];
let idCounter = 1;

//Post endpoint to test the URL
app.post('/api/shorturl', function(req, res) {
  const originalURL = req.body.url;

  const urlRegex = /^(http|https):\/\/(www\.)?[\w-]+\.[\w.-]+(\/.*)?$/;
  if (!urlRegex.test(originalURL)) {
    return res.json({error: 'invalid url'})
  }

  let hostname;
  try {
    hostname = new URL(originalURL).hostname;
  } catch(err) {
    return res.json({error: 'invalid url'});
  }

  dns.lookup(hostname, function (err, address) {
    if (err) {
      return res.json({error: 'invalid url'});
    } else {
      const shortURL = idCounter++;
      urlStorage.push({short_url: shortURL, original_url: originalURL});
      return res.json({original_url: originalURL, short_url: shortURL});
    }
  });
})

//Get endpoint to redirect to the original URL
app.get('/api/shorturl/:short_url', function(req, res) {
  const short_url = parseInt(req.params.short_url, 10);
  const record = urlStorage.find(item => item.short_url === short_url);

  if (record) {
    return res.redirect(record.original_url)
  } else {
    return res.json({error: 'No short URL found'})
  }
});


app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});
