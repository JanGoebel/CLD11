# Build-Exe.ps1 - builds the "ATM Application" build spec and zips the result.
#
#   .\tools\Build-Exe.ps1
#
# Output: builds\ATM\ATM.exe (+ ATM accounts.txt) and builds\ATM.zip

# 64-bit LabVIEW 2026 with Application Builder.
$LabVIEW = "C:\Program Files\National Instruments\LabVIEW 2026\LabVIEW.exe"
$Port    = 3364
$Project = "ATM (100928D-01)\Template\Automatic Teller Machine\ATM Solution.lvproj"

Set-Location (git rev-parse --show-toplevel)
Remove-Item builds -Recurse -Force -ErrorAction SilentlyContinue

# Early branches of the PR stack have no build spec yet - nothing to build.
if (-not (Select-String -Path $Project -Pattern 'Name="ATM Application"' -Quiet)) {
    Write-Host "No build spec on this branch yet - skipped."
    exit 0
}

LabVIEWCLI -OperationName ExecuteBuildSpec -ProjectPath (Resolve-Path $Project) `
    -BuildSpecName "ATM Application" -LabVIEWPath $LabVIEW -PortNumber $Port
if (-not (Test-Path builds\ATM\ATM.exe)) { Write-Error "Build failed: builds\ATM\ATM.exe not found"; exit 1 }

Compress-Archive builds\ATM\* builds\ATM.zip
Write-Host "Done: builds\ATM.zip"
