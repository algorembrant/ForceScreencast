# AUTOMATED BLIND NAVIGATION MACRO (HYBRID - AUTO SETTINGS)
# User: Unlocks Manually -> Presses Enter
# Script: Finds Settings (Swipe Up -> Type) -> Enables Debugging

# C# definition for Mouse Actions (Swipe Up)
$code = @"
    [DllImport("user32.dll")]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);
    public const int MOUSEEVENTF_LEFTDOWN = 0x02;
    public const int MOUSEEVENTF_LEFTUP = 0x04;
    public const int MOUSEEVENTF_MOVE = 0x01;
"@
Add-Type -MemberDefinition $code -Name Win32 -Namespace User32

$scrcpyPath = "C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4\scrcpy.exe"
$wshell = New-Object -ComObject WScript.Shell

Write-Host "ANDROID RECOVERY - AUTO SETTINGS FINDER" -ForegroundColor Cyan
Write-Host "---------------------------------------------------"
Write-Host "1. I will launch scrcpy."
Write-Host "2. YOU unlock the phone manually."
Write-Host "3. I will Find Settings and Enable Debugging."
Write-Host "---------------------------------------------------"

# 1. LAUNCH SCRCPY
$p = Start-Process -FilePath $scrcpyPath -ArgumentList "--otg -K -M --window-title ANDROID_RECOVERY" -PassThru
Write-Host "🚀 Scrcpy launched."
Write-Host "---------------------------------------------------"
Write-Host "⚠️  MANUAL ACTIONS REQUIRED ⚠️" -ForegroundColor Yellow
Write-Host "1. UNLOCK your phone (Space, Swipe, Password)."
Write-Host "2. STAY ON THE HOME SCREEN."
Write-Host "3. Click back on THIS window."
Write-Host "4. Press ENTER (Twice if needed) to start automation."
Write-Host "---------------------------------------------------"
Read-Host

# 2. DELAY & REFOCUS (CRITICAL)
Write-Host "⏳ Waiting 3 seconds (Hands Off!)..."
Start-Sleep 3

Write-Host "🔄 Refocusing Android Window..."
$wshell.AppActivate("ANDROID_RECOVERY")
Start-Sleep 1

# 3. FIND SETTINGS (App Drawer Strategy)
Write-Host "EXECUTE: Find Settings App"
# Clear screen/Go Home
Write-Host "   -> Sending ESC (Back) to clear screen"
$wshell.SendKeys("{ESC}") 
Start-Sleep -Milliseconds 500
$wshell.SendKeys("{ESC}") 

# Swipe Up (Open App Drawer)
Write-Host "   -> Swiping Up to Open App Drawer (Mouse)"
[User32.Win32]::mouse_event(0x02, 0, 0, 0, 0) # Down
Start-Sleep -Milliseconds 100
for ($i = 0; $i -lt 20; $i++) {
    [User32.Win32]::mouse_event(0x01, 0, -20, 0, 0) # Move Up
    Start-Sleep -Milliseconds 10
}
[User32.Win32]::mouse_event(0x04, 0, 0, 0, 0) # Up
Start-Sleep 1

# Type "Settings"
Write-Host "   -> Typing 'Settings'"
$wshell.SendKeys("Settings")
Start-Sleep 2

# Select and Enter
Write-Host "   -> Entering Settings (Down -> Enter)"
$wshell.SendKeys("{DOWN}") 
Start-Sleep 1
$wshell.SendKeys("{ENTER}")
Start-Sleep 3

# --- STEP 4: ENABLE DEV OPTIONS ---
Write-Host "EXECUTE: Enable Developer Options"
Write-Host "   -> Scrolling to Bottom (End)"
$wshell.SendKeys("{END}")
Start-Sleep 1

# Select About Phone
Write-Host "   -> Selecting About Phone (Enter)"
$wshell.SendKeys("{ENTER}")
Start-Sleep 1

# Find Build Number
Write-Host "   -> Clicking Build Number 7 times"
$wshell.SendKeys("{END}")
for ($i = 1; $i -le 7; $i++) {
    $wshell.SendKeys("{ENTER}")
    Start-Sleep -Milliseconds 100
}
Start-Sleep 1

# Go Back
Write-Host "   -> Going Back"
$wshell.SendKeys("{ESC}")
Start-Sleep 1

# --- STEP 5: ENABLE USB DEBUGGING ---
Write-Host "EXECUTE: Enable USB Debugging"
Write-Host "   -> finding System/Dev Options"
$wshell.SendKeys("{END}")
Start-Sleep 1
$wshell.SendKeys("{UP}") 
Start-Sleep 1
$wshell.SendKeys("{ENTER}") 
Start-Sleep 1

# Toggle USB Debugging
Write-Host "   -> Finding USB Toggle/Dev Options"
$wshell.SendKeys("{END}")
Start-Sleep 1
$wshell.SendKeys("{ENTER}") # Enter Dev Options
Start-Sleep 1

Write-Host "   -> Finding Switch (Scroll Down)"
for ($i = 1; $i -le 12; $i++) {
    $wshell.SendKeys("{DOWN}")
    Start-Sleep -Milliseconds 50
}
$wshell.SendKeys("{ENTER}") # Toggle
Start-Sleep 2

# Verify Popup
Write-Host "   -> Confirming Popup (Right -> Enter)"
$wshell.SendKeys("{RIGHT}")
$wshell.SendKeys("{ENTER}")

Write-Host "DONE. Check for USB Sound!"
Start-Sleep 5
