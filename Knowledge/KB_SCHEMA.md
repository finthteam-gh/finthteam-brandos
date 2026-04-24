# Knowledge Base Schema — AndamanLife OS

This file defines the structure and field requirements for all knowledge stored in this system.

---

## Page types

| Type | Purpose |
|---|---|
| insight_atom | A single discrete, reusable editorial or market insight |
| topic | A thematic map linking related atoms |
| area_profile | A Phuket zone profile with coverage notes |
| article_brief | A planned article with keyphrase, category, and outline |
| partner_record | A sponsor, affiliate, or directory partner |
| seo_finding | A keyphrase, search intent, or competitive gap finding |
| decision_log | A record of an editorial or commercial decision |
| content_calendar | A monthly or quarterly content plan |

---

## Required fields — all page types

```yaml
id: AL-[TYPE-CODE]-[NNNN]
type: [page type]
status: provisional | approved | archived
last_reviewed: YYYY-MM-DD
```

---

## Additional fields — insight_atom

```yaml
id: AL-ATOM-0001
type: insight_atom
status: provisional
category: AL-1 | AL-2 | AL-3 | AL-4 | AL-5 | AL-6 | AL-7 | AL-8 | AL-9 | AL-10
area: Patong | Kata-Karon | Rawai-Nai-Harn | Chalong | Old-Town | Laguna-Bang-Tao | East-Coast | All
source_refs:
  - [file or URL]
confidence: high | medium | low
last_reviewed: YYYY-MM-DD
claim: >
  [One clear, specific, durable editorial insight]
why_it_matters: >
  [Why this shapes content decisions or reader value]
next_action: >
  [What article or content piece this should inform]
```

---

## Additional fields — article_brief

```yaml
id: AL-BRIEF-0001
type: article_brief
status: provisional
category: AL-1
area: [zone]
focus_keyphrase: [exact keyphrase]
secondary_keyphrases:
  - [keyphrase]
article_type: quick-guide | standard | deep-feature
target_length: 600-900 | 900-1200 | 1200-2500
audience_need: >
  [What question this article answers for the reader]
outline:
  - [Section heading]
  - [Section heading]
monetisation_angle: [sponsored / affiliate / organic / none]
last_reviewed: YYYY-MM-DD
```

---

## Additional fields — partner_record

```yaml
id: AL-PARTNER-0001
type: partner_record
status: provisional
partner_name: [name]
partner_type: sponsor | affiliate | directory
category_fit:
  - AL-[N]
contact: [name and email]
commercial_terms: [brief description]
editorial_independence_confirmed: true | false
last_reviewed: YYYY-MM-DD
```

---

## ID coding

| Type | Code |
|---|---|
| insight_atom | ATOM |
| article_brief | BRIEF |
| area_profile | AREA |
| partner_record | PARTNER |
| seo_finding | SEO |
| decision_log | DEC |
| content_calendar | CAL |
| topic | TOPIC |

---

## Folder map

```
Knowledge/
  KB_SCHEMA.md
  Insights/       ← insight_atom files
  Topics/         ← topic map files
  Raw/            ← unprocessed source material
```

---

## Rules

- Agents create provisional items only
- Jere approves before status changes to approved
- All sponsored or affiliate content must have editorial_independence_confirmed: true before publishing
- Raw/ folder is unprocessed — nothing in Raw/ is treated as approved knowledge
