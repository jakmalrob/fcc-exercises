#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
  # Print header and welcome message
  echo -e "~~~~~ MY SALON ~~~~~\n"
  echo "Welcome to My Salon, how can I help you?"

  # Display list of services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    # Remove leading spaces from service name
    SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/^ *//')
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Read the service selection
  read SERVICE_ID_SELECTED

  # Check if the selected service exists
  SERVICE_NAME_RESULT=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME_RESULT ]]
  then
    echo -e "\nI could not find that service. What would you like today?"
    MAIN_MENU
  else
    # Trim any whitespace from service name
    SERVICE_NAME=$(echo $SERVICE_NAME_RESULT | sed 's/^ *//; s/ *$//')
    
    # Get customer's phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # Check if the customer exists
    CUSTOMER_INFO=$($PSQL "SELECT customer_id, name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_INFO ]]
    then
      # New customer, get their name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # Insert new customer into the database
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    else
      # Extract customer name and id
      CUSTOMER_NAME=$(echo $CUSTOMER_INFO | cut -d"|" -f2 | sed 's/^ *//; s/ *$//')
    fi

    # Get the customer_id (either new or existing)
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'" | sed 's/^ *//; s/ *$//')

    # Ask for appointment time
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # Insert appointment into appointments table
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    
    # Confirm the appointment
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU
