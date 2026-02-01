# 🕹️ Manual Android Recovery (Blind Mode)

Use this guide if the **Automation Script** failed or if you prefer to control the process yourself manually.

## 🛑 Step 1: Driver Setup (Mandatory)
Just like the automated method, you MUST replace your phone's driver with **WinUSB** using [Zadig](https://zadig.akeo.ie/) for the keyboard/mouse to work.
*   *Refer to Phase 1 in `RECOVERY_GUIDE.md` for these steps.*

## 🚀 Step 2: Start Manual Control
1.  Go to `C:\Users\User\Desktop\VSCode\ForceScreencast`
2.  Double-click **`run_OTG.bat`**.
3.  A black window will open.
    *   **Note**: You will NOT see your screen. This window just forwards your keyboard/mouse clicks to the phone.

## 🧠 Step 3: Blind Navigation Tactics
You are now "flying blind". Use these keyboard shortcuts to navigate.

### A. Waking & Unlocking
1.  **Wake Up**: Press **Spacebar** twice (Wait 1 second).
2.  **Unlock**:
    *   **No PIN**: Swipe Up (Click and drag mouse up).
    *   **PIN**: Type your PIN keys on your Numpad/Keyboard. Press **Enter**.
    *   *Listen for the unlock sound.*

### B. Finding Settings
Method 1: **The Search Shortcut** (Best)
1.  Press **Windows Key** (or `Ctrl+Esc`).
    *   *This usually opens the App Drawer or Search.*
2.  Type "USB Debugging".
3.  Press **Down Arrow** once (to select first result).
4.  Press **Enter**.

Method 2: **The Notification Shade**
1.  Press **Win + N**.
2.  Press **Right Arrow** repeatedly until you find the "Settings" gear (usually top-right).
3.  Press **Enter**.

### C. Enabling Debugging (If Method 1 Worked)
If you are inside the "Developer Options" menu:
1.  **Toggle Switch**: Press **Enter** (to flip the switch you landed on).
2.  **Authorize**:
    *   A popup says "Allow USB Debugging?".
    *   Press **Right Arrow** (focus "Allow").
    *   Press **Enter**.

### D. Enabling Debugging (The Hard Way - From Scratch)
If you can't find it via search:
1.  Navigate to **Settings**.
2.  Scroll to bottom (Press **End** key).
3.  Go to **About Phone** (Up Arrow x1 -> Enter).
4.  Find **Build Number** (End Key -> Enter x7 times).
    *   *You are now a developer!*
5.  Go Back (**Esc**).
6.  Find **System > Developer Options**.
7.  Scroll down to **USB Debugging** (Down Arrow x10 approx).
8.  Press **Enter**.
9.  Press **Right Arrow** -> **Enter** (to Allow).

## 🔊 Step 4: Verification
*   **Success**: You hear the Windows "USB Device Connected" sound (distinct from charging sound).
*   **Failure**: Silence. Close the window and try again.

## 🏁 Step 5: Finish
Once verified:
1.  **Reset Drivers** (Uninstall device in Device Manager).
2.  Run **`run_screencast.bat`**.
