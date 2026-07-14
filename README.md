# ai-act-skills

**The first multi-platform agent skill for EU AI Act compliance —
runs natively on Claude Code, Gemini CLI, and OpenAI Codex with
strict ISO/IEC 42001:2023 (AIMS) + 27090 (FDIS, AI cybersecurity)
anchoring. Citation-grade. Decision-support, not legal advice.**

> Codifies EU AI Act (Regulation 2024/1689) compliance work —
> risk classification (art. 5/6/50), conformity assessment (arts. 8–17,
> 26–27), Annex IV technical documentation, FRIA (art. 27), AI literacy
> (art. 4), substantial modification (art. 25), regulatory sandboxes
> (arts. 57–63), GPAI (arts. 51–55), serious-incident reporting
> (art. 73). Every obligation cites article + clause + Annex A control
> (e.g., `art. 9(2)(a)`, `cl. 6.1.4`, `A.5.4`). 15 reference files,
> machine-readable SSL manifest per
> [arXiv:2604.24026](https://arxiv.org/abs/2604.24026).

[![Latest release](https://img.shields.io/github/v/release/abk1969/ai-act-skills?display_name=tag&sort=semver&color=2ea043)](https://github.com/abk1969/ai-act-skills/releases/latest)
[![EU AI Act](https://img.shields.io/badge/EU_AI_Act-2024%2F1689-1f4e79)](https://eur-lex.europa.eu/eli/reg/2024/1689/oj)
[![ISO 42001](https://img.shields.io/badge/ISO%2FIEC-42001%3A2023-0066b3)](https://www.iso.org/standard/81230.html)
[![ISO 27090](https://img.shields.io/badge/ISO%2FIEC-27090%3A2025-0066b3)](https://www.iso.org/standard/56581.html)
[![SSL representation](https://img.shields.io/badge/SSL-arXiv%3A2604.24026-b31b1b)](https://arxiv.org/abs/2604.24026)
[![Claude Code](https://img.shields.io/badge/Claude_Code-supported-7c3aed)](https://claude.com/claude-code)
[![Gemini CLI](https://img.shields.io/badge/Gemini_CLI-supported-1a73e8)](https://github.com/google-gemini/gemini-cli)
[![Codex](https://img.shields.io/badge/OpenAI_Codex-supported-10a37f)](https://openai.com/codex)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Mentioned in Awesome EU AI Act](https://awesome.re/mentioned-badge.svg)](https://github.com/GenAI-Gurus/awesome-eu-ai-act#eu-ai-act-compliance-platforms)

## Skills in this repository

| Skill | Description | Path |
|-------|-------------|------|
| [`ai-act-compliance`](./skills/ai-act-compliance) | Authoritative guide for EU AI Act compliance — risk classification, conformity assessment, technical documentation, FRIA, post-market monitoring, AI literacy, substantial modification, sandboxes — strictly aligned with ISO/IEC 42001 + 27090. Ships with a machine-readable **SSL** manifest (`ssl.json`) per Liang et al. *From Skill Text to Skill Structure* (arXiv:2604.24026). | [`skills/ai-act-compliance`](./skills/ai-act-compliance) |

## Install

The skill content is **identical across runtimes** — only discovery
and install paths differ. Pick your host:

### Claude Code

```bash
# Via the skills.sh CLI (recommended)
npx skills add abk1969/ai-act-skills@ai-act-compliance -g -y

# Manual
git clone https://github.com/abk1969/ai-act-skills
cp -R ai-act-skills/skills/ai-act-compliance ~/.claude/skills/      # macOS / Linux
xcopy ai-act-skills\skills\ai-act-compliance $env:USERPROFILE\.claude\skills\ai-act-compliance /E /I  # Windows
```

Then `/reload-plugins` in Claude Code.

### Gemini CLI

```bash
git clone https://github.com/abk1969/ai-act-skills
mkdir -p ~/.gemini/skills/
cp -R ai-act-skills/skills/ai-act-compliance ~/.gemini/skills/
```

Gemini reads `GEMINI.md` at session start and activates the skill via
`activate_skill`.

### OpenAI Codex

```bash
git clone https://github.com/abk1969/ai-act-skills
mkdir -p ~/.agents/skills/
cp -R ai-act-skills/skills/ai-act-compliance ~/.agents/skills/
```

Codex reads `AGENTS.md` at the project root.

### Compatibility matrix

| Runtime | Status | Discovery | Install path |
|---|---|---|---|
| **Claude Code** | ✅ first-class | `SKILL.md` frontmatter | `~/.claude/skills/ai-act-compliance/` |
| **Gemini CLI** | ✅ supported | `GEMINI.md` (root + skill) | `~/.gemini/skills/ai-act-compliance/` |
| **OpenAI Codex** | ✅ supported | `AGENTS.md` (root + skill) | `~/.agents/skills/ai-act-compliance/` |
| Copilot CLI / Cursor | 🟡 community | `AGENTS.md` | varies |

Full activation contract + smoke test:
[`skills/ai-act-compliance/references/15-platform-compatibility.md`](./skills/ai-act-compliance/references/15-platform-compatibility.md).

The skill auto-triggers on EU AI Act / ISO 42001 / ISO 27090 questions
on every supported runtime.

## Why this repo exists

Several skills exist for ISO 27001 (generic ISMS) and adjacent compliance domains. **None codified the EU AI Act with strict ISO 42001 + 27090 alignment** — until now.

This repo fills that gap with operational, citation-grade content:

- **Every claim cites the article, clause, or control number** (e.g., `art. 9(2)(a)`, `cl. 6.1.4`, `A.5.4`)
- **Templates** for Annex IV technical documentation, FRIA (art. 27), post-market monitoring, serious-incident reporting
- **Master crosswalk** mapping each AI Act provision to its ISO 42001 + 27090 + companion-standard anchors
- **GenAI/LLM-specific** guidance via ISO 27090's foundation-model annex + OWASP LLM Top 10 cross-reference

The skill is **decision-support**, not legal advice — explicitly so. Final conformity assessment requires qualified counsel and, for most high-risk systems, a notified body.

## Standards anchored

- **Regulation (EU) 2024/1689** (AI Act) — primary source
- **ISO/IEC 42001:2023** — AIMS, the AI-specific management system standard
- **ISO/IEC 27090 (FDIS)** — AI cybersecurity guidance
- **ISO/IEC 23894:2023** — AI risk management
- **ISO/IEC 23053:2022** — ML framework
- **ISO/IEC 5338:2023** — AI lifecycle processes
- **ISO/IEC 5259-1 to -5** — data quality for AI
- **ISO/IEC 24029-1, -2** — robustness assessment of NN
- **ISO/IEC TS 4213:2022** — classification model performance
- **ISO/IEC 25059** — quality model for AI systems
- **ISO/IEC 42005:2025** — AI system impact assessment
- **ISO/IEC 42006:2025** — audit & certification body requirements
- **CEN-CENELEC JTC 21** harmonised standards under mandate M/593 (in development)

## Why ISO 42001 + 27090 — not ISO 27001

Many AI compliance efforts mistakenly anchor on ISO 27001 (generic information security management). This repository is uncompromising on the alignment:

- **ISO/IEC 42001:2023** is the **AI-specific** management standard. It includes AI-specific clauses (cl. 6.1.4 AI system impact assessment) and Annex A controls (A.5 impact, A.6 lifecycle, A.7 data, A.8 information for parties, A.9 use, A.10 third parties) that ISO 27001 does not cover.
- **ISO/IEC 27090 (FDIS)** is the **AI-specific cybersecurity** depth standard. Its threat taxonomy directly maps to AI Act art. 15(5) Recital 76 named threats: data poisoning, model poisoning, model evasion, confidentiality attacks, model flaws.
- ISO 27001 remains useful as the **org-level ISMS baseline** that 42001 + 27090 build upon — but it is NOT the AI-specific framework for AI Act conformity.

CEN-CENELEC JTC 21 (under standardization mandate M/593) is on a path to publish **EN ISO/IEC 42001 / 23894 / 27090** as harmonised standards conferring AI Act art. 40 presumption of conformity. This skill anticipates that path.

## Contents

```
ai-act-skills/
├── README.md                                   # This file
├── AGENTS.md                                   # Codex / OpenAI / AGENTS-aware discovery
├── GEMINI.md                                   # Gemini CLI session-start activation
├── CHANGELOG.md
├── CITATION.cff
├── LICENSE                                     # MIT
└── skills/
    └── ai-act-compliance/
        ├── SKILL.md                            # Entry point + taxonomy + decision tree + 7 SSL scenes
        ├── ssl.json                            # Scheduling-Structural-Logical manifest (arXiv:2604.24026)
        ├── AGENTS.md                           # Codex skill-level mirror
        ├── GEMINI.md                           # Gemini CLI skill-level mirror
        ├── README.md                           # Skill-level README
        ├── package.json                        # skills.sh metadata + platforms
        ├── LICENSE                             # MIT (skill-level)
        └── references/
            ├── 01-risk-classification.md       # 4-tier rubric + Annex III + edge cases
            ├── 02-high-risk-obligations.md     # arts. 8-29, 40-49 + 5-pillar deliverables
            ├── 03-iso-42001-aims.md            # clauses 4-10 + 38 Annex A controls + cert
            ├── 04-iso-27090-ai-security.md     # threat taxonomy + mitigations + GenAI annex
            ├── 05-crosswalk-aiact-iso.md       # the master mapping table
            ├── 06-techdoc-annex-iv.md          # Annex IV technical file template
            ├── 07-fria-art27.md                # FRIA template + ISO 42005
            ├── 08-transparency-art50.md        # disclosure UX + watermarking + C2PA
            ├── 09-post-market-art72-73.md      # PMM plan + incident reporting playbook
            ├── 10-gpai-and-timeline.md         # GPAI 51-55 + sanctions 99 + timeline 113
            ├── 11-art4-ai-literacy.md          # AI literacy programme (in force since 2025-02-02)
            ├── 12-art25-substantial-modification.md  # provider-flip + foundation-model fine-tuning
            ├── 13-sandboxes-and-real-world-testing.md # art. 57-63 sandboxes + art. 60 testing
            ├── 14-codes-and-right-to-explanation.md  # art. 56 GPAI code + art. 95 voluntary + art. 86
            └── 15-platform-compatibility.md    # Claude Code / Gemini CLI / Codex install + activation
```

## Machine-readable manifest (SSL)

`skills/ai-act-compliance/ssl.json` is built per the **Scheduling-Structural-Logical (SSL)** representation introduced by Liang, Wang, Liang & Liu, *From Skill Text to Skill Structure: The Scheduling-Structural-Logical Representation for Agent Skills* (arXiv:2604.24026, 2026). It disentangles three layers:

- **Scheduling**: `skill_id`, `skill_goal`, `intent_signature`, `tags`, `top_pattern`, `expected_inputs/outputs`, `dependencies`, `control_flow_features`, `entry_scene_id`, `subscenes`.
- **Structural**: 7 typed scenes (`PREPARE_SCOPE`, `ACQUIRE_FACTS`, `REASON_TIER`, `ACT_OBLIGATIONS`, `VERIFY_ARTIFACTS`, `RECOVER_INCIDENT`, `FINALIZE_REPORT`) with explicit transitions.
- **Logical**: 28 atomic logic steps with closed `act_type` and `resource_scope` vocabularies, `actor`, `instrument`, `preconditions`, `effects`, and `next_step_rules`.

The manifest validates against the paper's Pass-4 rules: globally unique IDs, valid enums, valid containment links, valid entry pointers, transition targets either in-scope or terminal (`END_SUCCESS`/`END_FAIL`/`YIELD_SUCCESS`/`YIELD_FAIL`). The SKILL.md remains the source of truth — `ssl.json` is a derived, source-grounded view (per paper § 5.2: "SSL should not replace the source document").

**Pre-execution risk profile**: this skill declares **no network access, no credentials access, no code execution, no external tool calls** — `touches_sensitive_resources: false`. All resource access is `LOCAL_FS` (reading reference files) or `MEMORY` (working memory).

## FAQ

### Is this a Claude Code skill, a Gemini CLI skill, or an OpenAI Codex skill?

It's **all three**. Since v1.2.0, the same skill content runs natively on Claude Code, Gemini CLI, and OpenAI Codex. Only the discovery file differs per platform (`SKILL.md` for Claude Code via `~/.claude/skills/`, `GEMINI.md` for Gemini CLI via `~/.gemini/skills/`, `AGENTS.md` for OpenAI Codex via `~/.agents/skills/`). The 15 reference files and the SSL manifest are byte-identical across runtimes.

### Why anchor on ISO 42001 + 27090 instead of ISO 27001?

ISO/IEC 42001:2023 is the AI-specific Management System standard. It includes AI-specific clauses (cl. 6.1.4 AI system impact assessment) and Annex A controls (A.5–A.10) that ISO 27001 does not cover. ISO/IEC 27090 (FDIS) is the AI-specific cybersecurity depth standard, with a threat taxonomy that maps directly to AI Act art. 15(5) Recital 76 (data poisoning, model poisoning, model evasion, confidentiality attacks, model flaws). ISO 27001 remains useful as the org-level ISMS baseline that 42001 + 27090 build upon — but it is not the AI-specific framework for AI Act conformity. CEN-CENELEC JTC 21 (under standardization mandate M/593) is on a path to publish EN ISO/IEC 42001 / 23894 / 27090 as harmonised standards conferring AI Act art. 40 presumption of conformity.

### How does this differ from MCP servers like ark-forge/mcp-eu-ai-act?

This skill codifies the regulation. An MCP server automates scans. A benchmark framework like [`compl-ai`](https://github.com/compl-ai/compl-ai) (ETH Zurich + INSAIT + LatticeFlow AI) evaluates models. They are complementary, not substitutes. A serious AI Act compliance program likely uses **all three**: the skill to structure the dossier and identify obligations, an MCP server to automate codebase scans in CI/CD, and a benchmark to evaluate any foundation models you ship. See [Discussion #2](https://github.com/abk1969/ai-act-skills/discussions/2) for the full positioning.

### Is this legal advice?

**No.** This is decision-support. Final EU AI Act conformity assessment requires qualified legal counsel for binding interpretation, a notified body for conformity assessment of high-risk AI systems under the Annex VII path (where applicable, per art. 43), and an accredited certification body for ISO/IEC 42001 certification. Use this skill to structure your work, not to substitute for professional review.

### When does the EU AI Act fully apply?

Key dates from art. 113:

- **2024-08-01** — Regulation enters into force
- **2025-02-02** — Art. 5 prohibitions + Art. 4 AI literacy effective
- **2025-08-02** — GPAI obligations (Chapter V) + governance + penalties
- **2026-08-02** — Art. 50 transparency, art. 95 codes, Commission GPAI enforcement (art. 101)
- **2026-12-02** — New art. 5 NCII/CSAM prohibition (AI Omnibus) + end of art. 50(2) marking grace period
- **2027-08-02** — Regulatory sandboxes operational (deferred by the AI Omnibus)
- **2027-12-02** — High-risk regime for stand-alone Annex III systems (deferred by the AI Omnibus from 2026-08-02)
- **2028-08-02** — Annex I product-safety pathway (deferred by the AI Omnibus from 2027-08-02)

> The **2026 AI Omnibus** amendment (Parliament 2026-06-16, Council 2026-06-29) set these deferred dates. OJ publication was pending as of 2026-07-14 — verify the OJEU before relying on them.

### What are the sanctions?

Three tiers under art. 99:

- **Tier 1**: €35M or 7% global turnover — for art. 5 prohibited practices
- **Tier 2**: €15M or 3% global turnover — for most other provisions (arts. 8-17, 26-29, 50, 53-55)
- **Tier 3**: €7.5M or 1.5% global turnover — for incorrect/incomplete/misleading info to authorities

For SMEs and startups, the **lower** of the fixed amount or percentage applies (art. 99(6)).

### Does my AI system fall under art. 4 AI literacy?

If you are a provider OR deployer of any AI system that interacts with people in the EU, **yes**. Art. 4 has applied since 2025-02-02, regardless of risk tier (minimal, limited, high, or universal/GPAI). It mandates measures to ensure sufficient AI literacy of staff and other persons dealing with the operation/use of the AI system on the organisation's behalf. See [`references/11-art4-ai-literacy.md`](skills/ai-act-compliance/references/11-art4-ai-literacy.md).

### How do I install this on Claude Code / Gemini CLI / OpenAI Codex?

```bash
# Claude Code
npx skills add abk1969/ai-act-skills@ai-act-compliance -g -y

# Gemini CLI
git clone https://github.com/abk1969/ai-act-skills && \
  mkdir -p ~/.gemini/skills/ && \
  cp -R ai-act-skills/skills/ai-act-compliance ~/.gemini/skills/

# OpenAI Codex
git clone https://github.com/abk1969/ai-act-skills && \
  mkdir -p ~/.agents/skills/ && \
  cp -R ai-act-skills/skills/ai-act-compliance ~/.agents/skills/
```

Full activation contract per platform:
[`skills/ai-act-compliance/references/15-platform-compatibility.md`](skills/ai-act-compliance/references/15-platform-compatibility.md).

## Versioning

This repository uses semantic versioning:

- **Major**: AI Act amendment (delegated act under art. 7), substantive Commission implementing act
- **Minor**: New ISO standard publication, JTC 21 OJEU citation
- **Patch**: Editorial corrections, structural improvements

Current version: **2.0.1** — Regulatory content update: the **2026 AI Omnibus** amendment (deferred high-risk dates 2027-12-02 / 2028-08-02, new art. 5 NCII/CSAM prohibition, art. 50(2) grace period, sandbox deferral, machinery carve-out) + **GPAI Code of Practice** operative status (published 2025-07-10, adequacy 2025-08-01) + JTC 21 harmonised-standards status + Commission draft guidance (art. 6 classification, art. 73 incident reporting). Major bump per the versioning legend: AI Act amendment.

## Contributing

If you spot regulatory drift (e.g., a Commission act lands, ISO publishes a new standard, JTC 21 cites EN ISO/IEC 42001 in OJEU), please open a PR.

When adding new content, follow the conventions:
- Cite article / clause / control numbers exactly (`art. 9(2)(a)`, `cl. 6.1.4`, `A.5.4`)
- Anchor on ISO 42001 + 27090 — never ISO 27001 as the AI-specific framework
- Provide an output template at the end of every reference
- Distinguish provider vs deployer obligations explicitly

## Legal notice

This work is **decision-support only**, not legal advice. The author makes no representation as to fitness for any particular AI Act compliance purpose. Final conformity assessment requires:

- **Qualified legal counsel** for binding interpretation
- **Notified body** for conformity assessment of high-risk AI systems where Annex VII path applies (art. 43)
- **Accredited certification body** for ISO/IEC 42001 certification

Use this repository to structure compliance work, not to substitute for professional review.

## License

MIT — see [`LICENSE`](LICENSE).

## Author

[abk1969](https://github.com/abk1969). Built atop production AI Act compliance experience from the AI Act Navigator project.

---

*The AI Act (Regulation (EU) 2024/1689) entered into force 2024-08-01. Article 5 prohibitions apply since 2025-02-02. Art. 50 transparency: 2026-08-02. High-risk obligations (Annex III): 2027-12-02 and Annex I product-safety pathway: 2028-08-02, as deferred by the 2026 AI Omnibus (OJ publication pending as of 2026-07-14).*
