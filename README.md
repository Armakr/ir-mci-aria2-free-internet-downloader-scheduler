Here's the optimized version of your text in GitHub Markdown code frames with improved formatting:

```markdown
# Download Automation Script (aria2c + ProxyChains)

## Project Overview
Bash script that automates downloading files from a list of URLs using `aria2c` and `proxychains`. Designed for Iran's Hamrah Aval network (free internet 1:00 AM - 11:00 AM).

```bash
proxychains4 aria2c -s16 -x16 -i urls.txt -d downloads/
```

## Key Features
- 📥 **List-based Downloads**: Processes URLs from a text file (one per line)
- ⚡ **High-Speed Downloads**: Uses `aria2`'s multi-connection engine
- 🔒 **Proxy Support**: Routes traffic through configured proxy (e.g., Tor)
- ⏰ **Time-Aware**: Auto-stops at 11:00 AM to avoid data charges
- 🤖 **Cron-Compatible**: Designed for nightly automated runs

## Prerequisites
```bash
# aria2 (Download Utility)
sudo apt update && sudo apt install aria2

# ProxyChains + Tor (Proxy Wrapper)
sudo apt install proxychains tor
```

## Usage
1. Prepare URL list (`urls.txt`):
   ```
   http://example.com/file1.zip
   http://example.org/video.mp4
   ```

2. Configure ProxyChains (`/etc/proxychains.conf`):
   ```ini
   socks5 127.0.0.1 9050  # Tor example
   ```

3. Make script executable:
   ```bash
   chmod +x download_script.sh
   ```

4. Run script:
   ```bash
   ./download_script.sh urls.txt /path/to/downloads
   ```

## Cron Setup
```bash
0 1 * * * /bin/bash /path/to/download_script.sh /path/to/urls.txt /path/to/downloads
```

## File Structure
```
project/
├── download_script.sh  # Main Bash script
├── urls.txt            # URL list (one per line)
└── README.md           # Documentation
```

## Configuration Tips
- Set `--allow-overwrite=true` in aria2 to overwrite files
- Adjust `-s` and `-x` parameters for connection count
- Add logging to track download progress
- Use full paths in cron jobs

## References
- [aria2 Documentation](https://aria2.github.io)
- [ProxyChains Example](https://gist.github.com)
- [Cron Guide](https://geeksforgeeks.org)
```
