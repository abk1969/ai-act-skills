# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] — 2026-05-07

### Added — SSL machine-readable manifest

- `skills/ai-act-compliance/ssl.json` — Scheduling-Structural-Logical
  representation per Liang, Wang, Liang & Liu (arXiv:2604.24026, 2026):
  - **Scheduling layer**: `skill_id`, `skill_goal`, `intent_signature`
    (14 sample queries), `tags` (19), `top_pattern: ROUTE_AND_ANCHOR`,
    `expected_inputs`, `expected_outputs`, `dependencies`,
    `control_flow_features`, `entry_scene_id`, `subscenes`.
  - **Structural layer**: 7 typed scenes (`PREPARE_SCOPE`,
    `ACQUIRE_FACTS`, `REASON_TIER`, `ACT_OBLIGATIONS`,
    `VERIFY_ARTIFACTS`, `RECOVER_INCIDENT`, `FINALIZE_REPORT`).
  - **Logical layer**: 28 atomic logic steps with closed `act_type` and
    `resource_scope` vocabularies.
- Pre-execution risk profile: `touches_sensitive_resources: false`,
  no `NETWORK`, no `CREDENTIALS`, no `CALL_TOOL`. All resource access
  is `LOCAL_FS` (reading reference files) or `MEMORY`.
- Validates against paper Pass-4 rules — 0 errors, 0 soft warnings.

### Added — Business-logic completion (4 new references)

- `references/11-art4-ai-literacy.md` — AI literacy programme guidance
  (art. 4 — in force since **2025-02-02**, tier-2 sanctions €15M / 3%).
  Closed v1.0.0 gap where this universal obligation was only
  cross-referenced.
- `references/12-art25-substantial-modification.md` — provider-flip
  detection (art. 25, art. 43(4), art. 3(23)), foundation-model
  fine-tuning case, contractual implications, re-conformity assessment.
- `references/13-sandboxes-and-real-world-testing.md` — regulatory
  sandboxes (art. 57–59, available 2026-08-02), real-world testing
  (art. 60–63 — informed consent per art. 61, 6+6-month duration cap),
  art. 59 personal-data derogation for substantial-public-interest cases.
- `references/14-codes-and-right-to-explanation.md` — GPAI Code of
  Practice (art. 56), voluntary codes of conduct (art. 95), right to
  explanation (art. 86) with GDPR art. 22 boundary analysis.

### Changed — SKILL.md restructured

- Workflow refactored into 7 named SSL scenes with explicit data
  contracts (input/output), entry/exit conditions, and `YIELD_FAIL`
  routes.
- New "Scheduling at a glance" section mirroring the SSL skill record.
- Description tightened per `superpowers:writing-skills` CSO rules
  (Description = When to Use, NOT What the Skill Does):
  - Old: opened with workflow summary `"Authoritative guide for EU AI
    Act... — risk classification, conformity assessment, technical
    documentation, FRIA, post-market monitoring..."`.
  - New: opens with `"Use when the user asks about EU AI Act..."`.
  - Frontmatter at 859 chars, well under the 1024-char limit.
- Decision tree updated to route to all 14 reference files.
- Anti-pattern #9 added: "Skipping art. 4 AI literacy".
- Anti-pattern #10 added: "Confusing art. 56 with art. 95".

### Changed — `package.json`

- Bumped to `1.1.0`.
- Added `manifest`, `manifest_schema`, `manifest_source` fields under
  `skill` to declare the SSL companion.
- New keywords: `art-4-ai-literacy`, `art-25-substantial-modification`,
  `art-56-gpai-code-of-practice`, `art-57-regulatory-sandbox`,
  `art-60-real-world-testing`, `art-86-right-to-explanation`,
  `art-95-voluntary-codes`, `ssl-manifest`,
  `scheduling-structural-logical`.

### Changed — Repository

- Root `README.md`: updated Contents tree; added SSL section.
- Skill `README.md`: SSL section + new tree + extended "When to use"
  list; v1.0.0/1.1.0 changelog; 1.1.0 stamped.
- `.gitignore`: ignore `.claude/`.
- Repository topics extended (18 GitHub topics).
- Repository homepage URL set to the latest release page.

### Stats

11 files changed, **+1,690 / −50 lines**.

## [1.0.0] — 2026-04-28

### Added — Initial release

- `skills/ai-act-compliance/SKILL.md` — entry point with risk taxonomy,
  decision tree, 5-step workflow, anti-patterns, output formatting
  conventions.
- 10 reference files:
  - `01-risk-classification.md` — 4-tier rubric + 14-signal
    questionnaire + Annex III + edge cases.
  - `02-high-risk-obligations.md` — provider + deployer obligations
    across arts. 8–29, 40–49 + 5-pillar deliverables map.
  - `03-iso-42001-aims.md` — clauses 4–10 + 38 Annex A controls + cert.
  - `04-iso-27090-ai-security.md` — threat taxonomy + mitigations +
    GenAI annex.
  - `05-crosswalk-aiact-iso.md` — master mapping table.
  - `06-techdoc-annex-iv.md` — Annex IV technical file template.
  - `07-fria-art27.md` — FRIA template + ISO 42005 alignment.
  - `08-transparency-art50.md` — disclosure UX + watermarking + C2PA.
  - `09-post-market-art72-73.md` — PMM plan + incident reporting
    playbook.
  - `10-gpai-and-timeline.md` — GPAI arts. 51–55 + sanctions art. 99
    + timeline art. 113.

[1.1.0]: https://github.com/abk1969/ai-act-skills/releases/tag/v1.1.0
[1.0.0]: https://github.com/abk1969/ai-act-skills/releases/tag/v1.0.0
