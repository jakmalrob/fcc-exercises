const express = require('express')
const app = express()
const cors = require('cors')
const { get } = require('express/lib/response')
require('dotenv').config()

// Middleware to enable CORS and parse URL-encoded form data
app.use(cors());
app.use(express.urlencoded({ extended: false }));

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function (req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Local storage for users and exercises
const users = [];
const exercises = [];
let userIdCounter = 0;

// POST /api/users - Create a new user
app.post('/api/users', function (req, res) {
  const username = req.body.username;
  // Create a new user with a unique _id as a string
  const newUser = { username, _id: String(++userIdCounter) };
  users.push(newUser);
  res.json(newUser);
});

// GET /api/users - List all users
app.get('/api/users', function (req, res) {
  res.json(users);
});

// POST /api/users/:_id/exercises - Add an exercise for a user
app.post('/api/users/:_id/exercises', function (req, res) {
  const userId = req.params._id;
  const user = users.find(u => u._id === userId);
  if (!user) {
    return res.json({ error: 'User not found' });
  }
  
  const { description, duration } = req.body;
  // Use the provided date or default to current date
  const dateInput = req.body.date;
  const date = dateInput ? new Date(dateInput) : new Date();
  const formattedDate = date.toDateString();

  // Create an exercise entry
  const exercise = {
    username: user.username,
    description,
    duration: Number(duration),
    date: formattedDate,
    _id: userId
  };

  exercises.push(exercise);
  res.json(exercise);
});

// GET /api/users/:_id/logs - Retrieve a full exercise log of any user
app.get('/api/users/:_id/logs', function (req, res) {
  const userId = req.params._id;
  const user = users.find(u => u._id === userId);
  if (!user) {
    return res.json({ error: 'User not found' });
  }
  
  // Get all exercises for the user
  let userExercises = exercises.filter(ex => ex._id === userId);

  // Apply optional query parameters: from, to, limit
  const { from, to, limit } = req.query;
  if (from) {
    const fromDate = new Date(from);
    userExercises = userExercises.filter(ex => new Date(ex.date) >= fromDate);
  }
  if (to) {
    const toDate = new Date(to);
    userExercises = userExercises.filter(ex => new Date(ex.date) <= toDate);
  }
  if (limit) {
    userExercises = userExercises.slice(0, Number(limit));
  }
  
  // Build the log array (each entry should have description, duration, and date)
  const log = userExercises.map(ex => ({
    description: ex.description,
    duration: ex.duration,
    date: ex.date
  }));

  res.json({
    username: user.username,
    count: log.length,
    _id: userId,
    log
  });
});



const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port)
})
