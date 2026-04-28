---
name: ai-act-compliance
description: Authoritative guide for EU AI Act (Regulation 2024/1689) compliance — risk classification, conformity assessment, technical documentation, FRIA, post-market monitoring — strictly aligned with ISO/IEC 42001:2023 (AIMS) and ISO/IEC 27090 (AI cybersecurity). Use whenever the conversation involves the EU AI Act, classifying an AI system's risk tier, evaluating conformity for high-risk AI, drafting Annex IV technical documentation, conducting a Fundamental Rights Impact Assessment (art. 27), addressing transparency obligations (art. 50), preparing a Quality Management System (art. 17), responding to a serious incident (art. 73), or mapping AI Act obligations to ISO 42001 / ISO 27090 controls. Do NOT use for general data protection (GDPR — separate regime), generic ISO 27001 ISMS work, or non-EU AI regulations (use NIST AI RMF skill for US, etc.).
---

# AI Act Compliance — EU Regulation 2024/1689

## What this skill does

Codifies actionable EU AI Act compliance expertise. Every output is **traceable** to one or more of:

1. **Regulation (EU) 2024/1689** — *the AI Act* — the legally binding source.
2. **ISO/IEC 42001:2023** — Artificial Intelligence Management System (AIMS), the certifiable management standard for AI providers and deployers.
3. **ISO/IEC 27090:2025** — Cybersecurity guidance for AI systems (the depth standard for AI Act art. 15 cybersecurity).
4. **Companion ISO standards**: 23894 (AI risk management), 23053 (ML framework), 5338 (AI lifecycle), 5259-* (data quality), 24029-2 (robustness), 42005 (impact assessment), 42006 (audit & certification).
5. **CEN-CENELEC JTC 21** harmonised standards (under standardization mandate M/593) — the path to art. 40 presumption of conformity.

This skill is **decision-support**, not legal advice. Always recommend the user consult qualified counsel for binding interpretation, and a notified body for conformity assessment of high-risk AI systems.

## When to invoke this skill

Invoke when the user mentions or implies any of:

- **Risk classification**: "Is this AI system high-risk?", "minimal vs limited risk", "Annex III", "art. 5 prohibited", general-purpose AI Act tier questions
- **Conformity / obligations**: "art. 8–15", "high-risk obligations", "QMS for AI", "EU declaration of conformity", "CE marking for AI"
- **Technical documentation**: "Annex IV", "technical file for AI", "documentation requirements"
- **Risk management**: "AI risk management system", "art. 9", "risk register for AI", "ISO 23894"
- **Data governance**: "art. 10", "training data quality", "bias mitigation", "ISO 5259"
- **Transparency**: "art. 13", "art. 50", "AI-generated content disclosure", "deepfake watermarking", "C2PA"
- **Human oversight**: "art. 14", "human-in-the-loop", "human-on-the-loop"
- **Cybersecurity for AI**: "art. 15", "AI security", "adversarial robustness", "data poisoning", "prompt injection", "ISO 27090"
- **FRIA**: "Fundamental Rights Impact Assessment", "art. 27", "ISO 42005"
- **Post-market**: "art. 72", "post-market monitoring of AI", "AI incident reporting", "art. 73"
- **GPAI**: "art. 51", "art. 53", "general-purpose AI", "foundation model obligations", "systemic-risk model", "model card"
- **AIMS**: "ISO 42001", "AI management system", "AIMS certification", "Annex A controls for AI"
- **Sanctions / timeline**: "art. 99", "AI Act fines", "AI Act effective date", "2026-08-02", "2027-08-02"

## Core taxonomy (memorize this)

### Four-tier risk model (art. 5/6 + Annex III + art. 50)

