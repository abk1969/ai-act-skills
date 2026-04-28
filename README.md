# ai-act-skills

> Claude Code skills for **EU AI Act (Regulation 2024/1689)** compliance, anchored exclusively on **ISO/IEC 42001:2023** (AI Management System) and **ISO/IEC 27090:2025** (AI cybersecurity).

[![EU AI Act](https://img.shields.io/badge/EU_AI_Act-2024%2F1689-1f4e79)](https://eur-lex.europa.eu/eli/reg/2024/1689/oj)
[![ISO 42001](https://img.shields.io/badge/ISO%2FIEC-42001%3A2023-0066b3)](https://www.iso.org/standard/81230.html)
[![ISO 27090](https://img.shields.io/badge/ISO%2FIEC-27090%3A2025-0066b3)](https://www.iso.org/standard/56581.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Skills in this repository

| Skill | Description | Path |
|-------|-------------|------|
| [`ai-act-compliance`](./skills/ai-act-compliance) | Authoritative guide for EU AI Act compliance — risk classification, conformity assessment, technical documentation, FRIA, post-market monitoring — strictly aligned with ISO/IEC 42001 + 27090 | [`skills/ai-act-compliance`](./skills/ai-act-compliance) |

## Install

### Via the [skills.sh](https://skills.sh) CLI

```bash
npx skills add abk1969/ai-act-skills@ai-act-compliance -g -y
```

### Manual install

```bash
git clone https://github.com/abk1969/ai-act-skills
# macOS / Linux
cp -R ai-act-skills/skills/ai-act-compliance ~/.claude/skills/
# Windows (PowerShell)
xcopy ai-act-skills\skills\ai-act-compliance $env:USERPROFILE\.claude\skills\ai-act-compliance /E /I
```

Then `/reload-plugins` in Claude Code. The skill auto-triggers on EU AI Act / ISO 42001 / ISO 27090 questions.

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
- **ISO/IEC 27090:2025** — AI cybersecurity guidance
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
- **ISO/IEC 27090:2025** is the **AI-specific cybersecurity** depth standard. Its threat taxonomy directly maps to AI Act art. 15(5) Recital 76 named threats: data poisoning, model poisoning, model evasion, confidentiality attacks, model flaws.
- ISO 27001 remains useful as the **org-level ISMS baseline** that 42001 + 27090 build upon — but it is NOT the AI-specific framework for AI Act conformity.

CEN-CENELEC JTC 21 (under standardization mandate M/593) is on a path to publish **EN ISO/IEC 42001 / 23894 / 27090** as harmonised standards conferring AI Act art. 40 presumption of conformity. This skill anticipates that path.

## Contents

```
ai-act-skills/
├── README.md                                   # This file
├── LICENSE                                     # MIT
└── skills/
    └── ai-act-compliance/
        ├── SKILL.md                            # Entry point + taxonomy + decision tree
        ├── README.md                           # Skill-level README
        ├── package.json                        # skills.sh metadata
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
            └── 10-gpai-and-timeline.md         # GPAI 51-55 + sanctions 99 + timeline 113
```

## Versioning

This repository uses semantic versioning:

- **Major**: AI Act amendment (delegated act under art. 7), substantive Commission implementing act
- **Minor**: New ISO standard publication, JTC 21 OJEU citation
- **Patch**: Editorial corrections, structural improvements

Current version: **1.0.0** — initial release.

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

*The AI Act (Regulation (EU) 2024/1689) entered into force 2024-08-01. Article 5 prohibitions apply since 2025-02-02. Full application of high-risk obligations: 2026-08-02. Annex I product-safety pathway: 2027-08-02.*
