#!/bin/bash

# Print help for user how use this script
display_usage() {
    echo "Usage: $0 [-l|--local] <file1> <file2> ... <destination_folder>"
    echo "Options:"
    echo "  -l, --local     Run the script locally instead of on the server."
}

# Initialize local mode as false
local_mode=false

# Parse command-line options
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -l|--local)
        local_mode=true
        shift
        ;;
        *)
        break
        ;;
    esac
done

# Check the number of arguments
if [ "$#" -lt 3 ]; then
    display_usage
    exit 1
fi

# Extract the last argument as the destination folder
dest_folder="${!#}"

# Function for create the destination folder remotely if it doesn't exist
create_remote_folder() {
    ssh vagrant@server2 "mkdir -p $1"
}

# Create the destination folder locally if running locally
if [ "$local_mode" = true ]; then
    mkdir -p "$dest_folder"
else
    create_remote_folder "$dest_folder"
fi

# Initialize the variable to store the total bytes copied
total_bytes=0

# Loop through all arguments except the last one
for ((i=1; i<=$#-1; i++)); do
    file="${!i}"
    # Use scp to copy the file to the destination folder on server2 or locally based on the mode
    if [ "$local_mode" = true ]; then
        cp "$file" "$dest_folder"
        total_bytes=$((total_bytes + $(stat -c %s "$file")))
    else
        scp "$file" "vagrant@server2:$dest_folder"
        remote_file_size=$(ssh vagrant@server2 "du -shb $dest_folder/$(basename "$file")" | awk '{print $1}')
        total_bytes=$((total_bytes + remote_file_size))
    fi
done

# Print the total number of bytes copied
echo "$total_bytes"


#add fix to exercise6-fix here
The script can run locally with -l flag or copy to a remote server using the default user: "vagrant".
The script checking if the destination exsist the folder, if not it creating the folder.
When the scp command is finish to copy its calculate the total KB copied and print the sumarize.