# Run-Tests.ps1 - runs all Caraya unit tests headless and makes an HTML report.
#
#   .\tools\Run-Tests.ps1
#
# Output: test-report\index.html and test-report\caraya-report.xml (JUnit)
# Exit code: 0 = all tests passed, 1 = a test failed.

# 64-bit LabVIEW 2026 - the one with Caraya installed.
$LabVIEW = "C:\Program Files\National Instruments\LabVIEW 2026\LabVIEW.exe"
$Port    = 3364
$Tests   = "ATM (100928D-01)\Template\Automatic Teller Machine\Tests"

Set-Location (git rev-parse --show-toplevel)
Remove-Item test-report -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory test-report | Out-Null

# 1. Run the suite. The runner VI writes Tests\results\caraya-report.xml.
LabVIEWCLI -OperationName RunVI -VIPath (Resolve-Path "$Tests\Run Tests CLI.vi") `
    -LabVIEWPath $LabVIEW -PortNumber $Port
$exitCode = $LASTEXITCODE
Copy-Item "$Tests\results\caraya-report.xml" test-report\ -ErrorAction SilentlyContinue

# 2. Turn the JUnit XML into one HTML table: one row per assertion.
[xml]$junit = Get-Content test-report\caraya-report.xml -ErrorAction SilentlyContinue
$cases  = @($junit.SelectNodes('//testcase'))
$failed = @($cases | Where-Object { $_.failure })
$rows = foreach ($case in $cases) {
    if ($case.failure) { $result = "<td class=fail>FAIL</td>" } else { $result = "<td class=pass>pass</td>" }
    "<tr>$result<td>$($case.classname)</td><td>$($case.name)</td><td>$($case.failure.message)</td></tr>"
}

@"
<html><head><meta charset="utf-8"><title>ATM unit tests</title><style>
  body { font-family: Segoe UI, sans-serif; margin: 2em }
  td, th { padding: 4px 12px; text-align: left; border-bottom: 1px solid #ddd }
  .pass { color: green } .fail { color: white; background: #c00 }
</style></head><body>
<h1>ATM unit tests: $($cases.Count - $failed.Count) of $($cases.Count) passed</h1>
<table><tr><th>Result</th><th>Test VI</th><th>Assertion</th><th>Failure</th></tr>
$($rows -join "`n")
</table></body></html>
"@ | Set-Content test-report\index.html -Encoding UTF8

Write-Host "$($cases.Count - $failed.Count) of $($cases.Count) tests passed - test-report\index.html"
if ($cases.Count -eq 0) { exit 1 }   # no report means the suite did not run
exit $exitCode
