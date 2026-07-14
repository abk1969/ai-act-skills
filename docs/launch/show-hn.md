# Show HN — Hacker News submission

**Best window** : Tuesday or Wednesday, 8-9am ET (= 14-15h Paris).

**Title** must start with "Show HN:" (HN convention).

**No marketing fluff** — HN audience punishes hype.

**Engage on technical questions only** — don't get baited by AI hype critiques.

**Post-launch** : if it climbs the front page, prepare for a traffic spike on the repo. Discussions tab might get questions you haven't anticipated.

---

## Submission URL
https://news.ycombinator.com/submit

## Title
```
Show HN: Multi-platform agent skill for EU AI Act compliance (Claude/Gemini/Codex)
```

## URL
```
https://github.com/abk1969/ai-act-skills
```

## Body (the "text" field — optional but recommended for Show HN)

```
Hi HN —

I spent 6 weeks codifying EU AI Act (Regulation 2024/1689) compliance
into an agent skill that runs natively on Claude Code, Gemini CLI, and
OpenAI Codex. Same regulatory content, three runtimes, zero tool-call
lock-in.

What it does: maps every obligation to its exact article + ISO clause +
Annex A control (e.g., "art. 9(2)(a)" → "ISO/IEC 42001 cl. 6.1.2 +
A.6.1.2"). 15 reference files covering risk classification (art.
5/6/50), FRIA (art. 27), Annex IV technical documentation, post-market
monitoring (art. 72-73), GPAI (art. 51-55), regulatory sandboxes (art.
57-63), AI literacy (art. 4 — already in force since Feb 2, 2025).

The unusual choice: it's anchored on ISO/IEC 42001:2023 (AIMS) and
27090 (FDIS, AI cybersecurity), not ISO 27001 (the generic ISMS most
compliance work defaults to). 27001 is a useful baseline but it
doesn't cover AI-specific clauses (cl. 6.1.4 impact assessment) or
Annex A controls (A.5–A.10) that 42001 introduces.

Why multi-platform was non-trivial: most agent skills lock in via
host-specific tools (Bash/Read/Edit on Claude; equivalents elsewhere).
I declared `tool_calls: false` in the SSL manifest (per
arXiv:2604.24026) and proved it with grep — zero matches across
SKILL.md and the 15 references. The skill just instructs the host LLM
to read its own bundled markdown and emit citation-grade text.
Universal across LLM runtimes.

Limitations (worth being upfront): it's decision-support, not legal
advice. It won't replace qualified counsel or a notified body for
high-risk AI conformity assessment. It also doesn't scan code (that's
MCP server territory — see ark-forge/mcp-eu-ai-act) or evaluate models
(compl-ai from ETH Zurich + LatticeFlow does that). It's the missing
third piece — the expertise codification layer.

EU AI Act full application is Aug 2, 2026 (penalties: €35M or 7% global
revenue). Sharing in case it's useful.

Repo: https://github.com/abk1969/ai-act-skills
Install: `npx skills add abk1969/ai-act-skills@ai-act-compliance`
Skills.sh: https://skills.sh/abk1969/ai-act-skills
SSL manifest: arXiv:2604.24026

Happy to answer questions on the design choices.
```

## Anticipated questions + canned answers

### "Why not just use ChatGPT / Claude with a long prompt?"

> Long prompts work for one-off questions but degrade fast: prompts get
> lost, trigger conditions become ambiguous, and you can't audit what
> your LLM actually used to answer a compliance question. A skill is
> versionable, citation-grade (every claim ties to an article + clause),
> auditable via the SSL manifest, and ships with deliverable templates.
> If you're shipping AI in the EU, you'll want the audit trail.

### "Decision-support without legal advice — what's the value?"

> Same value as a senior compliance engineer who's spent 6 months
> reading the regulation: they help you structure the work, identify
> what applies, and produce the right artifacts. They don't sign off on
> your conformity — that's qualified counsel + (for high-risk under
> Annex VII path) a notified body. The skill scopes itself
> deliberately. Final conformity assessment under art. 43 was never
> going to come from an LLM.

### "Why ISO 42001 over ISO 27001?"

> ISO 27001 is the generic ISMS — useful baseline, doesn't cover AI
> specifics. ISO 42001:2023 introduces AI-specific clauses (e.g., cl.
> 6.1.4 AI system impact assessment) and Annex A controls (A.5–A.10)
> that 27001 simply doesn't have. CEN-CENELEC JTC 21 is on the path to
> publish EN ISO/IEC 42001 as a harmonised standard under M/593, which
> would confer art. 40 presumption of conformity. Pretending 27001 is
> enough is a recipe for rework.

### "What about NIST AI RMF?"

> NIST AI RMF is the US framework. Useful as a comparator, not the EU
> AI Act anchor. The skill's frontmatter explicitly says "Do NOT use
> for non-EU AI regulations (NIST AI RMF for US)". Different jurisdiction,
> different framework.

### "How does this differ from compl-ai / ark-forge?"

> Three categories: skill (codifies regulation, this), MCP server
> (automates scans, ark-forge/mcp-eu-ai-act), benchmark (evaluates
> models, compl-ai from ETH Zurich + LatticeFlow + INSAIT). They're
> complementary. A serious AI Act program uses all three. See
> Discussion #2 in the repo for the full breakdown.

### "Source-grounded? How do we know the article numbers are right?"

> Every reference file cites the article + paragraph + sub-paragraph
> verbatim. The crosswalk in references/05-crosswalk-aiact-iso.md is
> the master mapping. Authoritative sources are linked in llms.txt and
> CONTRIBUTING.md. If you find an error, please open a regulatory-drift
> or bug issue — the templates capture exactly what's needed for a fix
> PR.

### "What happens when the AI Act amends?"

> The roadmap (ROADMAP.md) tracks watched events: Commission delegated
> acts under art. 7, JTC 21 OJEU citations, ISO publications, GPAI Code
> of Practice updates. SemVer: major bumps for AI Act amendments,
> minor for new ISO publications, patch for editorial. v2.0.0 lands
> when the first JTC 21 EN ISO is cited in OJEU.
```
