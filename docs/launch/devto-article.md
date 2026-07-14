---
# Dev.to / Hashnode / Medium article — ready to copy-paste
# Recommended publication date: Tuesday 2026-05-12 (8-10am Paris time)
# Title is SEO-optimized for queries like:
#   - "ISO 27001 vs ISO 42001 AI Act"
#   - "EU AI Act compliance skill Claude Code"
#   - "multi-platform agent skill Gemini Codex"
title: "Stop putting your AI on ISO 27001 — and the multi-platform agent skill I built to fix it"
published: false  # set to true when ready
description: "Why ISO 42001 + 27090 (not ISO 27001) are the right anchors for EU AI Act conformity, and how I built a citation-grade compliance skill that runs natively on Claude Code, Gemini CLI, and OpenAI Codex."
tags: euaiact, compliance, claudecode, opensource
canonical_url: https://github.com/abk1969/ai-act-skills
cover_image: # upload assets/og-card.png after rasterizing the SVG
series: AI Act compliance
---

# Stop putting your AI on ISO 27001 — and the multi-platform agent skill I built to fix it

> **TL;DR** — Most EU AI Act compliance work anchors on the wrong ISO standard. ISO/IEC 27001 is the generic Information Security Management System; it doesn't cover AI-specific clauses or controls. The correct anchors are **ISO/IEC 42001:2023** (AI Management System) and **ISO/IEC 27090 (FDIS)** (AI cybersecurity). I codified the AI Act + ISO 42001/27090 mapping into an open-source agent skill that runs natively on **Claude Code, Gemini CLI, and OpenAI Codex** — same content, three runtimes, zero tool-call lock-in. Repo: [github.com/abk1969/ai-act-skills](https://github.com/abk1969/ai-act-skills)

---

## The problem

