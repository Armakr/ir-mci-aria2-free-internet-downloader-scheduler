```
📥 EASY FILE DOWNLOADER (FOR IRAN USERS WITH HAMRAH AVAL NIGHT INTERNET)
```

This is a **very easy program** that helps you download files **automatically between 1:00 AM and 11:00 AM**, using **Hamrah Aval’s free internet in Iran**.

It uses **proxychains** because **many websites are blocked** in Iran. So both `proxychains` and `aria2` must be installed.

You just give it a list of download links, and it will download them one by one, while you sleep.

---

```
📢 WHO SHOULD USE THIS?
```

✅ People in **Iran**  
✅ Who have **Hamrah Aval night internet** (free from 1 AM to 11 AM)  
✅ Who want to **download files while they sleep**  
✅ Who need a **proxy** to access blocked sites

---

```
🔧 WHAT THIS SCRIPT DOES
```

- ⏰ Runs only **between 1:00 AM and 11:00 AM**  
- 🌐 Uses **proxychains + aria2c** to download through a proxy (needed in Iran!)  
- 📃 Reads links from:  
  ```bash
  /home/arman/Desktop/to download.txt
  ```  
- 💾 Saves files to:  
  ```bash
  /home/arman/Downloads
  ```  
- 🔁 Can **resume broken downloads**  
- 🧠 Automatically stops after 11:00 AM to save your paid internet  

---

```
📦 YOU MUST INSTALL THESE FIRST!
```

Run this command in Terminal to install both tools:

```bash
sudo apt install proxychains aria2
```

Make sure `proxychains` is set up with a working proxy (VPN, Tor, Shadowsocks, etc).

---

```
📋 HOW TO USE IT (STEP BY STEP)
```

1. ✏️ Make a list of the files you want to download:  
   - Open or create this file:  
     ```bash
     /home/arman/Desktop/to download.txt
     ```  
   - Put one link per line, like this:  
     ```
     http://example.com/file1.zip
     http://example.com/video.mp4
     ```

2. 🔓 Make the script executable (only once):  
   ```bash
   chmod +x download.sh
   ```

3. ▶️ Run the script manually (if you want to test it):  
   ```bash
   ./download.sh
   ```

---

```
⏰ HOW TO AUTOMATE WITH CRON
```

You can make this run **every night at 1:00 AM** automatically:

1. Open your crontab editor:
   ```bash
   crontab -e
   ```
2. Add this line at the end (replace the path if needed):
   ```
   0 1 * * * /home/arman/path/to/download.sh
   ```
   - `0 1 * * *` means “at minute 0 of hour 1 (1:00 AM) every day”
   - Make sure the script path is correct and executable.

3. Save and exit.  
   Cron will now start your downloader script each night at 1:00 AM.

---

```
📂 FILE LOCATIONS
```

```
download.sh                          # ← the script
/home/arman/Desktop/to download.txt  # ← your list of links
/home/arman/Downloads                # ← where files are saved
```

---

```
💡 EXTRA TIPS
```

- 💤 Run this script before you go to bed  
- ⏰ It will stop after 11:00 AM to avoid using paid internet  
- 🔄 If a file already exists, it will **overwrite** it  
- 🔄 If you want to change the schedule, edit the cron time fields (e.g., to 2:00 AM, use `0 2 * * *`)  

---

That’s it! Just add your links, install the tools, and let cron handle the rest.  
Works great with **Hamrah Aval free night internet** and helps bypass blocked sites using a proxy.

🇮🇷🌙📶💾
