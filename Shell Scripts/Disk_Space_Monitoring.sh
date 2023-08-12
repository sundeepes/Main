#!/bin/bash

threshold=90
partition="/dev/sda1"

usage=$(df -h | grep "$partition" | awk '{ print $5 }' | cut -d'%' -f1)

if [ "$usage" -gt "$threshold" ]; then
    echo "Disk space on $partition is above $threshold% usage."
else
    echo "Disk space usage is normal."
fi