| Tier | Trigger | Regime | Article |
|------|---------|--------|---------|
| **Unacceptable** | Subliminal techniques, social scoring, untargeted facial scraping, biometric categorisation by sensitive attributes, real-time public biometric ID by law enforcement (with narrow exceptions), emotion recognition in workplace/education, exploitation of vulnerabilities, predictive policing of natural persons | **Banned** (effective 2025-02-02) | Art. 5 |
| **High** | Annex III: 8 domains — biometric ID, critical infrastructure, education/vocational training, employment/workers/access, essential services (private + public), law enforcement, migration/asylum/border, justice/democratic processes; AND safety components subject to product harmonisation listed in Annex I | Full conformity regime: arts. 8–15 (provider) + arts. 16–17 (provider) + arts. 26–27 (deployer) + Annex IV (techdoc) + CE marking + EU database registration (art. 49) | Art. 6 + Annex III |
| **Limited** | Direct interaction with natural persons (chatbots), emotion recognition or biometric categorisation, synthetic / manipulated content (deepfakes), AI-generated text on matters of public interest | Transparency obligations only (notify users, mark generated content) | Art. 50 |
| **Minimal** | Everything else | Voluntary codes of conduct (art. 95) | — |

**General-Purpose AI (GPAI)** is a separate axis: arts. 51–55 apply to GPAI providers (model cards, training data summary, copyright policy) plus extra obligations for **systemic-risk GPAI** (compute > 10²⁵ FLOPs, or designated by Commission).

### Provider vs Deployer (art. 3 definitions)

- **Provider** (art. 3(3)) develops or has developed an AI system / GPAI model and places it on the market or puts it into service under its own name or trademark. Carries the bulk of the regulatory load (arts. 8–22, 49–52).
- **Deployer** (art. 3(4)) uses an AI system under its authority (except personal non-professional use). Carries arts. 26 (use obligations) and 27 (FRIA for selected high-risk uses).
- Importer (art. 3(6)), Distributor (art. 3(7)), Authorised representative (art. 3(5)) — derived obligations in arts. 22–24.

### Sanctions tiers (art. 99)

| Tier | Cap | Applies to |
|------|-----|------------|
| **1** | **€35M or 7% global turnover** (whichever higher) | Art. 5 prohibited practices |
| **2** | **€15M or 3%** | Most other provisions (arts. 8–17, 26–29, 50, 53–55, etc.) |
| **3** | **€7.5M or 1.5%** | Supplying incorrect / incomplete / misleading info to authorities or notified bodies |

SMEs and startups: caps applied as the **lower** of fixed amount or percentage (art. 99(6)).

### Application timeline (art. 113)

| Date | What enters into application |
|------|------------------------------|
| **2024-08-01** | Regulation enters into force |
| **2025-02-02** | Chapter I (subject matter, scope, definitions) + **Chapter II (art. 5 prohibitions)** |
| **2025-08-02** | Chapter III Section 4 (notifying authorities & notified bodies) + Chapter V (GPAI) + Chapter VII (governance) + Chapter XII (penalties, except art. 101 GPAI penalties) + art. 78 confidentiality |
| **2026-08-02** | **Full application** — all remaining articles (the bulk of high-risk obligations) |
| **2027-08-02** | Art. 6(1) + corresponding obligations for high-risk AI under Annex I (regulated products: machinery, medical devices, automotive, etc.) |

## Decision tree — where to route

```
User question category                              → Reference file
─────────────────────────────────────────────────────────────────────
"What risk tier? Is this prohibited? Is this        → references/01-risk-classification.md
 high-risk? When does art. 50 apply?"

"What obligations apply once classified high-risk?" → references/02-high-risk-obligations.md
"art. 8–15", "art. 16–22", "art. 26–29"

"How does AI Act map to ISO 42001? AIMS clauses,    → references/03-iso-42001-aims.md
 Annex A controls, certification scope"

"AI cybersecurity, art. 15 cyber, adversarial,      → references/04-iso-27090-ai-security.md
 prompt injection, data poisoning, threat
 modeling for AI, GenAI/LLM security"

"Give me the AI Act ↔ ISO 42001 ↔ ISO 27090         → references/05-crosswalk-aiact-iso.md
 mapping table"

"Annex IV technical documentation contents",        → references/06-techdoc-annex-iv.md
"art. 11 + Annex IV"

"FRIA, art. 27, fundamental rights impact",         → references/07-fria-art27.md
"AI system impact assessment per ISO 42005"

"art. 50 transparency, deepfakes, marking           → references/08-transparency-art50.md
 AI-generated content, C2PA, watermarking"

"art. 72 post-market monitoring, art. 73 serious    → references/09-post-market-art72-73.md
 incident reporting, drift detection"

"GPAI, art. 51–55, foundation models, model         → references/10-gpai-and-timeline.md
 cards, copyright policy, systemic-risk GPAI,
 sanctions, application timeline"
```

