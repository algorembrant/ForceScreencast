# 🕹️ Manual Android Recovery (Blind Mode)

**Goal:** Manually navigate the phone using keyboard/mouse to enable USB Debugging.

## 🛑 Step 1: Pre-requisites
1.  Ensure you have run **Zadig** and installed **WinUSB** driver (See Main Guide).
2.  Double-click **`run_OTG.bat`**.
3.  Focus on the black window.

## 📝 Step 2: The Manual Steps
Follow these steps exactly (as defined by user):

1.  **Wake Up**: Press **Space** key.
    *   *Wait a moment for screen to wake.*
2.  **Unlock**: **Swipe Up** using the mouse.
    *   *Click, Hold, Drag Up, Release.*
3.  **Password**: Type the password setup numbers one by one (on Numpad or Top Row).
4.  **Find Settings**:
### B. Finding Settings
Method 1: **Swipe Up (App Drawer)**
1.  **Swipe Up** with the mouse (Click, drag up, release).
2.  Type "Settings".
3.  Press **Down Arrow** once.
4.  Press **Enter**.

Method 2: **Notification Shade**
1.  Swipe **Down** from the top of the screen (Click, drag down).
2.  Use Arrow Keys to find the "Settings" gear.
3.  Press **Enter** when you think you have it selected.
8.  **Enable Developer Options**:
    *   (You usually need to scroll to bottom > About Phone > Build Number > Click 7 times).
9.  **Toggle USB Debugging**:
    *   (Find Developer Options > Scroll down > Toggle Switch > Confirm).
    *   *Remember: Right Arrow -> Enter to click "Allow" on popup.*

## 🏁 Step 3: Finish
Once verified:
1.  **Reset Drivers** (Uninstall device in Device Manager).
2.  Run **`run_screencast.bat`**.