The EU AI Act ([Regulation 2024/1689](https://eur-lex.europa.eu/eli/reg/2024/1689/oj)) hits full application on **August 2, 2026**. Penalties: up to **€35 million or 7% of global revenue**, whichever is higher.

Twelve months out, most teams I see preparing for it are anchoring their AI Act compliance work on **ISO/IEC 27001**.

That's the wrong standard.

Not "kind of wrong" or "you'll be fine" wrong. Wrong in the same way that running a SOC 2 program for HIPAA compliance is wrong — partially overlapping, not actually the standard the regulator points to.

This article explains:

1. **Why ISO 27001 is the wrong primary anchor for AI Act conformity** (and what is)
2. **How the correct mapping works** in practice — article → clause → control
3. **Why I built this as a multi-platform agent skill**, not an MCP server or a benchmark — and how the three categories fit together
4. **The technical choices** that made portability across Claude Code, Gemini CLI, and OpenAI Codex trivial

If you're doing AI Act compliance work in 2026, this is for you. If you're shipping AI features and your compliance team mentions ISO 27001 as the framework, share this.

---

## Part 1 — Why ISO 27001 isn't the AI-specific framework

### The category error

ISO/IEC 27001 is the **Information Security Management System (ISMS)** standard. It's been around since 2005, certifiable, well-tooled, well-understood. Every infosec team in Europe lives or dies by it.

It is not, however, an **AI-specific** standard.

Here's what 27001 doesn't cover that the AI Act explicitly requires:

| AI Act requirement | ISO 27001 covers it? | What does cover it? |
|---|---|---|
| AI risk management system (art. 9) | Generic risk only | **ISO 42001 cl. 6.1.2** + **ISO 23894** (AI risk depth) |
| Data quality and governance for AI training (art. 10) | Generic data security | **ISO 42001 cl. 7.4** + **ISO/IEC 5259-1 to -5** |
| AI cybersecurity threats — data poisoning, model evasion, prompt injection (art. 15) | Generic infosec | **ISO/IEC 27090 (FDIS)** (purpose-built) |
| AI system impact assessment (art. 27 FRIA) | Not at all | **ISO 42001 cl. 6.1.4** + **ISO 42005:2025** |
| AI-specific transparency to users (art. 13, art. 50) | Generic | **ISO 42001 A.8** |
| AI lifecycle controls (training, deployment, decommissioning) | Generic | **ISO 42001 A.6** + **ISO/IEC 5338:2023** |
| Information for affected parties (art. 14, 26(11)) | No | **ISO 42001 A.8** |

ISO 27001 remains useful as the **org-level baseline that 42001 builds on**. The two are designed to integrate via the Annex SL high-level structure. Many orgs will run an integrated 27001 + 42001 management system — that's fine.

But for **AI Act conformity**, the AI-specific framework is **ISO/IEC 42001:2023**, not 27001.

### What ISO 42001 actually adds

ISO/IEC 42001:2023 — published Dec 2023, the world's first AI Management System standard — introduces clauses and controls that 27001 simply doesn't have:

**AI-specific clauses:**
- **6.1.4** — AI system impact assessment (the technical anchor for AI Act art. 27 FRIA)
- **8.2** — AI risk treatment (extends 27001's treatment with AI-specific options)
- **8.3** — Implementation guidance for AI controls
- **9.2** — AI-specific internal audit guidance

**Annex A — 38 AI-specific controls organized in 6 themes:**
- **A.5** — Policies related to AI
- **A.6** — Internal organization (lifecycle, roles)
- **A.7** — Resources (data, tooling, computational)
- **A.8** — Impact on individuals and society
- **A.9** — Information for parties (transparency)
- **A.10** — Use of AI by third parties (supply chain)

None of those map cleanly to ISO 27001 Annex A. They're new.

### What ISO 27090 adds — the cybersecurity depth

[ISO/IEC 27090 (FDIS)](https://www.iso.org/standard/56581.html) — published 2025 — is the **AI-specific cybersecurity** depth standard. Its threat taxonomy maps directly to **AI Act art. 15(5) Recital 76**:

| AI Act named threat | ISO 27090 coverage |
|---|---|
| Data poisoning | § 6 + Annex on training-time attacks |
| Model poisoning (backdoors, trojans) | § 6 |
| Model evasion (adversarial inputs) | § 7 |
| Confidentiality attacks (membership inference, model extraction) | § 8 |
| Model flaws | § 9 |
| GenAI-specific: prompt injection (direct + indirect), jailbreak, system-prompt extraction, training-data memorisation, output watermarking | Dedicated GenAI annex |

Most generic AI security advice today is from ISO 27001 + bolted-on heuristics. 27090 is the first **standardized, citable** AI threat taxonomy. The AI Act's art. 15 implicitly requires alignment with this depth — even before EN ISO/IEC 27090 lands in OJEU as a harmonised standard under [CEN-CENELEC JTC 21 mandate M/593](https://www.cencenelec.eu/areas-of-work/cen-cenelec-topics/artificial-intelligence/).

### Why this matters in practice

Your notified body (for high-risk AI under Annex VII path, art. 43) is not going to accept ISO 27001 as evidence that you've addressed art. 9 (RMS) or art. 15 (cybersecurity). They'll ask for ISO 42001 + ISO 27090 alignment. CEN-CENELEC is on a path to publish EN ISO/IEC 42001 / 23894 / 27090 as **harmonised standards** under M/593, which would confer art. 40 presumption of conformity.

Pretending 27001 + Annex SL is enough is a recipe for re-doing the work.

---

## Part 2 — The mapping nobody had built

So I built it.

For each obligation in the AI Act, I traced it to:
- The exact article + paragraph + sub-paragraph (e.g., `art. 9(2)(a)`, not "the risk part")
- The primary ISO/IEC 42001 clause (e.g., `cl. 6.1.2`)
- The relevant Annex A control(s) (e.g., `A.6.1.2`)
- The companion standard for depth (e.g., `ISO/IEC 23894:2023` for risk management)
- Where applicable, the ISO 27090 mitigation (e.g., for art. 15 cybersecurity)

Example output:

> **AI Act art. 9 (Risk Management System)** → ISO/IEC 42001 cl. 6.1.2, 6.1.3, 8.2, 8.3 + Annex A.2.2, A.6.1.2 + ISO/IEC 23894:2023 (the depth standard).

Multiplied by every obligation, every provider/deployer flip, every Annex III sub-domain, every GPAI obligation, every transparency trigger, every incident-reporting requirement.

The skill ships with **15 reference files** covering:

1. **Risk classification** (art. 5/6/50, Annex III, the 14-signal questionnaire)
2. **High-risk obligations** (arts. 8–29, 40–49 + 5-pillar deliverables)
3. **ISO 42001 AIMS** (full clauses 4–10 + 38 Annex A controls + certification path)
4. **ISO 27090 AI security** (threat taxonomy + mitigations + GenAI annex)
5. **Master crosswalk** — the big mapping table
6. **Annex IV technical documentation template**
7. **FRIA (art. 27)** — fundamental rights impact assessment + ISO 42005 alignment
8. **Transparency (art. 50)** — disclosure UX, watermarking, C2PA
9. **Post-market monitoring + serious-incident reporting** (art. 72, 73 + the 15-day clock)
10. **GPAI obligations** (arts. 51–55) + sanctions (art. 99) + timeline (art. 113)
11. **Art. 4 AI literacy** — universal obligation, in force since **2025-02-02**
12. **Substantial modification** (art. 25) — the deployer→provider flip when fine-tuning a foundation model
13. **Regulatory sandboxes + real-world testing** (arts. 57–63)
14. **GPAI Code of Practice** (art. 56) + voluntary codes (art. 95) + right to explanation (art. 86)
15. **Multi-platform compatibility** — install + activation per agent runtime

Every file ends with an output template you can copy-paste into your compliance documentation.

---

## Part 3 — Why a skill, not an MCP server or a benchmark

This is the question I get most often, especially from compliance teams who've already evaluated [`ark-forge/mcp-eu-ai-act`](https://github.com/ark-forge/mcp-eu-ai-act) or [`compl-ai`](https://github.com/compl-ai/compl-ai) (the ETH Zurich + INSAIT + LatticeFlow benchmark framework).

**They're three different categories.** All three are needed for serious AI Act compliance work, and they're complementary — not substitutes.

| Category | Example | What it does | When to use it |
|---|---|---|---|
| **Skill** | `abk1969/ai-act-skills` (this) | Codifies the regulation. Reads like a senior compliance engineer pair-programming with you. Tells you which articles apply, which ISO controls operationalize them, what deliverables to prepare. | Structuring a compliance dossier; classifying a system; mapping obligations to controls; drafting Annex IV files. |
| **MCP server** | `ark-forge/mcp-eu-ai-act` | Active runtime tooling. Scans codebases. Detects AI framework usage across 16 frameworks (Python, JS, TS, Go, Java, Rust). Scores documents 0-100 against AI Act articles. Plugs into CI/CD. | Automating compliance checks in your build pipeline; generating auditor-ready evidence packs. |
| **Benchmark** | `compl-ai` (ETH/INSAIT/LatticeFlow) | Evaluation harness with datasets and metrics. 27 benchmarks across 6 EU AI Act principles. Tells you how a foundation model performs against measurable AI Act technical proxies. | Evaluating which foundation model (GPT-4, Llama, Claude, Gemini, Mistral) you can ship under the AI Act's technical thresholds. |

A serious AI Act compliance program likely uses **all three**:

- **Skill** to structure the dossier and identify obligations (this repo)
- **MCP server** to automate scans and lint your codebase
- **Benchmark** to evaluate any foundation models you're shipping

If your team is choosing between them, the question is wrong. Get all three.

---

## Part 4 — Why multi-platform, and why it was actually trivial

The unusual choice in this skill: it runs natively on **Claude Code, Gemini CLI, and OpenAI Codex** — same content, three runtimes.

Most agent skills lock in via host-specific tools — `Bash`, `Read`, `Edit`, `WebFetch` on Claude Code; equivalent tool names elsewhere. Once a skill calls those, porting is non-trivial: you need a tool-name translation table per runtime, you need to test that the host's tool semantics match, and the runtime's permission model needs to allow the same surface area.

This skill avoids that lock-in **by design**.

I declared in the SSL manifest (`ssl.json`, per [arXiv:2604.24026](https://arxiv.org/abs/2604.24026)):

```json
"control_flow_features": {
  "branching": true,
  "loops": false,
  "tool_calls": false,
  "touches_sensitive_resources": false
}
```

And proved it — `grep` across `SKILL.md` and the 15 reference files returns **zero matches** for `Bash|Edit|Write|Read|WebFetch`. The skill instructs the host LLM to **read its own bundled markdown** and **emit citation-grade text**. Both operations are universal across LLM runtimes.

The portability work was therefore essentially **discovery and packaging**, not engineering:

- `SKILL.md` — Claude Code uses this directly via the `Skill` tool
- `GEMINI.md` (root + skill) — Gemini CLI reads this at session start and activates via `activate_skill`
- `AGENTS.md` (root + skill) — OpenAI Codex follows the AGENTS convention
- `package.json` declares `platforms: ["claude-code", "gemini-cli", "codex"]` and per-platform install paths

That's it. Same regulatory content, three runtimes.

### Why this is non-trivial in practice

In 2026 the agent-skill ecosystem is fragmented:
- Anthropic ships skills via their format
- Vercel runs [skills.sh](https://skills.sh) — directory + leaderboard for skill packages, 18+ agents supported
- OpenAI Codex follows the AGENTS.md convention
- Gemini CLI uses `activate_skill`
- Cursor / Copilot CLI / antigravity each have their own conventions

Most repos pick one. This one picks all three primary runtimes intentionally — because the **underlying compliance expertise is the same regardless of which agent loads it**. There's no good reason to fragment the niche by runtime.

---

## How to install

### Claude Code

```bash
npx skills add abk1969/ai-act-skills@ai-act-compliance -g -y
```

Then `/reload-plugins` in Claude Code.

### Gemini CLI

```bash
git clone https://github.com/abk1969/ai-act-skills
mkdir -p ~/.gemini/skills/
cp -R ai-act-skills/skills/ai-act-compliance ~/.gemini/skills/
```

### OpenAI Codex

```bash
git clone https://github.com/abk1969/ai-act-skills
mkdir -p ~/.agents/skills/
cp -R ai-act-skills/skills/ai-act-compliance ~/.agents/skills/
```

Full activation contract per platform: [`references/15-platform-compatibility.md`](https://github.com/abk1969/ai-act-skills/blob/main/skills/ai-act-compliance/references/15-platform-compatibility.md).

The skill auto-triggers on questions like:

- "Is this AI system high-risk under the EU AI Act?"
- "What ISO 42001 control covers art. 9?"
- "Do I need a FRIA for my deployer use case?"
- "Is fine-tuning a foundation model substantial modification under art. 25?"
- "When does the GPAI systemic-risk regime kick in?"
- "How do I report a serious AI incident under art. 73?"

---

## What's next

The roadmap is public and dated: [`ROADMAP.md`](https://github.com/abk1969/ai-act-skills/blob/main/ROADMAP.md).

Major upcoming triggers:

- **v1.4.0** — A formal "Skills vs MCP servers vs benchmarks" integration matrix in the README, pointing to the complementary tooling landscape
- **v2.0.0** — When the first JTC 21 EN ISO standard (likely EN ISO/IEC 42001 or 27090) is cited in the **Official Journal of the EU** under standardization mandate M/593, surfacing the **art. 40 presumption-of-conformity ladder**
- **v2.1.0** — When the GPAI Code of Practice (art. 56) is published in operative form by the AI Office

If you spot regulatory drift before I do — a Commission delegated act lands, JTC 21 cites a standard in OJEU, ISO publishes a new standard — please open a [regulatory-drift issue](https://github.com/abk1969/ai-act-skills/issues/new?template=regulatory-drift.yml). The repository can only stay accurate with community contributions.

---

## A note on what this skill is not

This is **decision-support**, not legal advice. It will help you structure your compliance work, identify the right articles and ISO controls, and draft the right artifacts. It will not — cannot — substitute for:

- **Qualified legal counsel** for binding interpretation of the regulation
- **Notified-body conformity assessment** under the Annex VII path (art. 43) for high-risk AI systems where applicable
- **Accredited certification body** for ISO/IEC 42001 certification

The skill states this explicitly in `SKILL.md`, `README.md`, `NOTICE`, and at the end of every reference file. If you want a tool that pretends otherwise, this isn't it.

---

## Repo, license, and credit

- Repository: **[github.com/abk1969/ai-act-skills](https://github.com/abk1969/ai-act-skills)**
- License: **MIT** (the disclaimer lives in `NOTICE`, not `LICENSE`)
- Latest release: [v1.2.2](https://github.com/abk1969/ai-act-skills/releases/tag/v1.2.2)
- Skills.sh page: [skills.sh/abk1969/ai-act-skills](https://skills.sh/abk1969/ai-act-skills)
- SSL manifest: per Liang, Wang, Liang & Liu, *From Skill Text to Skill Structure* — [arXiv:2604.24026](https://arxiv.org/abs/2604.24026)
- Discussion: [Skills vs MCP servers vs benchmarks](https://github.com/abk1969/ai-act-skills/discussions/2) — happy to debate the positioning

If you're building AI Act compliance tooling, run a serious AI program in the EU, or just want to argue about ISO 42001 vs 27001 — drop a comment, open a Discussion, or send a PR. Twelve months until full application; the work won't do itself.

---

*This article was published on Dev.to / Hashnode / Medium on 2026-05-12. The opinions are mine. Decision-support only — not legal advice. The EU AI Act (Regulation 2024/1689) entered into force 2024-08-01. Article 5 prohibitions apply since 2025-02-02. Full application of high-risk obligations: 2026-08-02. Annex I product-safety pathway: 2027-08-02.*
