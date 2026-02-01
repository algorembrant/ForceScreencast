# AUTOMATED BLIND NAVIGATION MACRO (FULL AUTO)
# Reads PIN from phone_password.txt

$scriptPath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptPath
$pinFile = Join-Path $dir "phone_password.txt"
$scrcpyPath = "C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4\scrcpy.exe"
$wshell = New-Object -ComObject WScript.Shell

Write-Host "ANDROID RECOVERY - FULL AUTOMATION" -ForegroundColor Cyan
Write-Host "---------------------------------------------------"

# 1. READ PASSWORD
$pin = ""
if (Test-Path $pinFile) {
    $pin = Get-Content $pinFile
    Write-Host "Loaded PIN from file." -ForegroundColor Green
}

if ($pin -eq $null) {
    Write-Host "phone_password.txt not found or empty!" -ForegroundColor Red
    $pin = Read-Host "Enter PIN manually"
}

Write-Host "---------------------------------------------------"
Write-Host "PREPARE YOUR PHONE:"
Write-Host "1. Connect USB Cable."
Write-Host "2. Ensure Zadig WinUSB driver is installed."
Write-Host "---------------------------------------------------"
Write-Host "Starting in 3 seconds... HANDS OFF!" 
Start-Sleep 3

# 2. LAUNCH SCRCPY
$p = Start-Process -FilePath $scrcpyPath -ArgumentList "--otg -K -M --window-title ANDROID_RECOVERY" -PassThru
Write-Host "Scrcpy launched."
Write-Host "Waiting 5 seconds for initialization..."
Start-Sleep 5

# Refocus logic
$wshell.AppActivate("ANDROID_RECOVERY")
Start-Sleep 1

# 3. WAKE & UNLOCK
Write-Host "EXECUTE: Unlock Sequence"
Write-Host "   -> Sending SPACE (Wake)"
$wshell.SendKeys(" ")
Start-Sleep 1
$wshell.SendKeys(" ")
Start-Sleep 1

Write-Host "   -> Sending PIN"
$wshell.SendKeys($pin)
Start-Sleep 1

Write-Host "   -> Sending ENTER (Confirm PIN)"
$wshell.SendKeys("{ENTER}")
Start-Sleep 2

# 4. OPEN APP DRAWER (AUTO-SWIPE)
Write-Host "EXECUTE: Open App Drawer"
# We cannot send mouse clicks via SendKeys easily.
# BUT, we can try generic keys that trigger search/drawer.
# Try: WinKey (often intercepted), Alt+Space, Ctrl+Esc.
# BETTER IDEA: Use TAB to navigate to search bar if on pixel?
# BEST GUESS ALTERNATIVE: Double Press Space usually does nothing, but...
# Let's try sending META key via special scrcpy request? No, impossible in OTG.

# We will try the "Type to Search" feature.
# On many Launchers (Pixel/Samsung), typing on Home screen starts search.
Write-Host "   -> Trying correct method: Typing directly on Home Screen..."

# Go Home first
$wshell.SendKeys("^{ESC}") 
Start-Sleep 1
$wshell.SendKeys("^{ESC}") 
Start-Sleep 1

# 5. AUTOMATED CONFIGURATION
Write-Host "EXECUTE: Search and Enable"
Write-Host "   -> Typing USB Debugging"
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

Write-Host "   -> Handling Allow Popup (RIGHT -> ENTER)"
$wshell.SendKeys("{RIGHT}")
Start-Sleep 1
$wshell.SendKeys("{ENTER}")

# Backup attempt for popup
Start-Sleep 1
$wshell.SendKeys("{TAB}")
Start-Sleep 1
$wshell.SendKeys("{ENTER}")

Write-Host "DONE. If you heard a USB Connect sound, it worked."
Write-Host "Check RECOVERY_GUIDE.md for details on Resetting Drivers!"
Start-Sleep 5
