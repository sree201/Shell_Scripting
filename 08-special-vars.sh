#!/bin/bash

echo "All variables: $@"

echo "Number of variables passed: $#"

echo "Script name: $0"

echo "Current working directory: $PWD"

echo "Home directory of current user: $HOME"

echo "Which user is running the script: $USER"

echo "HOSTNAME: $HOSTNAME"

echo "Process Id of the present current shell script: $$"

sleep 60

echo "Process ID of last background command: $!"

echo  "Special variable for exit status: $?"
