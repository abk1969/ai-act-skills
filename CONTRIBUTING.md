# Contributing to ai-act-skills

Thanks for your interest in improving this skill. The EU AI Act is a
moving target — Commission delegated acts, JTC 21 OJEU citations, ISO
publications, GPAI Code of Practice updates, and serious-incident
guidance evolve constantly. **This repository can only stay accurate
with community contributions.**

## What kinds of contributions are most valuable

We particularly welcome PRs in these areas:

### 🚨 Regulatory drift (highest priority)

- A Commission delegated or implementing act lands (e.g., under art. 7,
  art. 11(3), art. 27(5), art. 41, art. 51(3), art. 56, art. 71(4),
  art. 72(3), art. 73(7))
- A JTC 21 (CEN-CENELEC) standard is cited in OJEU under standardization
  mandate M/593 (triggers art. 40 presumption-of-conformity update)
- ISO publishes a new AI standard (e.g., ISO 24029-3, future ISO 42007)
- The GPAI Code of Practice (art. 56) is published in its operative
  version
- Member State sandbox regulations are published

For these, please open an issue using the
[**Regulatory drift**](.github/ISSUE_TEMPLATE/regulatory-drift.yml)
template before opening a PR.

### 📚 Reference improvements

- Tightening citations (article + paragraph + sub-paragraph; ISO clause
  + control number)
- Adding edge-case guidance grounded in source documents
- Improving the crosswalk in `references/05-crosswalk-aiact-iso.md`
- Filling a coverage gap in any of the 15 reference files

### 🌐 Multi-platform discoverability

- Adding/refining `AGENTS.md`, `GEMINI.md`, or future
  per-runtime discovery files
- Adding tool-name mappings if new runtimes require them (none required
  today — see `references/15-platform-compatibility.md`)
- Documenting deployment on additional runtimes (Copilot CLI, Cursor,
  etc.) — open an issue first

### 🧪 SSL manifest

