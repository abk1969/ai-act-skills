# 11 — AI Literacy (AI Act art. 4)

**Effective since 2025-02-02** (art. 113(a)). Often missed because it sits in Chapter I (general provisions) before the high-risk machinery, but it is **already enforceable** and applies **regardless of risk tier**.

## 1. The text of art. 4

> *"Providers and deployers of AI systems shall take measures to ensure, to their best extent, a sufficient level of AI literacy of their staff and other persons dealing with the operation and use of AI systems on their behalf, taking into account their technical knowledge, experience, education and training and the context the AI systems are to be used in, and considering the persons or groups of persons on whom the AI systems are to be used."*

> **AI Omnibus note (2026)**: the Omnibus amendment softens the art. 4 wording — from *ensuring* a sufficient level of AI literacy toward **supporting** staff AI-literacy development — reinforcing proportionality. The obligation itself, its universal scope (all providers and deployers, any tier), and its 2025-02-02 applicability are unchanged. Verify the final OJ text before recalibrating an existing programme downward.

Three operative elements:

1. **Subjects bound**: every **provider** AND every **deployer** of an AI system. No tier carve-out. No SME carve-out (though the level-of-effort clause "to their best extent" gives proportionality).
2. **Population covered**: own staff **and** "other persons dealing with the operation and use of AI systems on their behalf" — contractors, gig workers, third-party operators with delegated access.
3. **Calibration parameters** (art. 4 explicitly listed): technical knowledge, experience, education, training, **context of use**, and **persons or groups affected**.

## 2. Definition of "AI literacy" (art. 3(56))

> *"AI literacy means skills, knowledge and understanding that allow providers, deployers and affected persons, taking into account their respective rights and obligations in the context of this Regulation, to make an informed deployment of AI systems, as well as to gain awareness about the opportunities and risks of AI and possible harm it can cause."*

Three competence axes derived from the definition:

| Axis | Content for staff |
|---|---|
| **Skills** | Operating the AI system per provider instructions (art. 13); recognising anomalies; exercising override (art. 14(4)(d)(e)) |
| **Knowledge** | Capabilities and limitations of the system; relevant articles of the AI Act applying to the user role; basic awareness of GDPR/LED interplay |
| **Understanding** | Risks and harms (incl. automation bias, art. 14(4)(b)); rights of affected persons (art. 86 explanation; art. 27 FRIA outputs) |

## 3. Why this matters operationally

- **Sanctions exposure**: art. 4 falls under **tier-2** sanctions (art. 99(4)): up to **€15M or 3% global turnover** — same tier as art. 8–17 violations. Failing to maintain literacy programme is enforceable as a stand-alone breach.
- **Cross-cutting evidence**: art. 4 evidence supports **art. 14 human oversight competence** (the human overseer must have "the necessary competence, training and authority", art. 14(4)) and **art. 26(2) deployer obligation** (assign trained humans). A single literacy programme can satisfy three articles.
- **Regulator focus**: National competent authorities and the AI Office have signalled that **art. 4** will be a frequent first-touch enforcement target precisely because it is in force early and easy to audit.

## 4. ISO anchors

| Aspect | ISO/IEC 42001 clause | Annex A control |
|---|---|---|
| Competence | **cl. 7.2** (Competence) | A.3.2 (roles) |
| Awareness | **cl. 7.3** (Awareness) | A.9.2 (responsible use) |
| Communication | cl. 7.4 (Communication) | A.8.5 (information for parties) |
| Training records (documented info) | cl. 7.5 | A.4.2 (resource doc) |
| Roles & responsibilities | cl. 5.3 | A.3.2 |

ISO/IEC 42001 cl. 7.2 + 7.3 + Annex A.3.2 + A.9.2 collectively **operationalize art. 4**. An AIMS that satisfies these clauses produces art. 4 evidence as a by-product.

Companion: ISO/IEC TR 24368 (overview of ethical and societal concerns) — useful for the "awareness about risks and possible harm" leg of art. 3(56).

## 5. Programme design — what good looks like

A defensible AI literacy programme has these components. Document each in the AIMS records (cl. 7.5).

### 5.1 Population mapping

For each role interacting with an AI system, map:

- Role title (procurement officer, data scientist, customer-service agent, ...)
- Interaction depth (configures / operates / monitors / oversees / consumes output)
- Tier of systems touched (high-risk Annex III §X / limited / minimal / GPAI)
- Required competence axes (skills / knowledge / understanding) at L1–L4 maturity

### 5.2 Curriculum modules (suggested baseline)