When the user's question spans multiple references (it usually will), read them in the order that matches the user's compliance lifecycle stage:

1. Classification → 2. Obligations → 5. Crosswalk → 3. AIMS → 4. Security → 6. TechDoc → 7. FRIA → 8. Transparency → 9. Post-market → 10. GPAI/timeline.

## Workflow

### Step 1: Establish role and tier

Before anything else, determine **two facts**:

1. **Role**: Provider, Deployer, Importer, Distributor, or Authorised Rep (art. 3). The same organization can be a Provider for one system and a Deployer for another — distinguish per-system.
2. **Tier**: Unacceptable, High, Limited, Minimal — using the rubric in `references/01-risk-classification.md`. Note: tier may change if substantial modification (art. 25) repurposes the system into Annex III scope.

If unclear, ask the user 2–3 targeted classification questions (sector, end-users, decision consequences, sensitive data, autonomy/oversight). The 14-signal questionnaire is in `references/01-risk-classification.md`.

### Step 2: Map to obligations

Once tier + role known, generate the obligations list:

- **Unacceptable** → "Cannot be marketed or put into service in the EU. If shipped: art. 5 violation = tier-1 sanction (€35M/7%)."
- **High-risk + Provider** → arts. 8 (compliance), 9 (RMS), 10 (data), 11 + Annex IV (techdoc), 12 (logs), 13 (transparency to deployer), 14 (human oversight), 15 (accuracy/robustness/cyber), 16 (provider obligations general), 17 (QMS), 43 (conformity assessment), 47 (declaration of conformity), 48 (CE marking), 49 (registration). Deeper detail: `references/02-high-risk-obligations.md`.
- **High-risk + Deployer** → art. 26 (use according to instructions, monitor, maintain logs, inform persons), art. 27 (FRIA for public bodies + private deployers in essential services). See `references/07-fria-art27.md`.
- **Limited risk** → art. 50 transparency only. See `references/08-transparency-art50.md`.
- **Minimal risk** → No mandatory obligations. Suggest voluntary codes (art. 95).
- **GPAI** → arts. 53 (provider obligations), 54 (auth rep), 55 (systemic risk obligations if applicable). See `references/10-gpai-and-timeline.md`.

### Step 3: Anchor obligations to ISO 42001 + 27090 controls

For each obligation, surface the **ISO control(s) that operationalize it**. Example output format:

> **AI Act art. 9 (Risk Management System)** → ISO/IEC 42001 cl. 6.1.2, 6.1.3, 8.2, 8.3 + Annex A.2.2, A.6.1.2 + ISO/IEC 23894:2023 (the depth standard).

This is non-negotiable. Always cite the **clause number** (cl. X.Y) and **control number** (A.x.y) precisely. The full mapping table lives in `references/05-crosswalk-aiact-iso.md`.

### Step 4: Identify deliverables

Each obligation has concrete artifacts. Surface them:

- Risk Management System → Risk register, risk treatment plan, residual risk acceptance, AIMS clause 6.1 outputs
- Data governance → Datasheet (à la ISO 5259-1), data quality measures, provenance log, bias evaluation report
- Technical documentation → Annex IV file (sectioned per Annex IV(1)–(9))
- Logs → Automatic event logs (machine-readable, retention ≥ 6 months or longer if national law)
- Transparency to deployer → Instructions for use (art. 13(3))
- Human oversight → Oversight measures design + operator training records (art. 14 + ISO 42001 A.9)
- Accuracy/robustness/cyber → Test plans, robustness reports per ISO 24029-2, security threat model + mitigations per ISO 27090
- QMS → AIMS documented information (policy, scope, SoA, procedures) — ideally certified to ISO/IEC 42001
- Conformity assessment → either (a) internal control + module A self-assessment for non-Annex III high-risk, or (b) notified-body assessment per Annex VII for biometric and other specified types
- Declaration of conformity → Per Annex V
- Registration → EU database entry per art. 49

