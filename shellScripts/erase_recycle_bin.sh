#!/bin/bash

# Check if the target folder is provided as a command-line argument
if [ -z "$1" ]; then
echo "as"
    exit 1
fi

target_folder="$1"
days_threshold=30

find "$target_folder" -type f -mtime +$days_threshold -exec rm {} \; > /dev/null 2>&1


