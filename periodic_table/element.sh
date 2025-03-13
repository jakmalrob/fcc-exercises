#!/bin/bash

# PSQL Variable for queries (using the periodic_table database)
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check for argument; if not provided, output an error message.
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

#Query the database to get element details
RESULT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements e JOIN properties p USING(atomic_number) JOIN types t ON p.type_id = t.type_id WHERE e.atomic_number::text='$1' OR e.symbol='$1' OR e.name='$1';")

# If no result is found, print error message
if [[ -z $RESULT ]]
then
  echo "I could not find that element in the database."
else
  #Read result into variables.
  IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$RESULT"
  #Output formatted result
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi