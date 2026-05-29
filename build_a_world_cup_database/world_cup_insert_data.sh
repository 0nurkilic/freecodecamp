#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "truncate teams, games")
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $winner != "winner" ]]
  then
  WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$winner';")
  OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$opponent';")

  if [[ -z $WINNER_TEAM_ID ]]
  then
    INSERT_WINNER_TEAM_ID=$($PSQL "insert into teams(name) values('$winner');")
  fi
  if [[ -z $OPPONENT_TEAM_ID ]]
  then
    INSERT_OPPONENT_TEAM_ID=$($PSQL "insert into teams(name) values('$opponent');")  
  fi

  WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$winner';")
  OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$opponent';")

  INSERT_GAMES_TABLE=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($year,'$round',$WINNER_TEAM_ID,$OPPONENT_TEAM_ID,$winner_goals,$opponent_goals);")
  fi

done