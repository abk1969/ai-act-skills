# GEMINI.md — ai-act-skills

> Activation pointer for **Gemini CLI**. Gemini reads this file at
> session start and uses it to decide which agent skills are available
> in the current working directory.

## Skill exposed to Gemini CLI

| Skill ID | Entry | Activation tool | Manifest |
|---|---|---|---|
| `ai-act-compliance` | [`skills/ai-act-compliance/SKILL.md`](./skills/ai-act-compliance/SKILL.md) | `activate_skill` | [`skills/ai-act-compliance/ssl.json`](./skills/ai-act-compliance/ssl.json) (SSL-1.0, arXiv:2604.24026) |

**Description** — EU AI Act (Regulation 2024/1689) compliance skill —
risk classification, conformity assessment, Annex IV documentation,
FRIA, AI literacy (art. 4), substantial modification (art. 25),
regulatory sandboxes (arts. 57–63), GPAI (arts. 51–55), serious-
incident reporting (art. 73), ISO/IEC 42001:2023 (AIMS) and
ISO/IEC 27090 (FDIS) (AI cybersecurity) mapping.

## Activation contract

Gemini CLI should:

1. Load this `GEMINI.md` at session start (default behaviour).
2. Surface `ai-act-compliance` as available. The skill metadata is in
   the `SKILL.md` YAML frontmatter; the canonical trigger source is the
   `description` field.
3. When the user's message matches one of the intent signatures (full
   list in `skills/ai-act-compliance/ssl.json`
   `intent_signature`), call `activate_skill` with
   `skill_id: "ai-act-compliance"`.
4. Follow the skill's typed scene graph
   (`S_PREPARE_SCOPE → S_ACQUIRE_FACTS → S_REASON_TIER →
   S_ACT_OBLIGATIONS → S_VERIFY_ARTIFACTS → S_FINALIZE_REPORT`, with
   `S_RECOVER_INCIDENT` as a parallel branch when the user reports a
   serious incident under art. 3(49)).

## Tool-name compatibility

Skills built for Claude Code typically use Claude-specific tool names
(`Bash`, `Read`, `Edit`, `Glob`, `Grep`, `WebFetch`). Gemini CLI ships
its own equivalent set. **This skill needs no translation** because it
declares (in `ssl.json`):

```json
"control_flow_features": {
  "branching": true,
  "loops": false,
  "tool_calls": false,
  "touches_sensitive_resources": false
}
```

The skill instructs the host model to **read its own reference files**
and **emit citation-grade text** (article, clause, control). Both
operations are universal across LLM runtimes.

## Install

```bash
# macOS / Linux
git clone https://github.com/abk1969/ai-act-skills
mkdir -p ~/.gemini/skills/
cp -R ai-act-skills/skills/ai-act-compliance ~/.gemini/skills/
```

```powershell
# Windows
git clone https://github.com/abk1969/ai-act-skills
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.gemini\skills" | Out-Null
xcopy ai-act-skills\skills\ai-act-compliance $env:USERPROFILE\.gemini\skills\ai-act-compliance /E /I
```

(Adjust the install directory to match your Gemini CLI version's
expected layout if it differs from `~/.gemini/skills/`.)

## Smoke test

After install, ask Gemini CLI:

> *"Does the EU AI Act art. 4 AI literacy obligation apply to a SaaS
> deployer in France?"*

Expected behaviour: Gemini calls `activate_skill` with
`ai-act-compliance`, walks the scene graph, and emits an answer that
cites **art. 4**, the **2025-02-02** effective date, and the relevant
ISO/IEC 42001 Annex A controls — closing with the legal disclaimer.

## Versioning

- Current skill version: **2.0.0**
- Changelog: [`CHANGELOG.md`](./CHANGELOG.md)
- Compatibility matrix:
  [`skills/ai-act-compliance/references/15-platform-compatibility.md`](./skills/ai-act-compliance/references/15-platform-compatibility.md)

## Legal notice

This skill is **decision-support only**, not legal advice. Final
EU AI Act conformity assessment requires qualified counsel and, for
most high-risk systems, a notified body.
