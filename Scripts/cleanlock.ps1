$lockFile = ".git/index.lock"
if (Test-Path $lockFile) {
    Remove-Item $lockFile
    Write-Host "Removed lock file"
}
else {
    Write-Host "No lock file found"
}