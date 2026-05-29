#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"

#You should display a numbered list of the services you offer before the first prompt for input, each with the format #) <service>. For example, 1) cut, where 1 is the service_id
SERVICES () {
  if [[ $1 ]]
  then
      echo -e "\n$1\n"
  fi
  SERVICES=$($PSQL "select * from services;")
  echo "$SERVICES" | sed "s/|/) /"
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      SERVICES "I could not find that service. What would you like today?"
  else  
    DB_SELECTED_SERVICE_ID=$($PSQL "select service_id from services where service_id = $SERVICE_ID_SELECTED;")
  # If you pick a service that doesn't exist, you should be shown the same list of services again
  if [[ -z DB_SELECTED_SERVICE_ID ]]
    then
      SERVICES
  else
    # ask for phone number
    SERVICE_NAME=$($PSQL "select name from services where service_id=$DB_SELECTED_SERVICE_ID;")
    echo -e "Please enter your phone number"
    read CUSTOMER_PHONE
    # check whether phone number for existing customer
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
    # if customer not found
    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nWhat's your phone number?\n" 
      echo -e "\nI don't have a record for that phone number, what's your name?\n"
      read CUSTOMER_NAME
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?\n"
      read SERVICE_TIME
      INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
      INSERTED_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
      INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values($INSERTED_CUSTOMER_ID,$DB_SELECTED_SERVICE_ID,'$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
    else
      CUSTOMER_NAME=$($PSQL "select name from customers where customer_id=$CUSTOMER_ID;")
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?\n"  
      read SERVICE_TIME
      INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$DB_SELECTED_SERVICE_ID,'$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
    fi

  fi   
  fi
}
SERVICES






#You can create a row in the appointments table by running your script and entering 1, 555-555-5555, Fabio, 10:30 at each request for input if that phone number isn’t in the customers table. The row should have the customer_id for that customer, and the service_id for the service entered

#You can create another row in the appointments table by running your script and entering 2, 555-555-5555, 11am at each request for input if that phone number is already in the customers table. The row should have the customer_id for that customer, and the service_id for the service entered

#After an appointment is successfully added, you should output the message I have put you down for a <service> at <time>, <name>. For example, if the user chooses cut as the service, 10:30 is entered for the time, and their name is Fabio in the database the output would be I have put you down for a cut at 10:30, Fabio. Make sure your script finishes running after completing any of the tasks above, or else the tests won't pass