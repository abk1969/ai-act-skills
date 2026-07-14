# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] — 2026-07-14

### Changed — Regulatory content: the 2026 AI Omnibus amendment

The AI Act was amended by the **Digital Omnibus on AI** ("AI Omnibus"):
political agreement 2026-05-07, European Parliament endorsement
2026-06-16, Council final approval 2026-06-29. OJ publication was
pending as of this release (expected July 2026; entry into force on the
third day after publication) — every affected file carries a
"verify the OJEU" caveat. Major bump per the versioning legend
(AI Act amendment).

Encoded changes:

- **High-risk deadlines deferred (fixed dates)** — stand-alone
  Annex III systems: 2026-08-02 → **2027-12-02**; Annex I embedded
  systems: 2027-08-02 → **2028-08-02**. Updated in `SKILL.md`,
  `references/01`, `02`, `10`, `11`, `15`, root `README.md`, `llms.txt`.
- **New art. 5 prohibition** — AI generating/manipulating
  non-consensual intimate imagery (NCII) or CSAM, including where such
  generation is "a reasonably foreseeable and reproducible outcome,
  without requiring significant technical modification". Applicable
  **2026-12-02**. Ninth prohibited-practice row added to `SKILL.md`
  and `references/01`.
- **Art. 50 grace period** — generative systems on market before
  2026-08-02 get until **2026-12-02** for the art. 50(2)
  machine-readable marking; all other art. 50 obligations unchanged
  at 2026-08-02 (`references/08`, `01`).
- **Sandboxes deferred** — Member State sandbox deadline moved to
  **2027-08-02**; EU-level sandbox access expanded (`references/13`).
- **Machinery carve-out** — AI embedded in Machinery Regulation
  products largely excluded from the dedicated high-risk regime;
  "safety component" definition narrowed (`references/01`).
