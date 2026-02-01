# Launch scrcpy in Standard Mode (Requires USB Debugging ON)
Write-Host "Attempting to launch scrcpy..." -ForegroundColor Cyan

$scrcpyPath = "C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4\scrcpy.exe"

try {
    & $scrcpyPath --turn-screen-off --stay-awake
}
catch {
    Write-Host "Error running scrcpy at $scrcpyPath" -ForegroundColor Red
    Write-Error $_
}

Write-Host "`nPress Enter to exit..."
Read-Host
