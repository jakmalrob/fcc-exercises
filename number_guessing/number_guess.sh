#!/bin/bash

# SQL Query Variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt user to enter a username:
echo "Enter your username:"
read USERNAME

# Check if the user exists in the database
USER_EXISTS=$($PSQL "SELECT username FROM users WHERE username='$USERNAME';")

if [[ -z $USER_EXISTS ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME');" > /dev/null
else
  # Retrieve the number of games played and the best game (fewest guesses)
  USER_GAMES_PLAYED=$(echo $($PSQL "SELECT COUNT(*) FROM games g JOIN users u USING(user_id) WHERE u.username='$USERNAME';") | xargs)
  USER_BEST=$(echo $($PSQL "SELECT MIN(guesses) FROM games g JOIN users u USING(user_id) WHERE u.username='$USERNAME';") | xargs)
  echo "Welcome back, $USERNAME! You have played $USER_GAMES_PLAYED games, and your best game took $USER_BEST guesses."
fi

# Generate a random target number between 1 and 1000
TARGET=$(( RANDOM % 1000 + 1 ))
# Initialize the guess count
GUESSES=0

echo "Guess the secret number between 1 and 1000:"
read GUESS

while true; do
  # If the input is not an integer, prompt again.
  if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    read GUESS
    continue
  fi
  
  ((GUESSES++))
  
  if (( GUESS < TARGET )); then
    echo "It's higher than that, guess again:"
    read GUESS
  elif (( GUESS > TARGET )); then
    echo "It's lower than that, guess again:"
    read GUESS
  else
    echo "You guessed it in $GUESSES tries. The secret number was $TARGET. Nice job!"
    $PSQL "INSERT INTO games(user_id, secret_number, guesses) VALUES((SELECT user_id FROM users WHERE username='$USERNAME'), $TARGET, $GUESSES);" > /dev/null
    exit 0
  fi
done
