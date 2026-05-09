# Awesome-* list entries

Ready-to-paste entries for awesome-* lists. Status of submissions:

| List | Status | URL |
|---|---|---|
| `GenAI-Gurus/awesome-eu-ai-act` | ✅ PR opened | https://github.com/GenAI-Gurus/awesome-eu-ai-act/pull/14 |
| `VoltAgent/awesome-agent-skills` | ⏳ wait — community-usage gating; re-submit at >10 stars | — |
| `ComposioHQ/awesome-claude-skills` | ❌ different model (in-repo skills, not curated links) | — |
| `imran-siddique/awesome-ai-governance` | ❌ niche mismatch (runtime governance, not EU-AI-Act tooling) | — |
| `ethanolivertroy/awesome-grc-ai` | ❌ niche mismatch (mostly commercial GRC SaaS) | — |
| `theopenlane/awesome-compliance` | ⏳ to evaluate | — |
| `getprobo/awesome-compliance` | ⏳ to evaluate | — |
| `EthicalML/awesome-artificial-intelligence-regulation` | ⏳ to evaluate | — |
| `AthenaCore/AwesomeResponsibleAI` | ⏳ to evaluate | — |
| `awesomeclaude.ai` directory | ⏳ to evaluate (visual directory) | — |

## Standard one-line entry (use this format if the list expects 1-line entries)

```markdown
- **[ai-act-skills](https://github.com/abk1969/ai-act-skills)** — Multi-platform agent skill for EU AI Act compliance, anchored on ISO/IEC 42001:2023 (AIMS) and ISO/IEC 27090:2025 (AI cybersecurity). Runs natively on Claude Code, Gemini CLI, and OpenAI Codex. Citation-grade — every obligation cites article + clause + Annex A control. Reference-only profile (no network, no tool calls). MIT.
```

## Long entry (use if the list expects detailed descriptions)

```markdown
- [ai-act-skills](https://github.com/abk1969/ai-act-skills) - Multi-platform agent skill running natively on Claude Code, Gemini CLI, and OpenAI Codex. Strict ISO/IEC 42001:2023 (AIMS) + 27090:2025 (AI cybersecurity) anchoring — never ISO 27001 as primary AI framework. Citation-grade: every obligation cites article + clause + Annex A control (e.g., art. 9(2)(a) → cl. 6.1.4 + A.5.4). 15 reference files covering risk classification, FRIA (art. 27), Annex IV, post-market, GPAI, sandboxes, AI literacy (art. 4). Machine-readable SSL manifest per arXiv:2604.24026. Reference-only — no network, no credentials, no tool calls. MIT.
```

## Short entry (badge-style for tighter lists)

```markdown
- [`ai-act-skills`](https://github.com/abk1969/ai-act-skills) — EU AI Act compliance for Claude Code + Gemini CLI + Codex. ISO 42001 + 27090 anchored. MIT.
```

## VoltAgent-style (when re-submitting at >10 stars)

```markdown
**[abk1969/ai-act-compliance](https://github.com/abk1969/ai-act-skills)** - EU AI Act compliance, ISO 42001+27090 anchored, multi-platform
```

(Their CONTRIBUTING.md requires "10 words or fewer" descriptions and existing community usage. The format above hits the constraint.)

## Per-list notes

### GenAI-Gurus/awesome-eu-ai-act ✅ PR #14 opened

- Section: "Open-Source Projects → EU AI Act Compliance Platforms"
- Inserted alphabetically (first in list)
- Co-listed with: VerifyWise, EuConform, SonnyLabs MCP, ark-forge MCP, ARQNXS Compliance Checker, Compl-AI

### VoltAgent/awesome-agent-skills

- CONTRIBUTING.md mandates: "Skill must have real community usage. Brand new skills that were just created are not accepted."
- Wait until: GitHub stars >10 OR skills.sh installs >50 OR community testimonial available
- Use the VoltAgent-style entry above when re-submitting

### theopenlane/awesome-compliance / getprobo/awesome-compliance

- Generic compliance lists — broader scope than EU AI Act
- May fit under "AI Governance" subsection if they have one
- Lower priority — broader audiences = more dilution

### EthicalML/awesome-artificial-intelligence-regulation

- Maps the AI regulation ecosystem (guidelines, principles, standards, regulation)
- Our skill fits as "regulation-implementation tooling"
- Worth a PR

### AthenaCore/AwesomeResponsibleAI

- Responsible AI focus — broader than compliance
- Our skill could fit under "tools and standards"
- Lower priority — wide audience

## What to NOT submit to

- Generic "awesome compliance" lists where the entries are mostly commercial GRC SaaS (Drata, Vanta, Secureframe). Our open-source skill creates an awkward outlier.
- Lists focused on runtime governance (`awesome-ai-governance`) — different category. The skill doesn't enforce policy at runtime.
- Lists where contribution requires copying the skill INTO the repo (`ComposioHQ/awesome-claude-skills`) — duplicates content; skill already has its canonical home.