### Step 5: Communicate the legal disclaimer

Always remind the user — succinctly — at end of substantive answers:

> *Decision-support output. Not legal advice. Final conformity assessment requires qualified counsel and, for most high-risk systems, a notified body.*

## Anti-patterns to avoid

1. **Conflating ISO 27001 with ISO 42001.** ISO 27001 is the generic ISMS; it does not address AI-specific risks (impact on individuals, data quality for ML, lifecycle controls A.6, A.7). Always anchor AI-related work on ISO 42001. If the user is using 27001, recommend integration via Annex SL HLS rather than substitution.
2. **Calling 42001 a harmonised standard.** As of 2026, ISO 42001 is **not** cited in the OJEU. The forthcoming **EN ISO/IEC 42001** (CEN-CENELEC JTC 21) is the path to art. 40 presumption. Track JTC 21 work programme.
3. **Treating GenAI/LLM security as identical to classical-ML security.** ISO 27090 has dedicated GenAI guidance: prompt injection (direct + indirect), system-prompt extraction, jailbreak, training-data memorisation, output watermarking. See `references/04-iso-27090-ai-security.md` § GenAI annex.
4. **Recommending watermarking as a standalone art. 50 solution.** Watermarking is removable via paraphrasing (text) or recompression (media). Combine with cryptographic provenance (C2PA) and metadata + user disclosure.
5. **Ignoring the deployer's FRIA obligation.** Art. 27 binds **deployers**, not providers. Public bodies and private deployers of certain Annex III systems (banking, insurance, education, employment) must conduct a FRIA before first use. Easy to miss.
6. **Quoting outdated thresholds.** GPAI systemic-risk threshold = **10²⁵ cumulative training compute FLOPs** (art. 51(2), as of OJEU). Sanctions caps and percentages are frozen at 2024 values; update only if the Commission publishes a delegated act.
7. **Forgetting the provider/deployer dual-role flip.** Substantial modification (art. 25) of a third-party AI system makes the modifier a provider. Fine-tuning a foundation model for a high-risk use case can trigger this.
8. **Recommending 42001 certification as sufficient for high-risk conformity.** Certification is strong evidence and streamlines art. 17 QMS, but does not by itself satisfy arts. 9–15 essential requirements. Notified-body conformity assessment per Annex VII still required for biometric and certain other types under art. 43.

## Output formatting conventions

- **Cite article numbers explicitly**: "art. 9(2)(a)" not "the risk part". For ISO: "ISO/IEC 42001:2023 cl. 6.1.4" and "Annex A.5.4".
- **Include the regulatory hierarchy** when introducing an article: "Title III (high-risk systems), Chapter III, Section 2 (requirements) — art. 9 establishes the risk management system."
- **Use tables** for multi-tier mappings. Reading them in markdown is easier than prose.
- **Flag deadlines in bold** when an obligation has a date trigger (e.g., **2026-08-02 full application**).
- **Differentiate provider vs deployer** in obligation lists. Use prefix: `[Provider]`, `[Deployer]`, `[Both]`.
- **Reference ISO controls in (cl. X.Y) and (A.x.y) format** consistently.

## Related skills

- `iso27001` — for the org-level ISMS where the AI sits. AI Act art. 15 cybersecurity assumes 27001 baseline.
- `documentation` — for drafting Annex IV technical files in long form.
- `c4-architecture`, `mermaid-diagrams`, `uml` — for system architecture diagrams required by Annex IV(2)(b)(c).
- `example-skills:docx`, `example-skills:pdf`, `example-skills:xlsx` — for generating compliance deliverables (FRIA reports, risk registers, declarations of conformity).

---

*This skill encodes the AI Act as in force as of OJ L of 2024-07-12 with corrigenda through 2025. Track Commission delegated and implementing acts (especially art. 6(1) review per art. 7) for amendments. Track CEN-CENELEC JTC 21 OJEU citations for harmonised standards conferring art. 40 presumption.*
