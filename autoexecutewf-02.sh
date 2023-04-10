#!/bin/bash
npm install

git checkout V1-error

SLEEP_PERIOD=30m

RELEASE_MESSAGE="I will release a new version of the demonstration project every $SLEEP_PERIOD seconds"

echo $RELEASE_MESSAGE

echo "Firing off V1-error at $(date +"%Y-%m-%d %H:%M:%S")"

P_ID=$(nohup npm start >> worker.log 2>&1 & echo $!)

V1_ERR_ID=$(nohup npm run workflow-from-client > outputv1-error.log 2>&1 & echo $!)

echo "P_ID is $P_ID"

echo "V1_ERR_ID is $V1_ERR_ID"

echo "Waiting ... on V1\n\n"

# V1
sleep $SLEEP_PERIOD

echo "Killing P_ID is $P_ID"

kill $P_ID

git checkout V1

echo "Restarting  V1_ERR_ID $V1_ERR_ID with V1 at $(date +"%Y-%m-%d %H:%M:%S")"

P_ID=$(nohup npm start >> worker.log 2>&1 & echo $!)

echo "P_ID is $P_ID"

echo "Waiting ... on V2\n\n"
# V2

sleep $SLEEP_PERIOD

echo "Killing P_ID is $P_ID"

kill $P_ID

git checkout V2

echo "Restarting  V1_ERR_ID $V1_ERR_ID  with V2 at $(date +"%Y-%m-%d %H:%M:%S")"

P_ID=$(nohup npm start >> worker.log 2>&1 & echo $!)

echo "P_ID is $P_ID"

echo "Waiting ... on V3\n\n"

# V3

sleep $SLEEP_PERIOD

echo "Killing P_ID is $P_ID"

kill $P_ID

git checkout V3

echo "Restarting  V1_ERR_ID $V1_ERR_ID  with V3 at $(date +"%Y-%m-%d %H:%M:%S")"

P_ID=$(nohup npm start >> worker.log 2>&1 & echo $!)

echo "P_ID is $P_ID"

echo "Waiting ... on V4\n\n"

# V4

sleep $SLEEP_PERIOD

echo "Killing P_ID is $P_ID"

kill $P_ID

git checkout V4

echo "Restarting  V1_ERR_ID $V1_ERR_ID  with V4 at $(date +"%Y-%m-%d %H:%M:%S")"

P_ID=$(nohup npm start >> worker.log 2>&1 & echo $!)

echo "P_ID is $P_ID"

echo "\n\nAll versions released"

