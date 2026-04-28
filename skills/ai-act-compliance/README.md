# ai-act-compliance

> Authoritative Claude Code skill for **EU AI Act (Regulation 2024/1689)** compliance — strictly aligned with **ISO/IEC 42001:2023** (AIMS) and **ISO/IEC 27090:2025** (AI cybersecurity).

[![EU AI Act](https://img.shields.io/badge/EU_AI_Act-2024%2F1689-1f4e79)](https://eur-lex.europa.eu/eli/reg/2024/1689/oj)
[![ISO 42001](https://img.shields.io/badge/ISO%2FIEC-42001%3A2023-0066b3)](https://www.iso.org/standard/81230.html)
[![ISO 27090](https://img.shields.io/badge/ISO%2FIEC-27090%3A2025-0066b3)](https://www.iso.org/standard/56581.html)

## What this skill does

Provides decision-support for AI Act compliance work, with every output traceable to:

- **Regulation (EU) 2024/1689** — the AI Act itself (the legally binding source)
- **ISO/IEC 42001:2023** — AI Management System (AIMS), the certifiable management standard
- **ISO/IEC 27090:2025** — Cybersecurity guidance for AI (depth standard for art. 15)
- **Companion ISO standards**: 23894 (risk mgmt), 23053 (ML framework), 5338 (lifecycle), 5259-* (data quality), 24029-2 (robustness), 42005 (impact assessment), 42006 (audit & certification)
- **CEN-CENELEC JTC 21** harmonised standards under standardization mandate M/593

## When to use

Invoke when the conversation involves any of:

- Risk classification (art. 5 prohibited / art. 6 + Annex III high-risk / art. 50 limited)
- Conformity assessment for high-risk AI systems (arts. 8–15, 40–49)
- Annex IV technical documentation
- Fundamental Rights Impact Assessment (art. 27 FRIA)
- Quality Management System for AI providers (art. 17, ISO 42001)
- AI cybersecurity (art. 15, Recital 76, ISO 27090)
- Transparency obligations (art. 50 — chatbots, generative content, deepfakes)
- Post-market monitoring (art. 72)
- Serious incident reporting (art. 73)
- General-Purpose AI obligations (arts. 51–55)
- Sanctions (art. 99) and timeline (art. 113)
- Mapping AI Act articles to ISO 42001 / ISO 27090 controls

**Do NOT use for**:
- General data protection (GDPR — separate regime; consider a dedicated GDPR skill)
- Generic ISO 27001 ISMS work — the `iso27001` skill is more appropriate
- Non-EU AI regulations (NIST AI RMF, UK approach, etc.)

## Structure

```
ai-act-compliance/
├── SKILL.md                              # Entry point — triggers, taxonomy, decision tree
├── README.md                             # This file
├── LICENSE                               # MIT
├── package.json                          # For skills.sh marketplace
└── references/
    ├── 01-risk-classification.md         # 4-tier rubric + 14-signal questionnaire + edge cases
    ├── 02-high-risk-obligations.md       # Provider + deployer obligations across arts. 8-29, 40-49
    ├── 03-iso-42001-aims.md              # Full clauses 4-10 + 38 Annex A controls + companions + cert
    ├── 04-iso-27090-ai-security.md       # Threat taxonomy + mitigations + GenAI annex + adjacent stds
    ├── 05-crosswalk-aiact-iso.md         # The big mapping table — every art. → 42001 + 27090 + companions
    ├── 06-techdoc-annex-iv.md            # Annex IV technical file template
    ├── 07-fria-art27.md                  # FRIA template + ISO 42005 alignment
    ├── 08-transparency-art50.md          # Disclosure UX + watermarking + C2PA
    ├── 09-post-market-art72-73.md        # PMM plan + incident reporting playbook
    └── 10-gpai-and-timeline.md           # GPAI arts. 51-55, sanctions art. 99, timeline art. 113
```

The entry point (`SKILL.md`) routes to the right reference based on the user's intent. Each reference is self-contained and includes a practical output template.

## Installation

### Via the skills.sh CLI (recommended)

```bash
npx skills add abk1969/ai-act-skills@ai-act-compliance -g -y
```

(Replace `abk1969` with the published owner once on skills.sh.)

### Manual install

Clone and copy into your Claude skills directory:

**macOS / Linux**:
```bash
git clone https://github.com/abk1969/ai-act-skills
cp -R ai-act-skills/skills/ai-act-compliance ~/.claude/skills/
```

**Windows**:
```powershell
git clone https://github.com/abk1969/ai-act-skills
xcopy ai-act-skills\skills\ai-act-compliance %USERPROFILE%\.claude\skills\ai-act-compliance /E /I
```

Then reload Claude Code's skill index:

```
/reload-plugins
```

The skill name `ai-act-compliance` will appear in the available skills list and auto-trigger on relevant questions.

## Why ISO 42001 + 27090 (and not ISO 27001)?

Many AI compliance efforts mistakenly anchor on ISO 27001 (generic information security management). This skill is uncompromising on the alignment:

- **ISO/IEC 42001:2023** (AIMS) is the **AI-specific** management standard. It includes AI-specific clauses (cl. 6.1.4 AI system impact assessment) and Annex A controls (A.5 impact, A.6 lifecycle, A.7 data, A.8 information for parties, A.9 use, A.10 third parties) that ISO 27001 does not cover.
- **ISO/IEC 27090:2025** is the **AI-specific cybersecurity** depth standard. Its threat taxonomy directly maps to AI Act art. 15(5) Recital 76 named threats: data poisoning, model poisoning, model evasion, confidentiality attacks, model flaws.
- ISO 27001 remains useful as the **org-level ISMS baseline** that 42001 + 27090 build upon — but it is NOT the AI-specific framework for AI Act conformity.

CEN-CENELEC JTC 21 (under standardization mandate M/593) is on a path to publish **EN ISO/IEC 42001 / 23894 / 27090** as harmonised standards conferring AI Act art. 40 presumption of conformity. This skill anticipates that path.

## Quality bar

This skill is built to be **operational and rigorous**, not introductory. It assumes:

- Familiarity with regulatory terminology (provider, deployer, conformity assessment, harmonised standards, OJEU)
- Working knowledge of management-system standards (Annex SL HLS, Statement of Applicability, internal audit)
- Access to authoritative source documents when binding interpretation is needed (the regulation itself, ISO standards, Commission acts)

Every claim cites the specific article, clause, or control number. Where the standard is silent or under development (e.g., harmonised-standard OJEU citations as of early 2026), the skill says so explicitly.

## Limitations & legal notice

This skill is **decision-support only**, not legal advice. Final conformity assessment requires:

- **Qualified counsel** for binding interpretation
- **Notified body** for conformity assessment of high-risk AI systems (where Annex VII path applies under art. 43)
- **Accredited certification body** for ISO/IEC 42001 certification

The author is not responsible for compliance decisions made on the basis of this skill's outputs. Use it to structure your work, not to substitute for professional review.

## Related skills

- [`iso27001`](https://github.com/lawvable/awesome-legal-skills) — for the org-level ISMS baseline that 42001 + 27090 assume
- [`legal-risk-assessment`](https://skills.sh/anthropics/knowledge-work-plugins/legal-risk-assessment) — adjacent for general legal risk
- [`gdpr-data-handling`](https://skills.sh/wshobson/agents/gdpr-data-handling) — for the privacy regime that intersects with AI Act art. 10 (data) and art. 26(8) (DPIA coordination with FRIA)
- [`documentation`](https://skills.sh/) — for drafting Annex IV technical files in long form
- [`c4-architecture`](https://skills.sh/), [`mermaid-diagrams`](https://skills.sh/), [`uml`](https://skills.sh/) — for system architecture diagrams required by Annex IV §2(b)(c)
- [`example-skills:docx`, `:pdf`, `:xlsx`](https://github.com/anthropics/skills) — for producing compliance deliverables (FRIA reports, risk registers, declarations of conformity)

## Standards tracked

| Standard | Status (as of April 2026) | Role in this skill |
|----------|---------------------------|--------------------|
| Regulation (EU) 2024/1689 (AI Act) | In force; full application 2026-08-02 | Primary source |
| ISO/IEC 42001:2023 | Published; certifiable | Primary AIMS standard |
| ISO/IEC 27090:2025 | Published; informative | Primary AI security standard |
| ISO/IEC 23894:2023 | Published; informative | AI risk management depth |
| ISO/IEC 23053:2022 | Published | ML framework + terminology |
| ISO/IEC 5338:2023 | Published | AI lifecycle processes |
| ISO/IEC 5259-1 to -5 | Published / partly published | Data quality for AI |
| ISO/IEC 24029-1, -2 | Published; -3 forthcoming | NN robustness assessment |
| ISO/IEC TS 4213:2022 | Published | Classification model performance |
| ISO/IEC 25059 | Published | Quality model for AI |
| ISO/IEC 42005:2025 | Published | AI system impact assessment depth |
| ISO/IEC 42006:2025 | Published | Audit & certification body requirements |
| EN ISO/IEC 42001 / 23894 / 5259 / 24029-2 / 27090 | Under development by CEN-CENELEC JTC 21 | Harmonised standards path (art. 40) |
| Commission delegated/implementing acts | Various stages | Tracked via art. 7, 11(3), 27(5), 41, 51(3), 56, 71(4), 72(3), 73(7) |

## Versioning

This skill version: **1.0.0**

Update triggers:
- Major: AI Act amendment (delegated act under art. 7), new Commission implementing act
- Minor: New ISO standard publication, JTC 21 OJEU citation
- Patch: Editorial corrections, structure improvements

## Contributing

If you spot regulatory drift (e.g., a Commission act lands, ISO publishes a new standard, JTC 21 cites EN ISO/IEC 42001 in OJEU), please open a PR.

## License

MIT — see `LICENSE`.

## Author

Built for the **AI Act Navigator** project — codifying compliance expertise from a production AI Act compliance platform with 30+ services, full 113-article indexing, and 5-stage multi-agent regulatory monitoring pipeline.

---

> *This skill is decision-support, not legal advice. Final AI Act conformity determination requires qualified counsel and, for most high-risk systems, a notified body.*
