#!/bin/bash

# Define file list location and download destination
file_list="/home/arman/Desktop/to download.txt"
download_dir="/home/arman/Downloads"

# Function to check if it's past 11:00 AM and stop the script
check_time() {
    current_time=$(date +%H)
    if [ "$current_time" -ge 11 ]; then
        echo "It's past 11:00 AM. Stopping the script."
        exit 0
    fi
}

# Check if the current time is past 11:00 AM
check_time

# Loop over each file URL in the list
while IFS= read -r url; do
    if [ -n "$url" ]; then
        echo "Starting download for: $url"
        
        # Use proxychains with aria2c to download the file and overwrite if exists
        proxychains aria2c --dir="$download_dir" --out="$(basename "$url")" --continue=true "$url" &
        
        # Wait for the download to finish, but periodically check the time
        while true; do
            check_time
            if ! pgrep -x "aria2c" > /dev/null; then
                # If aria2c is done, break out of the loop
                echo "Download completed for: $url"
                break
            fi
            sleep 5 # Check every 5 seconds
        done
    fi
done < "$file_list"

