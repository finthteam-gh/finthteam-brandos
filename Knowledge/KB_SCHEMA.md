# Knowledge Base Schema — FINTH OS

This file defines the structure, page types, and field requirements for all knowledge stored in this system. All agents must read this before creating or modifying knowledge base content.

---

## Page types

| Type | Purpose |
|---|---|
| insight_atom | A single discrete, reusable insight — the core unit of knowledge |
| topic | A thematic map linking related atoms |
| thesis | A strategic position or directional bet FINTH holds |
| market | A market profile (Thailand, Nordics, Singapore, SEA) |
| client | A client account record |
| partner | A partner, distributor, or vendor record |
| regulatory_item | A specific regulatory requirement, status, or process step |
| meeting_note | A record of a significant meeting or conversation |
| scenario_model | A commercial or strategic scenario with assumptions |
| playbook | A repeatable approach to a common situation |
| sop | A step-by-step operating procedure |
| output_draft | A work-in-progress deliverable |
| decision_log | A record of a decision made, with rationale |

---

## Required fields — all page types

```yaml
id: [BUSINESS]-[TYPE-CODE]-[NNNN]
type: [page type from list above]
status: provisional | approved | archived
business: FINTH | ANDAMANLIFE | HEARTBAKER
last_reviewed: YYYY-MM-DD
```

---

## Additional fields — insight_atom

```yaml
id: FINTH-ATOM-0001
type: insight_atom
status: provisional
business: FINTH
client: JAADE | FINTH | [other]
market: Thailand | Nordics | Singapore | SEA | Global
topics:
  - [tag]
source_refs:
  - [file path#section]
confidence: high | medium | low
last_reviewed: YYYY-MM-DD
claim: >
  [One clear, specific, durable claim — one or two sentences]
why_it_matters: >
  [Why this changes decisions or priorities]
next_action: >
  [What should happen next based on this insight]
```

---

## Additional fields — client

```yaml
id: FINTH-CLIENT-0001
type: client
status: approved
business: FINTH
client_name: [name]
phase: pre-entry | operational | active | review
engagement_type: [description]
cowork_path: ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/CLIENTS/[NAME]/
last_reviewed: YYYY-MM-DD
summary: >
  [One paragraph on the client, engagement, and current status]
```

---

## Additional fields — regulatory_item

```yaml
id: FINTH-REG-0001
type: regulatory_item
status: provisional
business: FINTH
client: JAADE
market: Thailand
authority: [e.g. Thai FDA / TFDA]
requirement: >
  [What is required]
current_status: not_started | in_progress | blocked | complete
blocker: >
  [What is blocking progress, if anything]
next_action: >
  [What needs to happen next]
last_reviewed: YYYY-MM-DD
```

---

## Additional fields — decision_log

```yaml
id: FINTH-DEC-0001
type: decision_log
status: approved
business: FINTH
client: [client or FINTH]
decision: >
  [What was decided]
rationale: >
  [Why this was the right choice]
alternatives_considered:
  - [option 1]
  - [option 2]
made_by: Jere
date: YYYY-MM-DD
last_reviewed: YYYY-MM-DD
```

---

## ID numbering convention

Format: `[BUSINESS]-[TYPE-CODE]-[NNNN]`

| Business | Code |
|---|---|
| FINTH | FINTH |
| AndamanLife | AL |
| HEARTBAKER | HB |

| Type | Code |
|---|---|
| insight_atom | ATOM |
| client | CLIENT |
| regulatory_item | REG |
| decision_log | DEC |
| meeting_note | MTG |
| scenario_model | SCEN |
| playbook | PLAY |
| sop | SOP |
| thesis | THESIS |
| market | MKT |
| partner | PARTNER |
| topic | TOPIC |
| output_draft | DRAFT |

---

## Folder map

```
Knowledge/
  KB_SCHEMA.md          ← this file
  Insights/             ← all insight_atom files
  Topics/               ← topic map files
  Markets/
    Thailand/           ← Thailand market files
    Nordics/            ← Nordics market files
  Clients/
    JAADE/              ← JÄÄDE knowledge atoms
  Raw/                  ← unprocessed source material
```

---

## Rules

- Agents create provisional items only
- Jere approves items before status changes to approved
- Archived items are never deleted — status set to archived only
- Raw/ folder contains unprocessed material — nothing in Raw/ is treated as approved knowledge
- All claims in approved atoms must have source_refs
- Confidence: high requires at least two independent source references
