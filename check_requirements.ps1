# Check if scrcpy and adb are available
Write-Host "Checking requirements..." -ForegroundColor Cyan

$scrcpyBaseDir = "C:\Users\User\Desktop\scrcpy\scrcpy-win64-v3.3.4"
$scrcpyExe = "$scrcpyBaseDir\scrcpy.exe"
$adbExe = "$scrcpyBaseDir\adb.exe"

if (Test-Path $scrcpyExe) {
    Write-Host "✅ scrcpy found at: $scrcpyExe" -ForegroundColor Green
}
else {
    Write-Host "❌ scrcpy NOT found at: $scrcpyExe" -ForegroundColor Red
    Write-Host "   Please check the path."
}

if (Test-Path $adbExe) {
    Write-Host "✅ adb found at: $adbExe" -ForegroundColor Green
}
else {
    Write-Host "⚠️  adb NOT found at: $adbExe (usually comes with scrcpy)." -ForegroundColor Yellow
}

Write-Host "`nPress Enter to exit..."
Read-Host
