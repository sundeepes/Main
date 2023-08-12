#!/bin/bash

backup_dir="/path/to/backup/directory"
source_dir="/path/to/source/directory"

timestamp=$(date +%Y%m%d%H%M%S)
backup_file="backup_$timestamp.tar.gz"

tar -zcvf "$backup_dir/$backup_file" "$source_dir"

echo "Backup completed: $backup_file"
