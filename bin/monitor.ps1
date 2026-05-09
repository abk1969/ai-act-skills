# monitor.ps1 — track stars/installs/PRs in real time
#
# Usage:
#   pwsh -File bin/monitor.ps1                 # Snapshot once
#   pwsh -File bin/monitor.ps1 -Loop           # Refresh every 5 min
#   pwsh -File bin/monitor.ps1 -Loop -Interval 60   # Every 60s
#
# Saves history to .launch-history.csv for retro analysis.

param(
    [switch]$Loop,
    [int]$Interval = 300,
    [string]$Repo = "abk1969/ai-act-skills"
)

$historyFile = "$PSScriptRoot/../.launch-history.csv"

function Get-Snapshot {
    $repoData = (gh repo view $Repo --json stargazerCount,forkCount,latestRelease --jq '{stars: .stargazerCount, forks: .forkCount, release: .latestRelease.tagName}') | ConvertFrom-Json

    # Open issues + PRs (low-cost signals)
    $issuesData = (gh repo view $Repo --json issues,pullRequests --jq '{open_issues: (.issues // 0), open_prs: (.pullRequests // 0)}' 2>&1) | ConvertFrom-Json -ErrorAction SilentlyContinue

    # Try to scrape skills.sh install count (best-effort)
    $installCount = "?"
    try {
        $skillsPage = Invoke-WebRequest -Uri "https://skills.sh/$Repo" -UseBasicParsing -ErrorAction Stop
        if ($skillsPage.Content -match '(\d+)\s*total\s*installs?') {
            $installCount = $Matches[1]
        }
    } catch {
        $installCount = "n/a"
    }

    # PR #14 status
    $pr14 = (gh pr view 14 --repo GenAI-Gurus/awesome-eu-ai-act --json state,mergedAt --jq '{state: .state, merged: (.mergedAt != null)}' 2>&1) | ConvertFrom-Json -ErrorAction SilentlyContinue

    return [PSCustomObject]@{
        timestamp = (Get-Date -Format "o")
        stars = $repoData.stars
        forks = $repoData.forks
        release = $repoData.release
        skillssh_installs = $installCount
        pr14_state = if ($pr14) { $pr14.state } else { "unknown" }
    }
}

function Show-Snapshot($snap) {
    Clear-Host
    Write-Host ""
    Write-Host "  ┌─────────────────────────────────────────────────┐" -ForegroundColor Cyan
    Write-Host "  │  ai-act-skills — launch monitor                  │" -ForegroundColor Cyan
    Write-Host "  └─────────────────────────────────────────────────┘" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Time:               $($snap.timestamp)"
    Write-Host "  Latest release:     $($snap.release)"
    Write-Host ""
    Write-Host "  ⭐ Stars:           $($snap.stars)" -ForegroundColor Yellow
    Write-Host "  🍴 Forks:           $($snap.forks)" -ForegroundColor Yellow
    Write-Host "  📦 skills.sh:       $($snap.skillssh_installs) installs" -ForegroundColor Yellow
    Write-Host "  📤 PR #14:          $($snap.pr14_state)" -ForegroundColor Yellow
    Write-Host ""

    # Threshold-based suggestions
    if ([int]$snap.stars -ge 10) {
        Write-Host "  ✓ TIER 1 unlocked: re-submit to VoltAgent/awesome-agent-skills" -ForegroundColor Green
    }
    if ([int]$snap.stars -ge 50) {
        Write-Host "  ✓ TIER 2 unlocked: pitch to AI newsletters (Ben's Bites, TLDR AI)" -ForegroundColor Green
    }
    if ([int]$snap.stars -ge 100) {
        Write-Host "  ✓ TIER 3 unlocked: outreach to Anthropic / Vercel DevRel" -ForegroundColor Green
    }
    if ([int]$snap.stars -ge 200) {
        Write-Host "  ✓ TIER 4 unlocked: publish v1.3.0 retrospective post" -ForegroundColor Green
    }

    Write-Host ""

    # Historical delta
    if (Test-Path $historyFile) {
        $history = Import-Csv $historyFile
        if ($history.Count -gt 1) {
            $first = $history[0]
            $delta = [int]$snap.stars - [int]$first.stars
            $hours = [math]::Round(((Get-Date $snap.timestamp) - (Get-Date $first.timestamp)).TotalHours, 1)
            Write-Host "  Δ since baseline:   +$delta stars in $hours hours"
            Write-Host ""
        }
    }
}

function Save-History($snap) {
    $line = [PSCustomObject]@{
        timestamp = $snap.timestamp
        stars = $snap.stars
        forks = $snap.forks
        installs = $snap.skillssh_installs
        pr14 = $snap.pr14_state
    }
    if (-not (Test-Path $historyFile)) {
        $line | Export-Csv $historyFile -NoTypeInformation
    } else {
        $line | Export-Csv $historyFile -NoTypeInformation -Append
    }
}

# ============================================================
# RUN
# ============================================================
do {
    $snap = Get-Snapshot
    Show-Snapshot $snap
    Save-History $snap

    if ($Loop) {
        Write-Host "  Next refresh in ${Interval}s. Ctrl+C to exit." -ForegroundColor DarkGray
        Start-Sleep -Seconds $Interval
    }
} while ($Loop)
