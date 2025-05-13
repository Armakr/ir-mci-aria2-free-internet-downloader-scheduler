Here's the fully corrected `README.md` with your exact filenames and configurations integrated:

```markdown
# Auto Downloader (aria2c + ProxyChains)

![Bash](https://img.shields.io/badge/-Bash-4EAA25?logo=gnu-bash&logoColor=white) 
![aria2](https://img.shields.io/badge/-aria2-FF6600?logo=aria2&logoColor=white)
![ProxyChains](https://img.shields.io/badge/-ProxyChains-8A2BE2)

## 📂 File Specifications
```bash
auto_downloader.sh       # Main script (space-free name recommended)
to\ download.txt         # URL list (escape spaces in commands)
```

## 🛠️ Installation
```bash
sudo apt update && sudo apt install -y aria2 proxychains
chmod +x auto_downloader.sh
```

## 🚀 Basic Usage
```bash
./auto_downloader.sh
```

## ⏰ Cron Setup (Daily at 1AM)
```bash
0 1 * * * /bin/bash /path/to/auto_downloader.sh
```

## 🔄 How It Handles Interruptions
| Scenario          | Behavior                              | Recovery Method                     |
|-------------------|---------------------------------------|-------------------------------------|
| 11AM cutoff       | Stops immediately                     | Rerun next day                      |
| Network failure   | Retries every 5 minutes               | Automatic                           |
| Power loss        | Resumes partial files                 | Run same command again              |
| File in use       | Skips to next URL                     | Manual retry needed                 |

## 📝 Recommended Improvement

1. **Cron requires absolute paths**:
   ```bash
   # Bad (won't work):
   0 1 * * * ./auto_downloader.sh ...
   
   # Good:
   0 1 * * * /full/path/to/auto_downloader.sh ...
   ```

## 📊 Sample File Structure
```
~/downloads/
├── auto_downloader.sh
├── to\ download.txt    # Your URL list
├── downloads/         # Default output
│   ├── file1.zip
│   └── file2.pdf
└── auto_downloader.log
```
