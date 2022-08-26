#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {

  # print the argument if exists otherwise show a welcome message
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # get list of services
  DISPLAY_SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")

  # if no services available
  if [[ -z $DISPLAY_SERVICES ]]
  then

    # send to main menu
    MAIN_MENU "No services are available in the database. Ask for help!"

  else

    # display list of services
    echo "$DISPLAY_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done

    # get user's choice
    read SERVICE_ID_SELECTED

    # check if the input is not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then

      # send to main menu
      MAIN_MENU "Insert a valid number please."

    else

      # get the selected service
      SERVICE_ID_SELECTED_RESULT=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

      # if the service doesn't exist
      if [[ -z $SERVICE_ID_SELECTED_RESULT ]]
      then

        # send to main menu
        MAIN_MENU "I could not find that service. What would you like today?"

      else

        # get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_ID_RESULT=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # if customer doesn't exists
        if [[ -z $CUSTOMER_ID_RESULT ]]
        then

          # get new customer name
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME

          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers ( phone, name ) VALUES ( '$CUSTOMER_PHONE', '$CUSTOMER_NAME' )")

        else

          # find the customer
          CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        fi

        # ask for the time
        echo -e "\nWhat time would you like your$SERVICE_ID_SELECTED_RESULT, $CUSTOMER_NAME?"
        read SERVICE_TIME

        # get customer ID
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # create an appointment
        CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments ( customer_id, service_id, time ) VALUES ( '$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME' ) ")

        # confirm the appointment
        echo -e "I have put you down for a$SERVICE_ID_SELECTED_RESULT at $SERVICE_TIME, $CUSTOMER_NAME."
      fi

    fi

  fi
}

MAIN_MENU
