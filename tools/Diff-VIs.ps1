# Diff-VIs.ps1 - graphical LabVIEW diff of every VI/CTL changed since a base branch.
#
#   .\tools\Diff-VIs.ps1 -Base origin/main
#
# Output (in diff-report\):
#   index.html        list of changed files, each linking to LabVIEW's own HTML diff report
#   differences.txt   the same differences as plain text - input for the AI summary
#
# Used locally before opening a PR and again by CI (.github/workflows/pull-request.yml).

param(
    [string]$Base = "origin/main",
    [string]$Out  = "diff-report"
)

# 32-bit LabVIEW 2026 - used only for diffs, so it never collides with the LabVIEW we develop in.
$LabVIEW = "C:\Program Files (x86)\National Instruments\LabVIEW 2026\LabVIEW.exe"
$Port    = 3363

$repo = (git rev-parse --show-toplevel) -replace '/', '\'
Set-Location $repo
Remove-Item $Out -Recurse -Force -ErrorAction SilentlyContinue
$Out = (New-Item -ItemType Directory $Out).FullName

# 1. Check out the old version in a temp folder, so old VIs still find their subVIs.
$old = Join-Path $env:TEMP ("vi-diff-" + (Get-Random))
git worktree add --detach $old (git merge-base $Base HEAD) | Out-Null

# 2. Compare each changed VI/CTL with LabVIEW's comparison tool.
$links = @()
$text  = @("Changed files (git diff --stat $Base...HEAD):", (git diff --stat "$Base...HEAD"), "")

foreach ($line in (git diff --name-status --no-renames "$Base...HEAD" -- '*.vi' '*.ctl')) {
    $status, $file = $line -split "`t"
    $new  = Join-Path $repo $file
    $name = [IO.Path]::GetFileNameWithoutExtension($file) -replace '[^\w]+', '-'

    if ($status -eq 'D') { $text += "$file : DELETED"; continue }

    # An added file has no old version: compare it with itself to get its pictures.
    $before = if ($status -eq 'A') { $new } else { Join-Path $old $file }

    Write-Host "Comparing $file ..."
    foreach ($try in 1..2) {   # 2nd try: the 1st one times out if LabVIEW was still starting
        LabVIEWCLI -OperationName CreateComparisonReport -VI1 $before -VI2 $new `
            -ReportType html -ReportPath "$Out\$name.html" -o -c -nobdcosm -nofppos `
            -LabVIEWPath $LabVIEW -PortNumber $Port | Out-Null
        if (Test-Path "$Out\$name.html") { break }
    }

    $links += "<li><b>$status</b> <a href='$name.html'>$file</a></li>"
    $text  += "== $file ($(@{A='added'; M='modified'}[$status]))"

    # Pull the difference headings and details out of LabVIEW's report.
    $html = Get-Content "$Out\$name.html" -Raw -ErrorAction SilentlyContinue
    if (-not $html) { $text += "   !! comparison failed"; continue }
    foreach ($m in [regex]::Matches($html, '(?s)class="difference-heading">(.*?)<|class="diff-detail">(.*?)</li>')) {
        $heading, $detail = $m.Groups[1].Value, $m.Groups[2].Value
        if ($heading) { $text += "   - " + [Net.WebUtility]::HtmlDecode($heading.Trim()) }
        elseif ($detail.Trim()) { $text += "       " + [Net.WebUtility]::HtmlDecode(($detail -replace '<[^>]+>', '').Trim()) }
    }
}

# 3. Write the overview files and clean up.
"<h1>LabVIEW diff: $Base...HEAD</h1><ul>$($links -join '')</ul>" | Set-Content "$Out\index.html" -Encoding UTF8
$text | Set-Content "$Out\differences.txt" -Encoding UTF8
git worktree remove --force $old

Write-Host "Done: $Out\index.html"