`ssl.json` validates against the rules from
[Liang et al., arXiv:2604.24026](https://arxiv.org/abs/2604.24026).
Improvements welcome:

- Tighter `intent_signature` samples
- Better `act_type` / `resource_scope` tagging in logic steps
- Schema-level validation tooling (e.g., a JSON Schema for SSL-1.0)

## What we don't accept

- **Legal advice posing as guidance.** This skill is decision-support.
  Wording that suggests definitive legal interpretation or substitutes
  for qualified counsel will be rejected.
- **Cross-regime conflation.** GDPR is a separate regime — it
  intersects with the AI Act (art. 10 data, art. 26(8) DPIA
  coordination, art. 86 right-to-explanation vs GDPR art. 22) but is
  not the AI Act.
- **NIST AI RMF as primary anchor.** Useful as comparative reference,
  but the AI Act is anchored on EU instruments: Regulation 2024/1689 +
  ISO 42001/27090 + JTC 21 EN ISO standards. Don't replace EU anchors
  with US frameworks.
- **Anchoring on ISO 27001 as the AI-specific framework.** ISO 27001 is
  the org-level ISMS baseline; it does NOT cover AI-specific clauses
  (cl. 6.1.4 impact assessment) or Annex A controls (A.5–A.10) that
  ISO 42001 introduces. The
  [skill's first anti-pattern](skills/ai-act-compliance/SKILL.md#anti-patterns-to-avoid)
  documents this explicitly.

## How to contribute

### 1. Fork and clone

```bash
git clone https://github.com/<your-username>/ai-act-skills
cd ai-act-skills
```

### 2. Create a feature branch

```bash
git checkout -b drift/art-11-implementing-act-2026-q4
# or
git checkout -b ref/05-crosswalk-iso-42005-mapping
# or
git checkout -b fix/typo-art-9-citation
```

Branch naming convention:

| Prefix | Use |
|---|---|
| `drift/` | New Commission act / OJEU citation / ISO publication |
| `ref/` | Improvement to a reference file or the crosswalk |
| `ssl/` | Changes to `ssl.json` |
| `platform/` | Multi-platform / discovery file changes |
| `doc/` | README / CHANGELOG / docs |
| `fix/` | Bug or typo |

### 3. Write the change

Follow the conventions from the
[skill README](skills/ai-act-compliance/README.md):

- **Cite article numbers explicitly**: `art. 9(2)(a)` — not "the risk
  part"
- **Cite ISO clauses + Annex A controls**: `cl. 6.1.4`, `A.5.4`
- **Distinguish provider vs deployer**: prefix with `[Provider]`,
  `[Deployer]`, or `[Both]` in obligation lists
- **Flag deadlines in bold**: `**2026-08-02 full application**`
- **Append the legal disclaimer** at the end of every reference file
- **Anchor on ISO 42001 + 27090** — never ISO 27001 as the AI-specific
  framework

### 4. Verify

For SSL manifest changes:

```bash
# Validate JSON
jq . skills/ai-act-compliance/ssl.json > /dev/null

# Validate against paper Pass-4 rules — no orphan steps, valid
# transitions, valid containment
# (See references/15-platform-compatibility.md for the verification
# checklist.)
```

For SKILL.md changes, confirm the frontmatter is still under the
1024-char spec limit:

```bash
awk '/^---$/{c++; next} c==1' skills/ai-act-compliance/SKILL.md | wc -c
# Should be < 1024
```

For citation accuracy, verify against:

- The official EUR-Lex text:
  <https://eur-lex.europa.eu/eli/reg/2024/1689/oj>
- The ISO 42001:2023 standard (paid)
- The ISO 27090:2025 standard (paid)
- JTC 21 work programme:
  <https://www.cencenelec.eu/areas-of-work/cen-cenelec-topics/artificial-intelligence/>

### 5. Commit

Commit messages follow the same prefix convention:

```
drift: art. 11(3) implementing act on technical documentation
templates lands (Commission decision 2026/Cxxx)

ref: tighten ISO 27090 § 8.4 mapping in 05-crosswalk for adversarial
robustness controls

ssl: add intent_signature sample for art. 86 right-to-explanation

platform: add Cursor support to references/15-platform-compatibility.md
```

End every commit message with:

```
Co-Authored-By: <Your Name> <your.email@example.com>
```

### 6. Open a PR

Reference the relevant article, clause, or release in the PR
description. If your change requires a CHANGELOG entry, include it in
the PR.

### 7. Review process

PRs are reviewed against four criteria:

1. **Citation accuracy** — every claim cites the exact article, clause,
   or control
2. **No legal advice creep** — wording stays in decision-support
   territory
3. **Standards alignment** — anchored on AI Act + ISO 42001 + ISO 27090
   (+ companions)
4. **Scope** — fits the skill's invocation contract (don't expand into
   GDPR, NIST AI RMF, or non-EU regimes)

Review SLA: best-effort within 7 days. For regulatory drift PRs (a
Commission act has just landed), please ping by opening a GitHub
[Discussion](https://github.com/abk1969/ai-act-skills/discussions) so
the urgency is visible.

## Versioning

This repository follows [SemVer](https://semver.org):

| Bump | Triggers |
|---|---|
| **Major** | AI Act amendment (delegated act under art. 7); breaking change to SSL schema; breaking change to skill frontmatter contract |
| **Minor** | New ISO standard publication; JTC 21 OJEU citation; new reference file; new platform support |
| **Patch** | Editorial corrections; structural improvements; non-substantive citation tightening |

See [`CHANGELOG.md`](CHANGELOG.md) for the full release history. Track
the [`ROADMAP.md`](ROADMAP.md) for what's coming next.

## Code of conduct

Be precise. Be civil. Cite your sources. Disagree on facts, not on
people. We're trying to make AI Act compliance work less painful for
everyone — that's the only goal.

## Legal notice

This repository is **decision-support only**, not legal advice. By
contributing, you agree that your contributions are licensed under the
[MIT License](LICENSE) and that they do not constitute legal advice.

## Maintainers

- [@abk1969](https://github.com/abk1969) — primary maintainer

If the project grows beyond what one maintainer can review, we'll add
contributors here. If you're interested in a co-maintainer role, open a
Discussion.
