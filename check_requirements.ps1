# Check if scrcpy and adb are available
Write-Host "Checking requirements..." -ForegroundColor Cyan

$scrcpy = Get-Command scrcpy -ErrorAction SilentlyContinue
$adb = Get-Command adb -ErrorAction SilentlyContinue

if ($scrcpy) {
    Write-Host "✅ scrcpy found at: $($scrcpy.Source)" -ForegroundColor Green
} else {
    Write-Host "❌ scrcpy NOT found in PATH." -ForegroundColor Red
    Write-Host "   Please download it from: https://github.com/Genymobile/scrcpy/releases"
    Write-Host "   Extract it and place these scripts inside the scrcpy folder, or add it to specific PATH."
}

if ($adb) {
    Write-Host "✅ adb found at: $($adb.Source)" -ForegroundColor Green
} else {
    Write-Host "⚠️  adb NOT found (usually comes with scrcpy)." -ForegroundColor Yellow
}

Write-Host "`nPress Enter to exit..."
Read-Host
