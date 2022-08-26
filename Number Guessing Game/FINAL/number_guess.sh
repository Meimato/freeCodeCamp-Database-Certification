#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess_game -t --no-align -c"

echo "Enter your username:"
read USERNAME

# check if user exists
GET_ID_FROM_USERNAME_RESULT=$($PSQL "SELECT player_id FROM players WHERE username = '$USERNAME'")

# if it doesn't exists
if [[ -z $GET_ID_FROM_USERNAME_RESULT ]]
then
  # welcome new player
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  # insert new player into the database
  INSERT_PLAYER_RESULT=$($PSQL "INSERT INTO players( username ) VALUES( '$USERNAME' )")
else
  # find old player
  GET_OLD_PLAYER_RESULT=$($PSQL "SELECT username, games_played, best_game FROM players WHERE player_id = $GET_ID_FROM_USERNAME_RESULT")
  echo "$GET_OLD_PLAYER_RESULT" | sed -r 's/\|/ /g' | while read USERNAME GAMES_PLAYED BEST_GAME
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
  done
fi

# random generator entropy seeder
RANDOM=$(date +%s%N | cut -b10-19)
# generate random number
NUMBER_TO_GUESS=$(($RANDOM % 1000 + 1))

TRIES=0

echo "Guess the secret number between 1 and 1000:"
read PLAYER_GUESS

# check if input is an integer
while [[ ! $PLAYER_GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read PLAYER_GUESS
  let "TRIES+=1"
done

# check when player wins
while [ $PLAYER_GUESS -ne $NUMBER_TO_GUESS ]
do

  # give an hint to the player
  if [ $PLAYER_GUESS -gt $NUMBER_TO_GUESS ]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi

  # ask for a new number and verify if integer
  read PLAYER_GUESS

  while [[ ! $PLAYER_GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read PLAYER_GUESS
    let "TRIES+=1"
  done

  let "TRIES+=1"
done

# number is found
if [ $PLAYER_GUESS -eq $NUMBER_TO_GUESS ]
then
  let "TRIES+=1"
  echo -e "You guessed it in $TRIES tries. The secret number was $NUMBER_TO_GUESS. Nice job!\n"

  GET_PLAYER=$($PSQL "SELECT username, games_played, best_game FROM players WHERE username = '$USERNAME'")
  echo "$GET_PLAYER" | sed -r 's/\|/ /g' | while read USERNAME GAMES_PLAYED BEST_GAME
  do
    # check if player beats the record
    if [[ $TRIES -lt $BEST_GAME ]]
    then
      # update the number of games and the record
      UPDATE_SCOREBOARD=$($PSQL "UPDATE players SET games_played = $GAMES_PLAYED + 1, best_game = $TRIES WHERE username = '$USERNAME'")
    else
      # update the number of games
      UPDATE_SCOREBOARD=$($PSQL "UPDATE players SET games_played = $GAMES_PLAYED + 1 WHERE username = '$USERNAME'")
    fi
  done
fi
