# bin/

Operational scripts for launch-day automation and post-launch monitoring.

## Scripts

| Script | Purpose |
|---|---|
| [`launch-day.ps1`](./launch-day.ps1) | Semi-automated launch day driver — pre-flight checks, copies post text to clipboard, opens compose URLs at the right time, takes a baseline metrics snapshot. |
| [`monitor.ps1`](./monitor.ps1) | Real-time stars / forks / skills.sh installs / PR #14 status tracker. Supports loop mode for live dashboards. Saves history to `.launch-history.csv`. |
| [`awesome-resubmit.ps1`](./awesome-resubmit.ps1) | Gating-aware automation for VoltAgent/awesome-agent-skills re-submission. Checks if we hit their community-usage threshold (stars >= 10, installs >= 50) and auto-opens the PR when eligible. |

## Why PowerShell

This project is developed on Windows. PowerShell 7+ scripts run cross-platform (Linux + macOS via `pwsh`), so contributors on any OS can use these scripts.

```bash
# Linux / macOS (after installing PowerShell)
pwsh ./bin/launch-day.ps1

# Windows
pwsh -File bin/launch-day.ps1
```

## Usage on launch day

```powershell
# Step 1 — pre-flight (run morning of, ~8am Paris)
pwsh -File bin/launch-day.ps1 -Mode preflight

# Step 2 — full launch (run when ready, ~8:30am)
pwsh -File bin/launch-day.ps1

# Step 3 — start monitor in a separate window
pwsh -File bin/monitor.ps1 -Loop -Interval 300
```

## Usage post-launch

```powershell
# Daily check (no auto-submit)
pwsh -File bin/awesome-resubmit.ps1

# When eligible, auto-submit
pwsh -File bin/awesome-resubmit.ps1 -Submit
```

## Truly UI-bound actions (no script can automate these)

GitHub does not expose API surfaces for:

1. **Pinning a Discussion** — `pinDiscussion` mutation does not exist (`pinIssue` does, but Discussions are a separate type). No `pinned` field on `UpdateDiscussionInput` either.
2. **Uploading a custom OpenGraph image** — Settings → Social preview → Upload is UI-only.
3. **Publishing to LinkedIn / Dev.to / Hacker News** — auth-bound to your accounts.

The launch-day script handles these by opening the right URL and copying pre-formatted text to the clipboard, but the user must complete the UI step.

## What gets stored locally

- `.launch-baseline.json` — snapshot of stars/forks/release at launch start
- `.launch-history.csv` — time-series of metrics for retro analysis

These are gitignored.
