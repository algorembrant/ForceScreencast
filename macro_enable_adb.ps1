# AUTOMATED BLIND NAVIGATION MACRO (FULL AUTO)
# Reads PIN from phone_password.txt

$scriptPath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptPath
$pinFile = Join-Path $dir "phone_password.txt"
$scrcpyPath = "C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4\scrcpy.exe"
$wshell = New-Object -ComObject WScript.Shell

Write-Host "🤖 ANDROID RECOVERY - FULL AUTOMATION" -ForegroundColor Cyan
Write-Host "---------------------------------------------------"

# 1. READ PASSWORD
if (Test-Path $pinFile) {
    $pin = Get-Content $pinFile | ForEach-Object { $_.Trim() }
    Write-Host "🔑 Loaded PIN from file: $pin" -ForegroundColor Green
}
else {
    Write-Host "❌ phone_password.txt not found!" -ForegroundColor Red
    $pin = Read-Host "Enter PIN manually"
}

Write-Host "---------------------------------------------------"
Write-Host "PREPARE YOUR PHONE:"
Write-Host "1. Connect USB Cable."
Write-Host "2. Ensure Zadig 'WinUSB' driver is installed (See Guide)."
Write-Host "---------------------------------------------------"
Write-Host "Starting in 3 seconds... HANDS OFF!" 
Start-Sleep 3

# 2. LAUNCH SCRCPY
$p = Start-Process -FilePath $scrcpyPath -ArgumentList "--otg -K -M --window-title 'ANDROID_RECOVERY'" -PassThru
Write-Host "🚀 Scrcpy launched."
Write-Host "⏳ Waiting 5 seconds for initialization..."
Start-Sleep 5

# Refocus logic just in case
$wshell.AppActivate("ANDROID_RECOVERY")
Start-Sleep 1

# 3. WAKE & UNLOCK
Write-Host "🔓 EXECUTE: Unlock Sequence"
Write-Host "   -> Sending SPACE (Wake)"
$wshell.SendKeys(" ")
Start-Sleep 1
$wshell.SendKeys(" ") # Double tap to be safe
Start-Sleep 1

Write-Host "   -> Sending PIN ($pin)"
$wshell.SendKeys($pin)
Start-Sleep 1

Write-Host "   -> Sending ENTER (Confirm PIN)"
$wshell.SendKeys("{ENTER}")
Start-Sleep 2

# 4. MANUAL INTERVENTION (THE SEARCH BAR)
Write-Host "---------------------------------------------------"
Write-Host "⚠️  MANUAL STEP REQUIRED ⚠️" -ForegroundColor Yellow
Write-Host "The script cannot reliably press the 'Windows/Search' key."
Write-Host "1. Look at your phone (or listen)."
Write-Host "2. Press your keyboard's WINDOWS KEY (or click mouse) to open the App Drawer/Search."
Write-Host "3. IMMEDIATELY press ENTER in THIS terminal window to continue."
Write-Host "---------------------------------------------------"
Read-Host

# 5. AUTOMATED CONFIGURATION
Write-Host "⏳ Resuming Automation in 2 seconds..."
$wshell.AppActivate("ANDROID_RECOVERY")
Start-Sleep 2

Write-Host "🔍 EXECUTE: Search & Enable"
Write-Host "   -> Typing 'USB Debugging'"
$wshell.SendKeys("USB Debugging")
Start-Sleep 2

Write-Host "   -> Selecting first result (DOWN -> ENTER)"
$wshell.SendKeys("{DOWN}")
Start-Sleep 1
$wshell.SendKeys("{ENTER}")
Start-Sleep 3

Write-Host "   -> Toggling Switch (ENTER)"
$wshell.SendKeys("{ENTER}")
Start-Sleep 1

Write-Host "   -> Handling 'Allow?' Popup (RIGHT -> ENTER)"
$wshell.SendKeys("{RIGHT}")
Start-Sleep -Milliseconds 500
$wshell.SendKeys("{ENTER}")

# Backup attempt for popup
Start-Sleep 1
$wshell.SendKeys("{TAB}")
Start-Sleep -Milliseconds 500
$wshell.SendKeys("{ENTER}")

Write-Host "✅ DONE. If you heard a 'USB Connect' sound, it worked."
Write-Host "Check RECOVERY_GUIDE.md for 'How to Reset Drivers'!"
Start-Sleep 5
