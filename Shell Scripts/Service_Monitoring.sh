#!/bin/bash

service_name="nginx"

if sudo systemctl is-active --quiet "$service_name"; then
    echo "$service_name is running."
else
    sudo systemctl start "$service_name"
    echo "$service_name was restarted."
fi
