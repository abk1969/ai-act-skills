# launch-day.ps1 — semi-automated launch day driver
#
# Usage (Windows PowerShell):
#   pwsh -File bin/launch-day.ps1
#
# What it does:
#   1. Pre-flight verification (LICENSE detected, OG uploaded, PR #14 status)
#   2. Copies post text to clipboard at the right time
#   3. Opens the right URLs in the browser
#   4. Tracks stars/installs through the day
#   5. Drafts the J+7 follow-up post template
#
# What it does NOT do (genuinely impossible without user auth):
#   - Publish the LinkedIn / Dev.to / HN posts (auth-bound)
#   - Pin Discussion #2 (GitHub UI-only)
#   - Upload OG image (GitHub UI-only)

param(
    [string]$Mode = "interactive"
)

$ErrorActionPreference = "Stop"
$repo = "abk1969/ai-act-skills"
$repoUrl = "https://github.com/$repo"
$launchDir = "$PSScriptRoot/../docs/launch"

function Write-Header($text) {
    Write-Host ""
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host " $text" -ForegroundColor Cyan
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Step($text) {
    Write-Host "→ $text" -ForegroundColor Green
}

function Write-Warn($text) {
    Write-Host "⚠ $text" -ForegroundColor Yellow
}

function Write-OK($text) {
    Write-Host "✓ $text" -ForegroundColor Green
}

function Write-Fail($text) {
    Write-Host "✗ $text" -ForegroundColor Red
}

function Wait-Confirm($text) {
    Write-Host ""
    $resp = Read-Host "$text (press ENTER to continue, 'skip' to skip, 'quit' to exit)"
    if ($resp -eq "quit") { exit 0 }
    return ($resp -ne "skip")
}

# =================================================================
# PRE-FLIGHT
# =================================================================
Write-Header "PRE-FLIGHT — verify repo state"

Write-Step "Checking gh CLI authentication..."
$ghAuth = gh auth status 2>&1 | Out-String
if ($ghAuth -match "Logged in") {
    Write-OK "gh CLI authenticated"
} else {
    Write-Fail "gh CLI not authenticated. Run: gh auth login"
    exit 1
}

Write-Step "Checking license detection (must be 'mit')..."
$license = (gh repo view $repo --json licenseInfo --jq '.licenseInfo.key') 2>&1
if ($license -eq "mit") {
    Write-OK "License correctly detected as MIT"
} else {
    Write-Fail "License is '$license' — should be 'mit'. Check LICENSE file."
}

Write-Step "Checking latest release..."
$release = (gh repo view $repo --json latestRelease --jq '.latestRelease.tagName') 2>&1
Write-OK "Latest release: $release"

Write-Step "Checking topics count..."
$topicsCount = (gh repo view $repo --json repositoryTopics --jq '.repositoryTopics | length') 2>&1
if ([int]$topicsCount -ge 18) {
    Write-OK "Topics: $topicsCount/20"
} else {
    Write-Warn "Only $topicsCount topics — consider adding more"
}

Write-Step "Checking Discussions enabled..."
$disc = (gh repo view $repo --json hasDiscussionsEnabled --jq '.hasDiscussionsEnabled') 2>&1
if ($disc -eq "true") {
    Write-OK "Discussions enabled"
} else {
    Write-Fail "Discussions not enabled — enabling now..."
    gh api -X POST "repos/$repo" --field has_discussions=true | Out-Null
}

Write-Step "Checking OG image upload (heuristic)..."
$ogCheck = (gh repo view $repo --json usesCustomOpenGraphImage --jq '.usesCustomOpenGraphImage') 2>&1
if ($ogCheck -eq "true") {
    Write-OK "Custom OG image uploaded"
} else {
    Write-Warn "Custom OG image NOT uploaded yet"
    Write-Host "  → Manual action: $repoUrl/settings → Social preview → Upload assets/og-card.png"
    if (Wait-Confirm "Open Settings page now to upload?") {
        Start-Process "$repoUrl/settings"
    }
}

Write-Step "Checking Discussion #2 pin status..."
Write-Warn "Pin status not exposed via GitHub API — requires manual UI check"
Write-Host "  → Manual action: open $repoUrl/discussions/2 → … menu → Pin (if not already)"
if (Wait-Confirm "Open Discussion #2 now to verify it's pinned?") {
    Start-Process "$repoUrl/discussions/2"
}

Write-Step "Checking PR #14 (GenAI-Gurus/awesome-eu-ai-act)..."
$prState = (gh pr view 14 --repo GenAI-Gurus/awesome-eu-ai-act --json state --jq '.state') 2>&1
Write-OK "PR #14 state: $prState"

# =================================================================
# CURRENT METRICS BASELINE
# =================================================================
Write-Header "BASELINE METRICS (snapshot before launch)"

$stars = (gh repo view $repo --json stargazerCount --jq '.stargazerCount') 2>&1
$forks = (gh repo view $repo --json forkCount --jq '.forkCount') 2>&1
Write-Host "Stars at launch start:  $stars"
Write-Host "Forks at launch start:  $forks"

$baselineFile = "$PSScriptRoot/../.launch-baseline.json"
@{
    stars = [int]$stars
    forks = [int]$forks
    timestamp = (Get-Date -Format "o")
    release = $release
} | ConvertTo-Json | Out-File $baselineFile -Encoding utf8
Write-OK "Baseline saved to .launch-baseline.json"

if ($Mode -eq "preflight") {
    Write-Header "PRE-FLIGHT COMPLETE"
    Write-Host "Re-run with: pwsh -File bin/launch-day.ps1"
    exit 0
}

# =================================================================
# LAUNCH SEQUENCE
# =================================================================
Write-Header "LAUNCH SEQUENCE"

Write-Host @"
Recommended publication windows (Paris time, Tuesday 2026-05-12):
  08:30  LinkedIn FR
  09:00  Dev.to / Hashnode / Medium
  14:00  LinkedIn EN + Show HN

This script will guide you through each step. It copies the prepared
text to your clipboard and opens the right URL — you publish manually
(genuinely required: only you can authenticate to your accounts).
"@

# ---- LinkedIn FR
Write-Header "STEP 1 — LinkedIn (French version)"
if (Wait-Confirm "Ready to publish LinkedIn FR?") {
    $text = Get-Content "$launchDir/linkedin-fr.md" -Raw
    # Extract only the post text (between the ``` blocks after "## Texte du post")
    if ($text -match '## Texte du post\s*```\s*(.*?)```') {
        $postText = $Matches[1].Trim()
    } else {
        $postText = $text
    }
    $postText | Set-Clipboard
    Write-OK "LinkedIn FR text copied to clipboard ($($postText.Length) chars)"
    Write-Step "Opening LinkedIn compose..."
    Start-Process "https://www.linkedin.com/feed/?shareActive=true"
    Wait-Confirm "Pasted, formatted, hashtags added, scheduled/posted? Continue when done."

    Write-Host ""
    Write-Step "First-comment text (paste as the FIRST comment within 5 min):"
    $firstComment = "Pour les techniques, le crosswalk complet article -> ISO 42001 cl. + Annex A est dans references/05-crosswalk-aiact-iso.md : $repoUrl/blob/main/skills/ai-act-compliance/references/05-crosswalk-aiact-iso.md"
    $firstComment | Set-Clipboard
    Write-OK "First-comment text copied to clipboard"
    Wait-Confirm "First comment posted? Continue when done."
}

# ---- Dev.to
Write-Header "STEP 2 — Dev.to article"
if (Wait-Confirm "Ready to publish Dev.to article?") {
    $devto = Get-Content "$launchDir/devto-article.md" -Raw
    $devto | Set-Clipboard
    Write-OK "Dev.to article copied to clipboard ($($devto.Length) chars)"
    Write-Host "  Note: the article has YAML frontmatter — Dev.to will parse it."
    Write-Step "Opening Dev.to new-article..."
    Start-Process "https://dev.to/new"
    Wait-Confirm "Article published on Dev.to? Continue when done."

    Write-Host ""
    Write-Step "Cross-post the same content to Hashnode? (recommended)"
    if (Wait-Confirm "Open Hashnode?") {
        Start-Process "https://hashnode.com/draft"
    }

    Write-Host ""
    Write-Step "Cross-post to Medium? (optional, lower SEO value)"
    if (Wait-Confirm "Open Medium?") {
        Start-Process "https://medium.com/new-story"
    }
}

# ---- LinkedIn EN
Write-Header "STEP 3 — LinkedIn (English version)"
Write-Host "Recommended timing: 14:00 Paris (= 8am NY, 1pm London)"
if (Wait-Confirm "Ready to publish LinkedIn EN?") {
    $textEn = Get-Content "$launchDir/linkedin-en.md" -Raw
    if ($textEn -match '## Post text\s*```\s*(.*?)```') {
        $postTextEn = $Matches[1].Trim()
    } else {
        $postTextEn = $textEn
    }
    $postTextEn | Set-Clipboard
    Write-OK "LinkedIn EN text copied to clipboard ($($postTextEn.Length) chars)"
    Start-Process "https://www.linkedin.com/feed/?shareActive=true"
    Wait-Confirm "Posted? Continue when done."

    Write-Host ""
    Write-Step "First-comment text (English):"
    $firstCommentEn = "For the technical folks: full crosswalk article -> ISO 42001 cl. + Annex A in references/05-crosswalk-aiact-iso.md: $repoUrl/blob/main/skills/ai-act-compliance/references/05-crosswalk-aiact-iso.md"
    $firstCommentEn | Set-Clipboard
    Write-OK "First-comment text copied to clipboard"
    Wait-Confirm "First comment posted? Continue when done."
}

# ---- Show HN
Write-Header "STEP 4 — Show HN"
Write-Host "Best window: Tuesday 8-9am ET (= 14-15h Paris)"
if (Wait-Confirm "Ready to submit Show HN?") {
    $hnTitle = "Show HN: Multi-platform agent skill for EU AI Act compliance (Claude/Gemini/Codex)"
    $hnTitle | Set-Clipboard
    Write-OK "HN title copied to clipboard"
    Write-Host "  Title: $hnTitle"
    Write-Host "  URL:   $repoUrl"
    Write-Step "Opening HN submit form..."
    Start-Process "https://news.ycombinator.com/submit"
    Wait-Confirm "Submitted? Continue when done."

    Write-Host ""
    Write-Step "Show HN body text:"
    $hnBody = Get-Content "$launchDir/show-hn.md" -Raw
    if ($hnBody -match '## Body[^`]*```\s*(.*?)```') {
        $bodyText = $Matches[1].Trim()
    } else {
        $bodyText = $hnBody
    }
    $bodyText | Set-Clipboard
    Write-OK "Show HN body copied to clipboard ($($bodyText.Length) chars)"
    Wait-Confirm "Body pasted into HN's text field? Continue when done."
}

# =================================================================
# POST-LAUNCH MONITORING
# =================================================================
Write-Header "POST-LAUNCH — first hour metrics check"

Start-Sleep -Seconds 5
$starsNow = (gh repo view $repo --json stargazerCount --jq '.stargazerCount') 2>&1
$starsBefore = (Get-Content $baselineFile -Raw | ConvertFrom-Json).stars
$delta = [int]$starsNow - [int]$starsBefore
Write-Host "Stars: $starsBefore -> $starsNow ($('{0:+#;-#;0}' -f $delta))"

Write-Host ""
Write-Header "LAUNCH DAY KICKED OFF"

Write-Host @"

Next steps for the rest of the day:

  • Check repo + Discussions every ~30 min for the first 4 hours
  • Reply to all comments / questions
  • If Show HN climbs front page: prepare for ~5-10x traffic spike
  • Track skills.sh leaderboard rank: https://skills.sh

J+7 follow-up post:
  • Opening: 'Day 7 — here are the numbers and what I learned'
  • Stats to include: stars (target 50+), installs (target 100+),
    HN front-page rank (if applicable), top awesome-* mentions
  • Closing CTA: ask community what AI Act topic to cover next

J+30 retro:
  • Discussion in repo with the launch metrics + retrospective
  • Submit to VoltAgent/awesome-agent-skills if stars > 10
  • Plan v1.3.0 (community-discoverability milestone in ROADMAP.md)

"@ -ForegroundColor Cyan
