#!/bin/bash

echo "Server Backup"
echo "-------------"

backup_dir="/path/to/backups"
source_dir="/path/to/source"
timestamp=$(date +"%Y%m%d_%H%M%S")
backup_file="backup_$timestamp.tar.gz"

tar -czf "$backup_dir/$backup_file" "$source_dir"

backup_count=$(ls -1 "$backup_dir" | grep -c "^backup_.*\.tar\.gz$")
if [ $backup_count -gt 5 ]; then
    old_backups=$(ls -t "$backup_dir" | grep "^backup_" | tail -n +6)
    rm -f "$backup_dir/$old_backups"
fi

echo "Backup Completed: $backup_file"

# Replace /path/to/backups and /path/to/source with your desired paths. Save this script as server_backup_script.sh.
