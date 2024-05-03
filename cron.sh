#!/bin/bash

# Store the current directory path in a variable
loc=$(pwd)

# Define the cron job command
cron_job="* * * * * bash $loc/clean_cache_logs.sh"

# Check if the cron job command already exists in the crontab
if ! sudo crontab -u root -l | grep -qFx "$cron_job"; then
    # If the cron job command does not exist, add it to the crontab
    (sudo crontab -u root -l ; echo "$cron_job") | sort - | uniq - | sudo crontab -u root -
    echo "Cron job added successfully."
else
    # If the cron job command already exists, print a message indicating it
    echo "Cron job already exists, skipping addition."
fi