| Module | Audience | Duration | Coverage |
|---|---|---|---|
| **M1: AI Act fundamentals** | All staff dealing with any AI | 1h | Tier definitions, art. 5 prohibitions, art. 50 transparency, individual rights (art. 86) |
| **M2: Role-specific obligations** | Provider engineering / deployer ops | 2h | Arts. 8–15 (provider) OR art. 26 (deployer); ISO 42001 introduction |
| **M3: Human oversight competence** | Designated overseers (art. 14) | 4h | Automation bias; intervention/override procedures; logs (art. 12) interpretation |
| **M4: Domain-specific** | Sector-specific staff | 1–2h | E.g., medical AI safety considerations; recruitment AI bias; biometric ID safeguards |
| **M5: Incident response** | Operators + designated incident officer | 1h | Art. 73 timelines; serious-incident definition (art. 3(49)) |
| **M6: GPAI/foundation-model literacy** | Anyone using GPAI in deployer flows | 1h | Art. 53 model-card reading; Code of Practice; copyright policy implications |
| **M7: Affected persons & rights** | Customer-facing + complaint handlers | 1h | Art. 86 right to explanation; complaint mechanisms; FRIA outputs |

### 5.3 Evidence retention

- Training delivery records (date, attendees, content version) — retain **10 years** to align with art. 18 documentation retention.
- Competence assessment results.
- Refresher cadence (recommended: annual baseline; ad-hoc on Commission delegated act / new system deployment / substantial modification).

### 5.4 Periodic review

Tie review to AIMS cl. 9.3 (management review) and cl. 10.1 (continual improvement). Triggers for refresh:

- New AI Act delegated/implementing act
- New harmonised standard cited in OJEU
- Substantial modification (art. 25) of any deployed high-risk system
- Serious incident (art. 73) — even one in the sector
- New ISO publication (e.g., EN ISO/IEC 42001 once cited)

## 6. Common misinterpretations

1. **"It's only for high-risk AI"** — false. Art. 4 has no tier carve-out. It applies to a marketing chatbot deployer just as to a high-risk credit-scoring provider.
2. **"It's only for deployers"** — false. Art. 4 binds **providers and deployers** alike. A foundation-model provider must train the staff who interact with the model in development and post-market monitoring.
3. **"Sending an email satisfies it"** — implausible. The "best extent" clause is calibrated to the role; ad-hoc communication will not survive an audit for staff exercising art. 14 human oversight on Annex III systems.
4. **"It's a soft obligation"** — no. It carries tier-2 sanctions. It is also one of the **first** articles a market surveillance authority can enforce since it has been in force since 2025-02-02 — well before the bulk of high-risk obligations (2027-12-02 post-Omnibus).
5. **"GDPR data-protection training already covers this"** — partial. GDPR art. 39 DPO training covers personal-data processing. Art. 4 covers AI-specific operation, oversight, automation bias, and rights of affected persons. Overlap: ~30–40%. Gap is real and audit-relevant.

## 7. Output template — AI literacy programme summary

When the user asks "what does my org need for art. 4?", output:

```
SCOPE
  Provider role: <yes/no, which systems>
  Deployer role: <yes/no, which systems>
  Population covered: <staff headcount + contractor headcount>

CURRENT MATURITY
  Module M1 fundamentals:    <not started | in progress | delivered | refresher due>
  Module M2 role-specific:   <...>
  ...

GAPS
  - <list specific gaps tied to specific roles>

PRIORITY ACTIONS (next 90 days)
  1. <e.g., Deliver M1 to all 240 staff; deadline + owner>
  2. <...>

EVIDENCE BACKBONE
  - AIMS records under cl. 7.2 / 7.3 / 7.5
  - Annex A.3.2 (roles) + A.9.2 (responsible use) deliverables
  - Retain 10 years per art. 18 alignment

REVIEW CADENCE
  - Annual baseline refresher
  - Ad-hoc on: <triggers list per § 5.4 above>

CITATIONS
  - AI Act art. 4 (Regulation (EU) 2024/1689)
  - AI Act art. 3(56) (definition)
  - AI Act art. 99(4) (sanction tier — €15M / 3%)
  - ISO/IEC 42001:2023 cl. 7.2, 7.3, 7.4, 7.5; Annex A.3.2, A.9.2

LEGAL DISCLAIMER
  Decision-support output. Not legal advice. Calibration of "best extent"
  remains the data controller's responsibility under qualified counsel.
```

## 8. Cross-references

- `02-high-risk-obligations.md` — art. 14 human oversight competence (art. 4 is the source obligation; art. 14 is the application for high-risk).
- `07-fria-art27.md` — FRIA must include description of human-oversight measures (art. 27(1)(e)) which depend on art. 4 literacy of the overseers.
- `03-iso-42001-aims.md` — cl. 7.2 / 7.3 implementation guidance.
- `09-post-market-art72-73.md` — art. 73 incident-response readiness depends on art. 4 module M5.
