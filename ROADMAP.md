# Roadmap — ai-act-skills

> Living document. Last updated: 2026-05-09.

This roadmap is **public and dated** so that downstream users can plan.
The AI Act regulatory environment is in active development through
2027 — this skill tracks it.

## Versioning legend

- **Major** — AI Act amendment via delegated act (art. 7), breaking
  schema change
- **Minor** — New ISO publication, JTC 21 OJEU citation, new reference,
  new platform support
- **Patch** — Editorial / non-substantive

## Released

### v1.2.0 — 2026-05-08 ✅ — Multi-platform

- Native support for **Claude Code + Gemini CLI + OpenAI Codex**
- 5 new files: `AGENTS.md` (root + skill), `GEMINI.md` (root + skill),
  `references/15-platform-compatibility.md`
- `package.json` declares `platforms`, `platform_files`,
  `install_paths`
- Portability proven by audit (`tool_calls: false` in `ssl.json`,
  zero matches for `Bash|Edit|Write|Read|WebFetch` across SKILL.md and
  the 15 references)

### v1.1.0 — 2026-05-07 ✅ — SSL representation + business-logic completion

- `ssl.json` machine-readable manifest per
  [arXiv:2604.24026](https://arxiv.org/abs/2604.24026)
- 7 typed SSL scenes
- 4 new reference files: art. 4 AI literacy, art. 25 substantial
  modification, art. 57–63 sandboxes & real-world testing,
  art. 56/95/86 codes & right to explanation

### v1.0.0 — 2026-04-28 ✅ — Initial release

- SKILL.md + 10 reference files
- ISO 42001 + 27090 anchoring
- MIT license

## In progress

### v1.3.0 — Target: 2026-Q3 — Discoverability + community

**Theme**: Reduce single-dev maintenance risk + expand reach.

- [ ] `ROADMAP.md` (this file) — DONE
- [ ] `CONTRIBUTING.md` — DONE
- [ ] `.github/ISSUE_TEMPLATE/` (regulatory-drift, iso-update, bug,
      feature) — DONE
- [ ] GitHub Discussions enabled + 3 seed topics — DONE
- [ ] Listed on `awesome-claude-code` (PR pending)
- [ ] Listed on `awesome-ai-governance` (PR pending)
- [ ] Listed on `awesome-eu-ai-act` (PR pending)
- [ ] Cross-posted launch on Dev.to + Hashnode + Medium
- [ ] Submitted to skills.sh marketplace as canonical entry
- [ ] LinkedIn campaign live (post phare FR + EN, then 4 supporting
      posts over 2 weeks)

## Upcoming releases

### v1.4.0 — Target: 2026-Q4 — Skills vs MCP vs benchmarks integration matrix

**Theme**: Position the skill against complementary categories.

- [ ] New top-level README section: "Skills vs MCP servers vs
      benchmarks — when to use which"
- [ ] Reference file `references/16-related-tooling.md` mapping the
      complementary tooling landscape:
  - MCP servers (`ark-forge/mcp-eu-ai-act`,
    [SonnyLabs/EU_AI_ACT_MCP](https://github.com/SonnyLabs/EU_AI_ACT_MCP),
    [desiorac/mcp-eu-ai-act](https://github.com/desiorac/mcp-eu-ai-act))
    — for runtime tooling (scans, integrations)
  - Benchmark frameworks ([compl-ai](https://github.com/compl-ai/compl-ai)
    — ETH Zurich + INSAIT + LatticeFlow AI) — for model evaluation
    against AI Act technical thresholds
  - This skill — for compliance dossier structuring + ISO anchoring
- [ ] Recommended deployment patterns (skill + MCP server + benchmark
      in concert)

### v2.0.0 — Target: when first JTC 21 EN ISO is cited in OJEU — Harmonised standards

**Triggers** (any of):

- EN ISO/IEC 42001 cited in the Official Journal of the EU under
  standardization mandate M/593
- EN ISO/IEC 27090 cited in OJEU
- EN ISO/IEC 23894 cited in OJEU

**Scope**:

- Surface the **art. 40 presumption-of-conformity ladder**
- Update `references/05-crosswalk-aiact-iso.md` to mark each citation
  with the OJEU reference
- Add a "harmonised vs informative" badge to every standard mention
- Update SSL `intent_signature` to include "Does my AI use a harmonised
  standard for art. 40 presumption?"
- Major bump because the regulatory anchoring shifts qualitatively
  (informative → presumption-conferring)

### v2.1.0 — Target: when GPAI Code of Practice (art. 56) is published in operative form

**Triggers**:

- Commission publication of the operative GPAI Code of Practice
- AI Office endorsement of specific commitments

**Scope**:

- Update `references/14-codes-and-right-to-explanation.md` § Code of
  Practice
- Add `references/14a-gpai-code-commitments.md` if the Code's
  structure warrants its own file
- Update obligations matrix in `references/02-high-risk-obligations.md`
  for GPAI providers using the Code as conformity evidence

## Watching (no fixed date)

These are tracked but not yet scheduled. They depend on external
regulatory or standardization events:

| Item | Trigger | Estimated impact |
|---|---|---|
| Commission delegated act under art. 7 (Annex III amendment) | Commission decision in OJ | Major bump — re-classify Annex III high-risk domains |
| Commission implementing act under art. 11(3) (techdoc template for SMEs) | Commission decision | Minor — update `references/06-techdoc-annex-iv.md` |
| Commission implementing act under art. 27(5) (FRIA template) | Commission decision | Minor — update `references/07-fria-art27.md` |
| Commission implementing act under art. 73(7) (incident reporting forms) | Commission decision | Minor — update `references/09-post-market-art72-73.md` |
| ISO 24029-3 publication | ISO publication | Patch — add to standards tracked |
| ISO 42007 publication (AI assurance) | ISO publication | Minor — likely new reference file |
| EU Article 27 FRIA template harmonisation across Member States | Commission + AI Office | Minor — refine FRIA reference |
| Member State sandbox regulations published | National OJ | Patch — add jurisdictional notes |
| Right-to-explanation art. 86 case law (CJEU) | CJEU judgment | Patch to major depending on scope |

## Out of scope (firmly)

Things this skill will **never** cover:

- **GDPR-only questions** — the privacy regime is separate. Use a
  dedicated GDPR skill.
- **Generic ISO 27001 ISMS work** — use the `iso27001` skill. We
  intentionally don't expand into the org-level ISMS.
- **NIST AI RMF (US)** — US framework. We may add comparative
  references for global organisations but not as primary anchor.
- **UK AI policy / China generative-AI rules / Japan AI governance** —
  out of scope. EU AI Act only.
- **Legal advice** — decision-support only. Always.
- **Auto-execution / scanning / agentic audits** — that's MCP server
  territory. We complement, we don't compete.
- **Model evaluation / benchmarking** — that's `compl-ai` territory.
  We'll cross-reference, not duplicate.

## How to influence this roadmap

- Open a [Discussion](https://github.com/abk1969/ai-act-skills/discussions)
  for proposals
- Open a regulatory-drift issue when an external event lands (use the
  [template](.github/ISSUE_TEMPLATE/regulatory-drift.yml))
- Submit a PR — see [`CONTRIBUTING.md`](CONTRIBUTING.md)

## Legal notice

This roadmap is forward-looking and non-binding. Items may shift, be
cancelled, or be reordered without notice. Decision-support only — not
legal advice.
