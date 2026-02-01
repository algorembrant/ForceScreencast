# Android Control Recovery Guide (Dead Screen / No USB Debugging)

This guide helps you regain control of an Android phone when the screen is broken/dead AND USB debugging is disabled.

## 🚨 Prerequisites
1.  **scrcpy (v2.0 or later)**: You must have `scrcpy` installed.
    *   Download: [https://github.com/Genymobile/scrcpy/releases](https://github.com/Genymobile/scrcpy/releases)
    *   Extract it to a folder (e.g., `C:\scrcpy`).
    *   Add that folder to your System PATH or copy these scripts into that folder.
2.  **USB Cable**: Connect your phone to the PC.

## 🛠️ Step 1: The "OTG" Mode Trick
Since USB debugging is OFF, standard screencasting won't work. We use **OTG Mode**, which turns your computer into a physical keyboard/mouse for the phone.

**IMPORTANT (Windows Users):**
To use OTG mode on Windows, you often need to change the USB driver for the device to `WinUSB`.
1.  Download **Zadig**: [https://zadig.akeo.ie/](https://zadig.akeo.ie/)
2.  Open Zadig.
3.  Tips -> **List All Devices**.
4.  Select your phone from the dropdown (it might show as "Gadget Serial", "Samsung_Android", or similar).
5.  Ensure the target driver (right side) is **WinUSB**.
6.  Click **Replace Driver**.
    *   *Note: This breaks normal file transfer/ADB access until you revert it, but we need it for OTG.*

## 🚀 Step 2: Running the Tool
1.  Right-click `check_requirements.ps1` -> **Run with PowerShell** to confirm you have `scrcpy`.
2.  Right-click `start_otg_control.ps1` -> **Run with PowerShell**.
    *   If successful, a black window might appear. This captures your mouse/keyboard.
    *   **The scrcpy window will NOT show your phone screen yet (because ADB is off).** You are flying blind.

## 🕹️ Step 3: Blind Navigation (The Hard Part)
You need to enable USB Debugging blindly using the keyboard.
1.  **Unlock**: Press `Space` or click mouse to wake. Type your PIN/Password blindly. Press `Enter`.
2.  **Go to Settings**:
    *   Try `Win+N` (open notification shade).
    *   Use Arrow keys to find the "Settings" gear (usually top right).
    *   OR: Trigger Google Assistant (`Win+A` or `Win` or long-press Home) and type/say "Open Settings".
3.  **Enable Developer Options**:
    *   Navigate clear to the bottom (End key).
    *   Go up to "About Phone". Enter.
    *   Find "Build Number" (usually at the bottom).
    *   Press `Enter` (or click) 7 times.
    *   *If you have sound on, listen for the "You are now a developer" toast sound.*
4.  **Enable USB Debugging**:
    *   Go back (`Esc` or `Backspace`).
    *   Find "System" -> "Developer Options" (or just "Developer Options" at the bottom).
    *   Scroll down slightly to find "USB Debugging".
    *   Toggle it ON.
    *   **CRITICAL**: You will see a popup asking to "Allow USB Debugging?".
    *   Press `Right` arrow (to select "Allow") then `Enter`.

## 🎉 Step 4: Screencast
Once USB Debugging is ON:
1.  Unplug/replug the phone (reverts standard USB driver usage if installed, or you might need to uninstall the WinUSB driver in Device Manager if ADB doesn't see it).
2.  Run `start_screencast.ps1`.
3.  You should see your screen!

## 🆘 Troubleshooting
*   **"Could not find any USB device"**: Check Zadig steps above.
*   **"Device unauthorized"**: You turned on debugging but didn't click "Allow" on the popup. Re-connect and try blindly pressing Right -> Enter.
