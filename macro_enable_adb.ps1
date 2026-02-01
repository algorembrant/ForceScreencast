# AUTOMATED BLIND NAVIGATION MACRO (SEMI-AUTO)
# 1. Launches scrcpy.
# 2. Lets usually unlock manually.
# 3. Refocuses window and runs navigation macro.

$scrcpyPath = "C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4\scrcpy.exe"
$wshell = New-Object -ComObject WScript.Shell

Write-Host "🤖 ANDROID RECOVERY ASSISTANT" -ForegroundColor Cyan
Write-Host "---------------------------------------------------"
Write-Host "STEP 1: LAUNCH & UNLOCK"
Write-Host "I will launch the scrcpy window for you."
Write-Host "Please use your keyboard/mouse to UNLOCK the phone manually."
Write-Host "(Listen for the unlock sound to confirm!)"
Write-Host "---------------------------------------------------"
Write-Host "Press ENTER to launch scrcpy..."
Read-Host

# Launch scrcpy asynchronously
$p = Start-Process -FilePath $scrcpyPath -ArgumentList "--otg -K -M --window-title 'ANDROID_RECOVERY'" -PassThru
Write-Host "🚀 Scrcpy launched."
Write-Host "--> Please UNLOCK your phone now."
Write-Host "--> When unlocked, click back on THIS window and Press ENTER."
Read-Host

# --- SEQUENCE START ---
Write-Host "STEP 2: AUTOMATION STARTING"
Write-Host "Attempting to refocus 'ANDROID_RECOVERY' window..."

# Try to switch focus to scrcpy
$focusSuccess = $wshell.AppActivate("ANDROID_RECOVERY")
if (-not $focusSuccess) {
    Write-Host "⚠️  Could not find window 'ANDROID_RECOVERY'. Trying generic..."
    $wshell.AppActivate("scrcpy")
}

Write-Host "Starting navigation macros in 2 seconds..."
Write-Host "HANDS OFF!" -ForegroundColor Red
Start-Sleep 2

# 3. TRIGGER SEARCH (The magic step)
Write-Host "Sending: Go Home & Search..."
$wshell.SendKeys("^{ESC}") # Go Home
Start-Sleep 1
$wshell.SendKeys("^{ESC}") # Ensure Home
Start-Sleep 1

# Search
Write-Host "Typing: 'USB Debugging'..."
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
