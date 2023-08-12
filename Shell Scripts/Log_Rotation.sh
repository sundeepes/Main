#!/bin/bash

log_dir="/var/log"
log_file="myapp.log"
max_logs=5

if [ -f "$log_dir/$log_file" ]; then
    if [ $(ls -1 "$log_dir/$log_file".* 2>/dev/null | wc -l) -ge "$max_logs" ]; then
        rm "$log_dir/$log_file.$max_logs"
    fi
    mv "$log_dir/$log_file" "$log_dir/$log_file.$(date +\%Y\%m\%d)"
fi
touch "$log_dir/$log_file"

echo "Log rotation completed."
