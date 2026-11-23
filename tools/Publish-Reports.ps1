# Publish-Reports.ps1 - put test-report\ and diff-report\ on GitHub Pages (gh-pages branch),
# so the PR comment links to web pages instead of zip downloads.
#
#   .\tools\Publish-Reports.ps1 -Folder ci/pr-39
#
# -> https://jangoebel.github.io/CLD11/ci/pr-39/diff-report/index.html
#
# Used by CI only (.github/workflows/pull-request.yml).

param([Parameter(Mandatory)][string]$Folder)

$pages = Join-Path $env:TEMP ("gh-pages-" + (Get-Random))

foreach ($try in 1..5) {   # retry: the dashboard workflows push to gh-pages at the same time
    git fetch -q origin gh-pages
    git worktree add -q --detach $pages FETCH_HEAD

    # Replace this PR's folder with the fresh reports.
    Remove-Item "$pages\$Folder" -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -ItemType Directory "$pages\$Folder" -Force | Out-Null
    foreach ($report in "test-report", "diff-report") {
        if (Test-Path $report) { Copy-Item $report "$pages\$Folder" -Recurse }
    }

    git -C $pages add -A
    git -C $pages -c user.name="github-actions[bot]" -c user.email="github-actions[bot]@users.noreply.github.com" `
        commit -q -m "CI reports: $Folder"
    git -C $pages push -q origin HEAD:gh-pages
    $pushed = $LASTEXITCODE -eq 0

    git worktree remove --force $pages
    if ($pushed) { Write-Host "Published to gh-pages: $Folder"; exit 0 }
    Start-Sleep 10
}

Write-Host "Could not push to gh-pages"
exit 1
