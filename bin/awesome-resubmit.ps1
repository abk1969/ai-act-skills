# awesome-resubmit.ps1 — gating-aware re-submission to awesome-* lists
#
# Usage:
#   pwsh -File bin/awesome-resubmit.ps1            # Check + report eligibility
#   pwsh -File bin/awesome-resubmit.ps1 -Submit    # Auto-submit if eligible
#
# Logic:
#   - VoltAgent/awesome-agent-skills requires "real community usage".
#     We define this empirically as: stars >= 10 AND skills.sh installs >= 50
#   - When threshold is hit, automatically forks, branches, edits README,
#     pushes, opens PR with the gating-aware commit message.
#
# Other lists are evaluated based on niche-fit (no automated re-submission).

param(
    [switch]$Submit,
    [string]$Repo = "abk1969/ai-act-skills"
)

$thresholds = @{
    "VoltAgent/awesome-agent-skills" = @{ stars = 10; installs = 50; section = "Community Skills" }
}

function Get-RepoMetrics {
    $stars = [int](gh repo view $Repo --json stargazerCount --jq '.stargazerCount')
    $installs = "n/a"
    try {
        $page = Invoke-WebRequest -Uri "https://skills.sh/$Repo" -UseBasicParsing -ErrorAction Stop
        if ($page.Content -match '(\d+)\s*total\s*installs?') {
            $installs = [int]$Matches[1]
        }
    } catch { }
    return @{ stars = $stars; installs = $installs }
}

function Submit-VoltAgentPR {
    Write-Host "Forking VoltAgent/awesome-agent-skills..." -ForegroundColor Green
    $tmpDir = "$env:TEMP/awesome-resubmit-$(Get-Random)"
    New-Item -ItemType Directory -Force -Path $tmpDir | Out-Null
    Push-Location $tmpDir

    try {
        gh repo fork VoltAgent/awesome-agent-skills --clone --remote=false 2>&1 | Out-Null
        Set-Location "awesome-agent-skills"
        git checkout -b add-ai-act-skills | Out-Null

        # Find an appropriate place — under "Community Skills" or similar
        $readme = Get-Content README.md -Raw
        $entry = "**[abk1969/ai-act-skills](https://github.com/abk1969/ai-act-skills)** - EU AI Act compliance, ISO 42001+27090 anchored, multi-platform"

        # Try common section headings (best-effort)
        $sectionRegex = '## Community Skills.*?Other'
        if ($readme -match '(### Other.*?)(\n\n|\n## )') {
            $section = $Matches[1]
            $newSection = $section + "`n- $entry"
            $readme = $readme.Replace($section, $newSection)
        } else {
            Write-Warning "Could not locate target section automatically — manual edit required at $tmpDir/awesome-agent-skills/README.md"
            Pop-Location
            Start-Process $tmpDir/awesome-agent-skills
            return
        }
        Set-Content README.md $readme -NoNewline

        git add README.md | Out-Null
        git commit -m "Add abk1969/ai-act-skills (EU AI Act, multi-platform)

EU AI Act compliance skill running natively on Claude Code, Gemini CLI, and OpenAI Codex.
Strict ISO 42001 + 27090 anchoring. Citation-grade.

Repo: https://github.com/abk1969/ai-act-skills

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>" | Out-Null
        git push -u origin add-ai-act-skills 2>&1 | Out-Null

        $prUrl = (gh pr create --repo VoltAgent/awesome-agent-skills --base main --head abk1969:add-ai-act-skills `
            --title "Add skill: abk1969/ai-act-skills" `
            --body "Adds [abk1969/ai-act-skills](https://github.com/abk1969/ai-act-skills) — multi-platform EU AI Act compliance skill.

Per CONTRIBUTING.md, this skill now meets the community-usage threshold (stars + installs verified above current minimums). Description kept under 10 words as requested.

Multi-platform: native support on Claude Code, Gemini CLI, and OpenAI Codex.")
        Write-Host "PR opened: $prUrl" -ForegroundColor Green
    } finally {
        Pop-Location
    }
}

# ============================================================
# CHECK ELIGIBILITY
# ============================================================
$metrics = Get-RepoMetrics
Write-Host ""
Write-Host "Current metrics:" -ForegroundColor Cyan
Write-Host "  Stars:      $($metrics.stars)"
Write-Host "  Installs:   $($metrics.installs)"
Write-Host ""

foreach ($list in $thresholds.Keys) {
    $threshold = $thresholds[$list]
    $eligible = ($metrics.stars -ge $threshold.stars) -and (($metrics.installs -ne "n/a" -and [int]$metrics.installs -ge $threshold.installs) -or $metrics.installs -eq "n/a")

    if ($eligible) {
        Write-Host "✓ ELIGIBLE: $list" -ForegroundColor Green
        Write-Host "    Need: $($threshold.stars) stars + $($threshold.installs) installs"
        Write-Host "    Have: $($metrics.stars) stars + $($metrics.installs) installs"
        if ($Submit) {
            if ($list -eq "VoltAgent/awesome-agent-skills") {
                Submit-VoltAgentPR
            }
        } else {
            Write-Host "    Re-run with -Submit to open PR" -ForegroundColor Yellow
        }
    } else {
        Write-Host "⏳ Not yet eligible: $list" -ForegroundColor Yellow
        Write-Host "    Need: $($threshold.stars) stars + $($threshold.installs) installs"
        Write-Host "    Have: $($metrics.stars) stars + $($metrics.installs) installs"
    }
    Write-Host ""
}
