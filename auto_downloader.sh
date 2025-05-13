#!/bin/bash

# Validate command-line arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <url-file> <download-dir>"
    exit 1
fi

file_list="$1"
download_dir="$2"

# Create download directory if not exists
mkdir -p "$download_dir" || exit 1

check_time() {
    [ $(date +%H) -ge 11 ] && { echo "Stopping at 11:00 AM"; exit 0; }
}

check_time

# Download with timeout until 11 AM
while true; do
    check_time
    proxychains aria2c \
        --continue=true \
        --max-connection-per-server=16 \
        --split=16 \
        --max-tries=0 \
        --check-certificate=false \
        --auto-file-renaming=false \
        --dir="$download_dir" \
        --input-file="$file_list"
    
    # Exit if aria2 completes or time expires
    check_time || exit 0
    sleep 300  # Wait 5 minutes before retrying
done
