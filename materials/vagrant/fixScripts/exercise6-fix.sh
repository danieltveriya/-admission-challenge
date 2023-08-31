#!/bin/bash

# Check if the number of arguments is at least 3
if [ $# -lt 3 ]; then
    echo "Usage: $0 <source_file1> <source_file2> ... <destination_folder>"
    exit 1
fi

# Get the last argument as the destination folder
dest_folder="${@: -1}"

# Create the destination folder if it doesn't exist
if [ ! -d "$dest_folder" ]; then
    mkdir -p "$dest_folder"
fi

# Loop through the arguments except the last one
for (( i = 1; i <= $# - 1; i++ )); do
    source_file="${!i}"
    # Use rsync to copy files to the destination server
    rsync -avz "$source_file" "$dest_folder"
done

# Calculate and print the total bytes copied
total_bytes=$(du -cb "$@" | grep total$ | awk '{print $1}')
echo "$total_bytes"
