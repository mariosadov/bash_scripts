#! /bin/bash

# Read name of the service
read -p "Enter service name: " SERVICE_NAME

# Check if service is running
if [[ $(systemctl status $SERVICE_NAME) == *"active (running)"* ]]
then
    echo "Service $SERVICE_NAME is already running"
else
# Ask a user to start service
    read -p "$SERVICE_NAME is not running. Start it? (y/n) " START_SERV
    if [ "$START_SERV" == "y" ]
    then
        systemctl start $SERVICE_NAME
    fi
fi
