Download Automation Script (aria2c + ProxyChains)

Project Overview: This Bash script automates downloading files from a list of URLs using the aria2c utility and proxychains. It reads URLs from a text file (one per line) and saves all files into a specified directory. Under the hood, it leverages aria2 for high-speed, multi-connection downloads (aria2 can fetch from multiple sources concurrently
aria2.github.io
) and ProxyChains to route traffic through a proxy (e.g. Tor or any SOCKS5/HTTP proxy)
github.com
. The script is designed for use on Iran’s Hamrah Aval network, where internet is free from 1:00 AM to 11:00 AM, so it automatically stops at 11:00 AM to avoid data charges. The script can be run nightly via cron for unattended downloads.
Key Features

    List-based Downloads: Reads a file (e.g. urls.txt) of HTTP/HTTPS/FTP links and downloads each in turn.

    Fast Multi-Source Fetching: Uses aria2’s multi-connection engine to maximize speed by downloading segments in parallel
    aria2.github.io
    .

    Proxy Support: Runs aria2c under ProxyChains, forcing all download traffic through a configured proxy (e.g. Tor). For example:

    proxychains4 aria2c -s16 -x16 -i urls.txt -d downloads/

    (as documented in [this proxychains example]
    gist.github.com
    ).

    Free-Data Window: Automatically stops all activity at 11:00 AM local time to stay within the Hamrah Aval free internet period (1:00–11:00 AM).

    Nightly Automation: Designed to be scheduled with cron to run nightly without user intervention.

Prerequisites and Installation

    aria2 (Download Utility): Install via your package manager. For Debian/Ubuntu:

sudo apt update
sudo apt install aria2

(aria2 is a command-line download tool supporting HTTP/FTP/SFTP/BitTorrent/Metalink
linuxconfig.org
aria2.github.io
).

ProxyChains (Proxy Wrapper): Install ProxyChains (often available as proxychains or proxychains4). For Debian/Ubuntu, you can install it along with Tor for a SOCKS proxy:

    sudo apt install proxychains tor

    (This installs the proxychains tool and the Tor service
    cybervie.com
    ). ProxyChains forces any TCP connection of a command through the proxy list defined in /etc/proxychains.conf
    github.com
    cybervie.com
    .

    Cron: Ensure cron is available (usually pre-installed on most Linux systems) for scheduling jobs.

Usage Guide

    Prepare the URL list: Create a text file (e.g. urls.txt) with one download URL per line. Example content:

http://example.com/file1.zip
http://example.org/video.mp4

(Optional) Configure ProxyChains: Edit /etc/proxychains.conf or /etc/proxychains4.conf to add your proxy. For example, to use the local Tor SOCKS proxy, ensure it contains a line like:

socks5  127.0.0.1  9050

Make the script executable:

chmod +x download_script.sh

Run the script: You may run it manually or via cron. For example:

./download_script.sh urls.txt /path/to/downloads

Internally, the script will invoke aria2c with ProxyChains. An example command (as shown in [this proxychains example]
gist.github.com
) would be:

    proxychains4 aria2c -s16 -x16 -i urls.txt -d /path/to/downloads

    Here -s16 -x16 are aria2 options for 16 connections per download; adjust as needed. The -i urls.txt flag tells aria2 to read URLs from the file
    aria2.github.io
    , and -d sets the target directory
    aria2.github.io
    .

Crontab Setup (Scheduled Automation)

To automate nightly runs, add a cron job:

    Open the crontab editor:

crontab -e

(This edits the logged-in user’s crontab
geeksforgeeks.org
).

Add a line to run the script at 1:00 AM daily (for example):

    0 1 * * * /bin/bash /full/path/to/download_script.sh /full/path/to/urls.txt /full/path/to/downloads

    This schedules the script to start at 1:00 AM every day. Ensure you use full paths in cron.

Cron will then run the script each night. The script itself checks the system time and will exit when it reaches 11:00 AM, ensuring downloads only occur during the free-data window.
File Structure

Assuming a simple repository layout, the files might be:

project/
├── download_script.sh   # Bash script that performs the downloads
├── urls.txt            # Text file with one URL per line
└── README.md           # This documentation

    download_script.sh: The main script (make sure it’s executable, e.g. chmod +x).

    urls.txt: List of URLs to download.

    README.md: (This file) Explains usage, dependencies, etc.

Notes and Tips

    Overwriting Files: By default, aria2 will resume or rename existing downloads rather than overwrite. You can use -c or --continue to resume partial files
    aria2.github.io
    . If you want to overwrite files, add the --allow-overwrite=true option to aria2c.

    Stopping at 11:00 AM: The script internally checks the current time and stops the downloading process when the hour reaches 11. This ensures it runs only during the free internet period.

    ProxyChains Usage: Always prefix the download command with proxychains (or proxychains4) to route traffic through your proxy. The example above shows proxychains4 aria2c ...
    gist.github.com
    .

    Permissions: Ensure the download directory exists and the script has write permissions there. Also ensure aria2c and proxychains commands are in your PATH (you can use full paths if needed).

    Logging: You may add logging inside the script (e.g., redirecting output to a log file) to track download progress and any errors.

    Custom Configuration: You can adjust aria2 options in the script (e.g., -j for concurrent downloads, --retry-wait for network errors, etc.) to suit your network conditions.

This README provides a high-level overview and instructions. With aria2c and proxychains installed and configured, the script enables automated, efficient file downloads that respect the Hamrah Aval free-internet schedule. The key is to keep the setup simple: a list of URLs, a directory path, and a cron schedule, all tied together by the script.
