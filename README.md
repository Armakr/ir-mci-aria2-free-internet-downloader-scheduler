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

3. ▶️ Run the script:
   ```bash
   ./download.sh
   ```

   It will use `proxychains` to download each file, one by one.

---

```
📂 FILE LOCATIONS
```

```
download.sh                         # ← the script
/home/arman/Desktop/to download.txt # ← your list of links
/home/arman/Downloads               # ← where files are saved
```

---

```
💡 EXTRA TIPS
```

- 💤 Run this script before you go to bed
- ⏰ It will stop after 11:00 AM to avoid using paid internet
- 🧠 If a file already exists, it will **overwrite** it
- 🔄 If you want this to run **every night by itself**, ask me how to use cron

---

That's it! Just add your links and let the script do the rest.  
Works great with **Hamrah Aval free night internet** and helps bypass blocked sites using a proxy.

🇮🇷🌙📶💾
