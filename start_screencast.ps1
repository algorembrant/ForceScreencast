# Launch scrcpy in Standard Mode (Requires USB Debugging ON)
Write-Host "Attempting to launch scrcpy..." -ForegroundColor Cyan

try {
    & scrcpy --turn-screen-off --stay-awake
} catch {
    Write-Host "❌ Error running scrcpy." -ForegroundColor Red
    Write-Error $_
}

Write-Host "`nPress Enter to exit..."
Read-Host
