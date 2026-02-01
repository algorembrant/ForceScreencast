# Launch scrcpy in OTG (HID) Mode
Write-Host "Attempting to launch scrcpy in OTG Mode..." -ForegroundColor Cyan
Write-Host "NOTE: You may need to use Zadig to replace the USB driver with WinUSB for this to work on Windows." -ForegroundColor Yellow
Write-Host "Waiting 3 seconds..."
Start-Sleep -Seconds 3

$scrcpyPath = "C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4\scrcpy.exe"

# Try to run scrcpy with OTG arguments
# -K = HID keyboard, -M = HID mouse
try {
    & $scrcpyPath --otg -K -M
}
catch {
    Write-Host "❌ Error running scrcpy at $scrcpyPath" -ForegroundColor Red
    Write-Error $_
}

Write-Host "`nIf the window closed immediately, read the error above."
Write-Host "If it says 'USB device not found', check the Zadig driver steps in RECOVERY_GUIDE.md"
Write-Host "Press Enter to exit..."
Read-Host
