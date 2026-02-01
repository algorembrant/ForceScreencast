# AUTOMATED BLIND NAVIGATION MACRO
# Tries to enable USB Debugging using "Search" instead of blind scrolling.

$scrcpyPath = "C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4\scrcpy.exe"
$wshell = New-Object -ComObject WScript.Shell

Write-Host "🤖 AUTO-NAVIGATION MACRO" -ForegroundColor Cyan
Write-Host "This script will: "
Write-Host "1. Launch scrcpy (OTG)."
Write-Host "2. Wait 5 seconds."
Write-Host "3. Type your PIN to unlock."
Write-Host "4. Search for 'USB Debugging' and try to enable it."
Write-Host "---------------------------------------------------"

$pin = Read-Host "Enter your PIN (leave empty if none)"
Write-Host "---------------------------------------------------"
Write-Host "🛑 HANDS OFF THE KEYBOARD ONCE STARTED!" -ForegroundColor Red
Write-Host "Starting in 3..."
Start-Sleep 1
Write-Host "2..."
Start-Sleep 1
Write-Host "1..."
Start-Sleep 1

# Launch scrcpy asynchronously
$p = Start-Process -FilePath $scrcpyPath -ArgumentList "--otg -K -M" -PassThru
Write-Host "🚀 Scrcpy launched. Initializing..."
Start-Sleep 5

# --- SEQUENCE START ---

# 1. WAKE UP
Write-Host "Sending: Wake (Space)"
$wshell.SendKeys(" ")
Start-Sleep -Milliseconds 500
$wshell.SendKeys(" ") # Double tap space just in case
Start-Sleep 1

# 2. UNLOCK
if ($pin) {
    Write-Host "Sending: Swipe Up + PIN"
    # Some phones need a modifier to "Swipe" or just typing works
    # Helper: Win+B (Back) closes lock screen notifications?
    # Try typing PIN directly
    $wshell.SendKeys($pin)
    Start-Sleep -Milliseconds 500
    $wshell.SendKeys("{ENTER}")
    Start-Sleep 2
}

# 3. TRIGGER SEARCH (The magic step)
Write-Host "Sending: Search Trigger (Win Key)"
# '^{ESC}' is Ctrl+Esc which sends Start Menu in Windows, usually triggers Home/Menu on Android
# scrcpy maps Left Win to APP_SWITCH or SEARCH depending on config.
# Let's try sending text directly assuming we are at Home.
$wshell.SendKeys("^{ESC}") # Go Home?
Start-Sleep 1
$wshell.SendKeys("^{ESC}") # Ensure Home
Start-Sleep 1

# On many Androids, just typing searches Apps
Write-Host "Searching: 'USB Debugging'"
$wshell.SendKeys("USB Debugging")
Start-Sleep 2

# Select first result
Write-Host "Selecting Result..."
$wshell.SendKeys("{DOWN}")
Start-Sleep 1
$wshell.SendKeys("{ENTER}")
Start-Sleep 3 # Wait for settings to open

# 4. TOGGLE
Write-Host "Attempting Toggle (Enter)"
$wshell.SendKeys("{ENTER}")
Start-Sleep 1

# 5. AUTHORIZE POPUP (Right -> Enter)
Write-Host "Authorizing Popup (Right -> Enter)"
$wshell.SendKeys("{RIGHT}")
Start-Sleep -Milliseconds 500
$wshell.SendKeys("{ENTER}")

# 6. ALTERNATE AUTHORIZE (Tab -> Enter)
Start-Sleep 1
Write-Host "Trying Alternate Auth (Tab -> Enter)"
$wshell.SendKeys("{TAB}")
Start-Sleep -Milliseconds 500
$wshell.SendKeys("{ENTER}")

Write-Host "✅ Macro Finished."
Write-Host "Check if 'run_screencast.bat' works now!"
Start-Sleep 5
