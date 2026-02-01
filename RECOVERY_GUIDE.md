# Android Control Recovery Guide (Dead Screen / No USB Debugging)

This guide helps you regain control of an Android phone when the screen is broken/dead AND USB debugging is disabled.

## 🚨 Prerequisites
1.  **scrcpy (v2.0 or later)**:
    *   **Configured Location**: The scripts are set to look in: `C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4`
    *   If you move this folder, you will need to edit the `.ps1` files to match the new location.
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

## 🚀 Step 2: The Easy Method (Automated)
I have created "One-Click" tools for you. You do **not** need to use PowerShell or terminals manually.

### Option A: The "Blind" Macro (Try this first!)
1.  Double-click **`run_macro.bat`**.
2.  Enter your PIN if asked.
3.  **HANDS OFF!**
    *   The script will launch scrcpy in OTG mode.
    *   It will automatically press `Win` key, search for "USB Debugging", and try to turn it on.
    *   It will try to click "Allow" on the popup.
4.  If you hear a "USB Connected" sound, it worked! Proceed to Step 4.

### Option B: Manual Control via OTG
If the macro fails (e.g. opens Google Assistant instead of Search):
1.  Double-click **`run_OTG.bat`**.
2.  A window will open capturing your keyboard/mouse.
3.  Follow **Step 3: Manual Navigation** below.

## 🕹️ Step 3: Manual Navigation (Fallback)
If Option A failed, use Option B to control the phone manually.
1.  **Unlock**: Press `Space` to wake. Type PIN. Press `Enter`.
2.  **Go to Settings**:
    *   Try `Win+N` (Notifications) -> Arrow Keys -> Gear Icon.
    *   OR: `Win` key -> Type "Settings" -> Enter.
3.  **Enable USB Debugging**:
    *   Navigate to **Settings -> System -> Developer Options**.
    *   Find **USB Debugging** (scroll down).
    *   Press `Enter` to toggle.
    *   **Crucial**: Press `Right Arrow` -> `Enter` to click "Allow" on the blind popup.

## 🎉 Step 4: Screencast
Once USB Debugging is ON:
1.  Double-click **`run_screencast.bat`**.
2.  You should see your screen!

## 🆘 Troubleshooting
*   **"USB device not found"**:
    *   You likely need the **WinUSB** driver.
    *   Open **Zadig**, Select device -> Replace driver with `WinUSB`.
    *   See "Step 1" section above for details.
*   **VS Code Errors**:
    *   Do NOT run `.ps1` files inside VS Code.
    *   Always double-click the `.bat` files in File Explorer.
