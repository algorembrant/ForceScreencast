# ForceScreencast

ForceScreencast is a utility toolkit designed to help users recover control of an Android phone with a dead or broken screen (black screen), even if "USB Debugging" is initially disabled.

## Features

*   **OTG Control**: Use your computer's keyboard and mouse to control the phone blindly (imitating a physical keyboard/mouse connection).
*   **Automated Enablement**: Script (`macro_enable_adb.ps1`) to automatically navigate to Settings and enable USB Debugging.
*   **Blind Navigation Guide**: Detailed tips on how to navigate Android without seeing the screen.
*   **Full Screencast**: Once enabled, fully mirror and control the device using scrcpy.

## Prerequisites

*   Windows PC.
*   USB Cable to connect the phone.
*   **Zadig**: Tool for replacing USB drivers (Required for OTG mode).
*   **scrcpy**: The scripts are configured for `C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4`. If you have it elsewhere, edit strict paths in the `.ps1` files.

---

## Recovery Guide

### Phase 1: Driver Setup (Crucial)

You must change your phone's USB driver for the "Blind" generic mouse/keyboard tool to work. Standard ADB drivers do not work for this mode.

1.  Download **Zadig** (https://zadig.akeo.ie/).
2.  Connect your phone via USB.
3.  Open **Zadig**.
4.  Click **Options** -> **List All Devices**.
5.  Select your phone in the dropdown. (Name might be "Samsung", "Pixel", "Gadget Serial", or "Android").
6.  Look at the Driver box on the right.
    *   **Goal**: Change it to **WinUSB**.
    *   Click **Replace Driver** (or Install Driver).
    *   Wait for it to finish.

**Status Check**: Now your computer can "talk" to the phone as a Keyboard/Mouse. It CANNOT do normal ADB/File Transfer yet.

### Phase 2: Run the Automation

You can either manually control the phone or use the included macro script.

**Option A: Automated Script (Recommended)**
1.  Double-click `run_macro.bat`.
2.  **Manual Part**: The script will launch a black window and PAUSE.
    *   **Unlock** your phone manually (Spacebar to wake, Swipe Up with mouse, Type Password/PIN).
    *   **Open Settings** manually (or ensure you are on the Home Screen).
3.  **Automated Part**:
    *   Once enabled, click the script window and Press **ENTER**.
    *   **Hands Off!** The script will attempt to:
        *   Swipe up and find Settings.
        *   Enable Developer Mode (build number clicks).
        *   Find Developer Options.
        *   Enable USB Debugging.
        *   Accept the "Allow USB Debugging?" popup (Right Arrow -> Enter).

**Option B: Manual OTG Control**
1.  Double-click `run_OTG.bat`.
2.  Use your keyboard and mouse to navigate blindly.
    *   **Wake**: Spacebar.
    *   **Unlock**: Click and Drag mouse UP. Type PIN.
    *   **Navigate**: Arrow keys, Enter, Esc (Back).

### Phase 3: Reset Drivers (Required for Screencast)

Now that USB Debugging is ON, you must switch the driver BACK so the Screencast app (ADB) can see the screen.

1.  **Close** any running script windows.
2.  Open **Device Manager** on your PC.
3.  Locate your device (likely under "Universal Serial Bus devices" because we made it WinUSB).
4.  **Right-Click** your device -> **Uninstall Device**.
    *   Check the box **"Attempt to remove the driver for this device"**.
    *   Click **Uninstall**.
5.  **Unplug** your phone.
6.  **Replug** your phone. Windows should automatically reinstall the "Original" driver (MTP/ADB).

### Phase 4: Start Screencast

1.  Double-click `run_screencast.bat`.
2.  You should now see your phone screen mirrored on your PC.

---

## Blind Navigation Tips

Navigating a phone with a dead screen is difficult. Here are tricks to help you find your way.

### The "Golden Ticket": TalkBack
If you can enable TalkBack (Screen Reader), the phone will **tell you** what you are selecting.
*   **Shortcut**: Press `Win+Alt+Enter` (sometimes `Ctrl+Alt+Enter` or Hold `Volume Up + Volume Down` for 3 seconds).
*   **If enabled**: You will hear "TalkBack On".
*   **Navigation changes**:
    *   Use `Alt+Right` / `Alt+Left` to move focus.
    *   Use `Alt+Enter` to click.

### Common Keyboard Shortcuts
*   **Wake Up**: Press `Space` or `Power Key`.
*   **Unlock**:
    *   Swipe Up: Drag mouse up OR press `Space` then `Tab` then `Enter`.
    *   PIN: Type numbers on Numpad. Enter.
*   **Go Home**: `Win+Enter` or `Esc` multiple times.
*   **Notifications**: `Win+N`.
*   **Settings**: `Win+N`, then Right Arrow until you hit the gear icon.

### Use Sound
Turn your volume UP.
*   **Lock/Unlock sounds** indicate if the phone is awake.
*   **Charging sound** confirms USB connection.
*   **Screenshot sound** (`PrintScreen`) confirms the phone is on.

### Navigating Settings Blindly (Generic Android)
1.  **Open Settings**: Trigger Assistant (`Win`) and type "Open Developer Options" or "Open Settings".
2.  **Scroll to Bottom**: Press `End` key. ("About Phone" is usually at the bottom).
3.  **Enter "About Phone"**: Press `Up Arrow` once or twice, then `Enter`.
4.  **Find Build Number**: Press `End` (bottom), then `Enter` 7 times to enable Developer Mode.
5.  **Go Back**: `Esc`.
6.  **Find Developer Options**: It is often above "About Phone" or inside "System". Try `Up Arrow` -> `Enter`.
7.  **Enable USB Debugging**:
    *   Scroll down (Down Arrow x5-10).
    *   One of the items is the toggle. Press `Enter`.
    *   **The Trap**: A popup appears "Allow USB Debugging?".
    *   Press `Tab` (or Right Arrow) to move focus to "Allow/OK".
    *   Press `Enter`.

## Troubleshooting

*   **Script types PIN but phone doesn't unlock?** Timing might be off. Try manually unlocking before running the script.
*   **"USB Device not found"?** You likely didn't perform Phase 1 (Zadig Driver Switch) or the driver reverted.
*   **"Device Unauthorized"?** The automation failed to click "Allow" on the popup. Retry the process (Remember to switch drivers back and forth!).
