# 📱 Ultimate Android Recovery Guide (Dead Screen)

**Goal:** View and control your phone on your PC.
**Problem:** Screen is dead AND "USB Debugging" is off.
**Solution:** We use a "Blind Automation" script to enable debugging, then switch to normal view.

---

## 🛑 PHASE 1: DRIVER SETUP (Crucial!)
You must change your phone's USB driver for the "Blind" tool to work.

1.  **Download Zadig**: [https://zadig.akeo.ie/](https://zadig.akeo.ie/)
2.  Connect your phone via USB.
3.  Open **Zadig**.
4.  Click **Options** -> **List All Devices**.
5.  Select your phone in the dropdown.
    *   *Name might be "Samsung", "Pixel", "Gadget Serial", or "Android".*
6.  Look at the Driver box on the right.
    *   **Goal**: Change it to **WinUSB**.
    *   Click **Replace Driver** (or Install Driver).
    *   *Wait for it to finish.*

> **Status Check**: Now your computer can "talk" to the phone as a Keyboard/Mouse. It CANNOT do normal ADB/File Transfer yet.

---

## 🤖 PHASE 2: RUN THE AUTOMATION
1.  Open the folder: `C:\Users\User\Desktop\VSCode\ForceScreencast`
2.  **Edit Password**: Open `phone_password.txt` and make sure your PIN (`521452`) is correct. Save it.
3.  Double-click **`run_macro.bat`**.

**What happens next (Automated):**
1.  The script launches.
2.  It opens a black window (This is the "OTG" controller).
3.  It **Automatically Unlocks** your phone using the PIN in the text file.

**Did it work?**
*   **Yes**: You usually hear a "USB Connected" sound (different from charging sound).
*   **No**: Running it again? Make sure to close the black window first.

---

## 🔄 PHASE 3: RESET DRIVERS (Required for Screencast!)
Now that USB Debugging is ON, we need to switch the driver BACK so the Screencast app can see the screen.

1.  **Close** any running script windows.
2.  Open **Device Manager** on your PC (Right-click Start -> Device Manager).
3.  Locate your device:
    *   It will likely be under "Universal Serial Bus devices" (because we made it WinUSB).
4.  **Right-Click** your device -> **Uninstall Device**.
    *   ✅ Check the box **"Attempt to remove the driver for this device"**.
    *   Click **Uninstall**.
5.  **Unplug** your phone.
6.  **Replug** your phone.
    *   Windows should automatically reinstall the "Original" driver (MTP/ADB).

---

## 📺 PHASE 4: SCREENCAST
1.  Double-click **`run_screencast.bat`**.
2.  You should see your screen! 🎉

---

### ❓ FAQ
*   **Script types PIN but phone doesn't unlock?**
    *   Timing might be off. Try running it again.
    *   Or unlock manually before running the script.
*   **"USB Device not found" in Phase 2?**
    *   You didn't do Phase 1 (Zadig) correctly.
*   **"Device Unauthorized" in Phase 4?**
    *   The robot failed to click "Allow". You might need to try the automation again (Remember to switch drivers back to WinUSB first!).
