#!/bin/sh

set -e

export HOME="/github/workspace"
export FLEET_HOME="/github/workspace"

mkdir -p "$HOME/.fleet"
chmod -R 770 "$HOME/.fleet"

export API_TYPE=""

if [ -n "$INPUT_APITOKEN" ]
then
  export FLEET_API_TOKEN="$INPUT_APITOKEN"
  export API_TYPE="API Token"
fi

if [ -z "$API_TYPE" ]
then
  >&2 echo "The personal access token could not be found. Please pass an 'apiToken' as an entry to the action."
  exit 1
else
  echo "Using $API_TYPE authentication"
fi

if [ -z "$INPUT_PROJECTID" ]
then
  echo "Your Fleet project's project id was not found. Please pass an 'projectId' as an entry to the action."
  exit 1
else
    export FLEET_PROJECT_ID="$INPUT_PROJECTID"
fi

# Install Fleet CLI
npm i @fleetfn/cli -g

if [ -n "$INPUT_WORKINGDIRECTORY" ]
then
  cd "$INPUT_WORKINGDIRECTORY"
fi

if [ -z "$INPUT_PROD" ]
then
  fleet
else
  fleet -p
fi

if [ -n "$INPUT_WORKINGDIRECTORY" ]
then
  cd $HOME
fi