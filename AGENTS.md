# AGENTS.md — ai-act-skills

> Pointer file for **AGENTS-aware** runtimes (OpenAI Codex, GitHub
> Copilot CLI, Cursor, and any harness that follows the
> [agentskills.io specification](https://agentskills.io/specification)).

## Skill provided by this repository

| Skill ID | Entry | Manifest | Reference |
|---|---|---|---|
| `ai-act-compliance` | [`skills/ai-act-compliance/SKILL.md`](./skills/ai-act-compliance/SKILL.md) | [`skills/ai-act-compliance/ssl.json`](./skills/ai-act-compliance/ssl.json) (SSL-1.0, arXiv:2604.24026) | [`skills/ai-act-compliance/`](./skills/ai-act-compliance/) |

**Description** — Authoritative EU AI Act (Regulation 2024/1689)
compliance skill, strictly anchored on **ISO/IEC 42001:2023** (AIMS)
and **ISO/IEC 27090 (FDIS)** (AI cybersecurity).

**Triggers** — Risk classification (art. 5/6/50), conformity assessment
(arts. 8–17, 26–27), Annex IV technical documentation, FRIA (art. 27),
AI literacy (art. 4), substantial modification (art. 25), regulatory
sandboxes (arts. 57–63), GPAI (arts. 51–55), serious-incident reporting
(art. 73), ISO 42001 / 27090 mapping.

**Resource profile** — `permission: filesystem.read` only. **No**
network, **no** credentials, **no** code execution, **no** external
tool calls. `touches_sensitive_resources: false`.

## Recommended install location

Per the `superpowers:writing-skills` convention (Anthropic):

```
~/.agents/skills/ai-act-compliance/      # Codex / AGENTS-aware
~/.claude/skills/ai-act-compliance/      # Claude Code
~/.gemini/skills/ai-act-compliance/      # Gemini CLI
```

## How a Codex / AGENTS-aware host should activate the skill

1. **Discovery** — read this `AGENTS.md` at the project root; identify
   the skill entry at `skills/ai-act-compliance/SKILL.md`.
2. **Frontmatter parse** — read the YAML frontmatter; the
   `description` field is the canonical trigger source.
3. **Activation** — when a user message matches the description's
   triggers (see also `ssl.json` `intent_signature` for 14 sample
   queries), load `SKILL.md` and follow its scene graph
   (`S_PREPARE_SCOPE → S_ACQUIRE_FACTS → S_REASON_TIER →
   S_ACT_OBLIGATIONS → S_VERIFY_ARTIFACTS → S_FINALIZE_REPORT`, with
   `S_RECOVER_INCIDENT` parallel route).
4. **Reference reading** — when a scene cites
   `references/NN-<topic>.md`, read that file. The 15 reference files
   are the depth content.

## Tool-name mapping

This skill **does not invoke runtime tools**. The SKILL.md and
references mandate only **textual reasoning + reading the skill's own
files**. No translation table is required between Claude Code's
`Bash`/`Read`/`Edit` and Codex / Copilot / Cursor equivalents — the
skill is tool-agnostic.

If a downstream consumer wants the skill's output to be automatically
serialized to `.docx` / `.pdf` / `.xlsx`, that delegation is handled by
companion skills (e.g., `example-skills:docx`) outside this repository.

## Versioning & contributing

- Current skill version: **2.0.0** (see
  [`CHANGELOG.md`](./CHANGELOG.md))
- Repository: <https://github.com/abk1969/ai-act-skills>
- Issues: <https://github.com/abk1969/ai-act-skills/issues>
- License: MIT

If your AGENTS-aware runtime activates this skill differently from the
above contract, please open a PR adding a row to the platform support
matrix in
[`skills/ai-act-compliance/references/15-platform-compatibility.md`](./skills/ai-act-compliance/references/15-platform-compatibility.md).

## Legal notice

This skill is **decision-support only**, not legal advice. Final
EU AI Act conformity assessment requires qualified counsel and, for
most high-risk systems, a notified body.
