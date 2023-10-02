#!/bin/bash

# Set the new value for `max_allowed_packet`
NEW_PACKET_SIZE=${NEW_PACKET_SIZE}

# Update the MySQL configuration file with the new value
sudo sed -i "s/^max_allowed_packet=.*/max_allowed_packet=$NEW_PACKET_SIZE/g" /etc/mysql/my.cnf

# Restart the MySQL service to apply the changes
sudo systemctl restart mysql