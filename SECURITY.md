# Security policy

## Resource profile

This repository ships a **decision-support agent skill**. The skill
declares (in [`skills/ai-act-compliance/ssl.json`](./skills/ai-act-compliance/ssl.json)):

| Property | Value |
|---|---|
| `permission` | `filesystem.read` (own reference files only) |
| `touches_sensitive_resources` | `false` |
| `control_flow_features.tool_calls` | `false` |
| Network access | **none** |
| Credentials access | **none** |
| Code execution | **none** |
| External tool calls | **none** |

Verification:

```bash
# Manifest declares no tool calls
jq '.scheduling.control_flow_features' skills/ai-act-compliance/ssl.json

# Skill body confirms — zero tool invocations
grep -nE "Bash\(|Edit\(|Write\(|Read\(|WebFetch\(" \
  skills/ai-act-compliance/SKILL.md \
  skills/ai-act-compliance/references/*.md
# → no matches
```

The skill's only side effect is **reading its own bundled reference
files** to inform its textual output. It cannot write, network, exec,
or call host tools. This makes it a low-risk addition to any agent
runtime.

## Supported versions

We provide security updates for the latest minor release.

| Version | Supported |
|---|---|
| 1.2.x   | ✅ |
| 1.1.x   | ⚠️ critical-only |
| 1.0.x   | ❌ |

## Reporting a vulnerability

If you find a security issue, **please do not open a public issue**.
Use one of:

1. [GitHub private vulnerability reporting](https://github.com/abk1969/ai-act-skills/security/advisories/new)
2. Email the maintainer (see commit history for the address)

We will:

- Acknowledge receipt within **72 hours**
- Triage and confirm the issue within **7 days**
- Ship a fix within **30 days** for high/critical issues; **90 days**
  for medium

## Threat model

**In scope** for this repo's security policy:

- Prompt injection attacks via crafted `description` or reference-file
  content that could mislead a host LLM into bypassing the skill's
  scope (e.g., emitting non-AI-Act content, ignoring the legal
  disclaimer, leaking system prompts)
- Supply-chain attacks: tampered `ssl.json`, malicious commits to
  reference files, typosquatted forks impersonating this repo
- Citation-tampering: deliberately wrong article numbers, ISO clause
  references, or sanction figures that could lead a deployer to
  misclassify their AI system
- Discovery-file abuse: malicious `AGENTS.md` / `GEMINI.md` content
  that misroutes a host runtime

**Out of scope** for this repo:

- Vulnerabilities in the host agent runtime (Claude Code, Gemini CLI,
  OpenAI Codex) — report to the respective vendors
- Vulnerabilities in third-party tools the user combines this skill
  with (MCP servers, benchmark frameworks, document generators)
- Issues with the user's own AI system — this skill is decision-support
  for their compliance work, not a runtime safeguard
- Misinterpretation of the AI Act when the cited articles and clauses
  are accurate (consult qualified counsel — that's expressly outside
  the scope of decision-support)

## Snyk × Vercel agent-skill ecosystem

This skill is published to [skills.sh](https://skills.sh/abk1969/ai-act-skills)
and benefits from the
[Snyk × Vercel agent-skill ecosystem security work](https://snyk.io/blog/snyk-vercel-securing-agent-skill-ecosystem/).
The skill's minimal resource profile (no network, no credentials, no
tool calls) is designed to clear those reviews trivially.

## Related

- [`AGENTS.md`](./AGENTS.md) — Codex / OpenAI / AGENTS-aware activation contract
- [`GEMINI.md`](./GEMINI.md) — Gemini CLI activation contract
- [`skills/ai-act-compliance/references/15-platform-compatibility.md`](./skills/ai-act-compliance/references/15-platform-compatibility.md)
  — full multi-platform reference
- [`CONTRIBUTING.md`](./CONTRIBUTING.md) — contribution conventions
