#!/bin/bash

# Configuration
LOG_FILE="/var/log/myapp.log"
MAX_BACKUPS=5

# Perform log rotation
if [ -f "$LOG_FILE" ]; then
    # Create a backup copy of the log file
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    BACKUP_FILE="$LOG_FILE.$TIMESTAMP"
    cp "$LOG_FILE" "$BACKUP_FILE"

    # Compress the backup file
    gzip "$BACKUP_FILE"

    # Remove old backups if more than MAX_BACKUPS exist
    BACKUP_FILES=($(ls -t "$LOG_FILE".*.gz))
    while [ ${#BACKUP_FILES[@]} -gt $MAX_BACKUPS ]; do
        rm "${BACKUP_FILES[${#BACKUP_FILES[@]}-1]}"
        BACKUP_FILES=(${BACKUP_FILES[@]::${#BACKUP_FILES[@]}-1})
    done

    # Truncate the original log file
    > "$LOG_FILE"
fi