- **Art. 4 wording softened** — providers and deployers "shall take
  measures to **support the development** of AI literacy" (obligation
  of means; no guaranteed level), replacing "ensure … a sufficient
  level"; duty-bearers, scope, and the 2025-02-02 date unchanged.
  Verbatim adopted-text analysis (`references/11` §1.1, EP doc.
  P10_TA(2026)0198) contributed by
  [@luisnunoperdigao-dotcom](https://github.com/luisnunoperdigao-dotcom)
  in [#5](https://github.com/abk1969/ai-act-skills/pull/5) — thank you.
  Also reflected in the art. 4 row of `SKILL.md`.
- **AI Office powers expanded** — exclusive competence over GPAI-based
  systems from the same undertaking; VLOP/VLOSE systems; enhanced
  enforcement (`references/10` context).
- New anti-pattern #11 in `SKILL.md`: "Misreading the AI Omnibus as a
  general pause" — art. 5, art. 4, GPAI, and art. 50 stay on their
  original dates.

### Changed — GPAI Code of Practice operative status (roadmap v2.1.0 trigger met)

- Code published **2025-07-10** in three chapters (Transparency,
  Copyright, Safety & Security); **adequacy confirmed** by Commission +
  AI Board **2025-08-01**; Commission enforcement (art. 101 fines) from
  **2026-08-02**. Encoded in `references/14` (new chapter table),
  `references/10` § 1.6, `references/05`, `SKILL.md`.
- Companion instruments recorded: Commission GPAI guidelines
  (2025-07-18), training-data-summary template (2025-07-24).

### Changed — Standards & guidance status

- `references/05` § 7 presumption ladder: still **no OJEU citation**;
  CEN-CENELEC October 2025 acceleration; key JTC 21 deliverables
  prEN 18228 (art. 9 risk management) and prEN 18284 (art. 10 data
  quality/governance) targeted Q4 2026. Same status in `SKILL.md`
  anti-pattern #2.
- Draft Commission guidance recorded: art. 6 high-risk classification
  guidelines (2026-05-19, `references/01`, `10`); art. 73
  serious-incident guidance + reporting template (2025-09-26,
  `references/09`, `10`).

### Changed — Packaging

- `package.json`, `SKILL.md` frontmatter, `AGENTS.md`/`GEMINI.md`
  (root + skill), `references/15`, skill `README.md`: version 2.0.0;
  new keywords `ai-omnibus`, `digital-omnibus`.
- `ssl.json`: new tag `ai-omnibus`; new intent signature "Did the AI
  Omnibus change my compliance deadline?".
- `ROADMAP.md`: v2.1.0 GPAI-CoP milestone delivered by this release;
  harmonised-standards major milestone renumbered to v3.0.0.
- `CITATION.cff`: version 2.0.0, date-released 2026-07-14.

## [1.2.0] — 2026-05-08

### Added — Multi-platform compatibility (Claude Code, Gemini CLI, OpenAI Codex)

- **Root discovery files**:
  - `AGENTS.md` — Codex / OpenAI / AGENTS-aware harness pointer
    declaring `ai-act-compliance` with skill metadata, recommended
    install path (`~/.agents/skills/`), activation contract, and
    tool-name mapping policy (none required — skill issues no tool
    calls).
  - `GEMINI.md` — Gemini CLI session-start activation pointer with
    `activate_skill` contract, intent signatures, and per-platform
    install steps.
- **Skill-level mirrors** at `skills/ai-act-compliance/`:
  - `AGENTS.md` (skill-level) — pointer for runtimes that load skills
    from a per-skill directory rather than a project root.
  - `GEMINI.md` (skill-level) — same, for Gemini CLI deployments where
    skills live under `~/.gemini/skills/`.
- `skills/ai-act-compliance/references/15-platform-compatibility.md` —
  canonical reference: support matrix (Claude Code / Gemini CLI /
  Codex first-class; Copilot CLI / Cursor community), per-platform
  install steps (macOS / Linux / Windows), activation triggers shared
  across all hosts, runtime-agnostic output template, smoke-test
  procedure, open issues. **15th reference file** in the skill.

### Changed — `package.json`

- Bumped to `1.2.0`.
- `skill.type`: `claude-skill` → `agent-skill` (multi-platform).
- New `skill.platforms` field: `["claude-code", "gemini-cli", "codex"]`.
- New `skill.platform_files` map: which file each runtime reads first.
- New `skill.install_paths` map: per-platform default install location.
- New explicit declarations: `tool_calls: false`,
  `touches_sensitive_resources: false`, `permission: filesystem.read`.
- New keywords: `claude-code`, `gemini-cli`, `openai-codex`,
  `multi-platform`, `agent-skill`.

### Changed — `SKILL.md`

- Decision tree extended with the 15th routing target
  (`references/15-platform-compatibility.md`) for runtime / install
  questions.
- New top-level **"Platform compatibility"** section with the support
  matrix and the rationale for trivial portability (no tool calls,
  no sensitive resources).
- Frontmatter unchanged — no breaking change for existing Claude Code
  installs.

### Changed — Skill `README.md`

- Header updated: "multi-platform agent skill" + 3 platform badges
  (Claude Code, Gemini CLI, Codex).
- Installation section split into Claude Code / Gemini CLI / Codex
  sub-sections with macOS/Linux + Windows commands.
- File tree updated to include `15-platform-compatibility.md`,
  `AGENTS.md`, `GEMINI.md`.
- Changelog updated with v1.2.0 entry.

### Changed — Root `README.md`

- Header updated: "Multi-platform agent skills" + 3 platform badges.
- Install section restructured into Claude Code / Gemini CLI / Codex
  sub-sections + compatibility matrix table.
- File tree updated with new top-level discovery files (`AGENTS.md`,
  `GEMINI.md`) and skill-level additions.
- Versioning section updated to 1.2.0.

### Rationale

The skill is **decision-support / reference-grade** with
`control_flow_features.tool_calls: false` in `ssl.json` — no
host-specific tools are invoked. Portability across runtimes is
therefore essentially a discovery and packaging change: each runtime
gets a small pointer file (`SKILL.md` for Claude Code, `GEMINI.md` for
Gemini CLI, `AGENTS.md` for Codex / AGENTS-aware harnesses) that
identifies the entry, while the regulatory content (citation-grade
articles + clauses + Annex A controls) is identical across all hosts.

**No regulatory content changed in this release.** Provider, deployer,
GPAI, FRIA, AI literacy, and incident-reporting guidance is
byte-identical to v1.1.0.

### Stats

7 files added, 4 files updated.

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

[2.0.0]: https://github.com/abk1969/ai-act-skills/releases/tag/v2.0.0
[1.2.0]: https://github.com/abk1969/ai-act-skills/releases/tag/v1.2.0
[1.1.0]: https://github.com/abk1969/ai-act-skills/releases/tag/v1.1.0
[1.0.0]: https://github.com/abk1969/ai-act-skills/releases/tag/v1.0.0
