# Knowledge Base Schema — HEARTBAKER OS

This file defines the structure and field requirements for all knowledge stored in this system.

---

## Page types

| Type | Purpose |
|---|---|
| insight_atom | A single discrete, reusable brand or market insight |
| product_record | A product in the HEARTBAKER range with commercial details |
| campaign_brief | A planned campaign with objectives, audience, and channel plan |
| channel_record | A sales or distribution channel with status and notes |
| partner_record | A venue, retailer, or commercial partner |
| customer_insight | A finding about customer behaviour or preference |
| decision_log | A record of a brand or commercial decision |
| launch_plan | A structured product or collection launch plan |

---

## Required fields — all page types

```yaml
id: HB-[TYPE-CODE]-[NNNN]
type: [page type]
status: provisional | approved | archived
last_reviewed: YYYY-MM-DD
```

---

## Additional fields — product_record

```yaml
id: HB-PROD-0001
type: product_record
status: approved
product_name: [name]
collection: [e.g. Cupcake Line / The Aperitif Collection]
skus:
  - size: [S / M / L]
    weight: [grams]
    price_thb: [price or TBC]
tagline: [product tagline]
target_customer: [description]
positioning: [one sentence]
packaging_status: [finalised / in progress / TBC]
channels:
  - [channel name]
last_reviewed: YYYY-MM-DD
notes: >
  [Any additional commercial or production notes]
```

---

## Additional fields — campaign_brief

```yaml
id: HB-CAMP-0001
type: campaign_brief
status: provisional
campaign_name: [name]
product: [product or collection]
objective: [one clear objective]
target_audience: [description]
channels:
  - [Instagram / Facebook / LINE / venue / gifting]
key_message: [one sentence]
tone: [description]
timeline: [dates or TBC]
budget: [THB or TBC]
capacity_check_done: true | false
last_reviewed: YYYY-MM-DD
```

---

## Additional fields — launch_plan

```yaml
id: HB-LAUNCH-0001
type: launch_plan
status: provisional
product: The Aperitif Collection
launch_objective: >
  [What success looks like at launch]
phases:
  - phase: pre-launch
    actions:
      - [action]
  - phase: launch
    actions:
      - [action]
  - phase: post-launch
    actions:
      - [action]
channel_plan:
  - [channel and approach]
capacity_ceiling: [units per week or month]
pricing_status: [finalised / under review]
last_reviewed: YYYY-MM-DD
```

---

## ID coding

| Type | Code |
|---|---|
| insight_atom | ATOM |
| product_record | PROD |
| campaign_brief | CAMP |
| channel_record | CHAN |
| partner_record | PARTNER |
| customer_insight | CUST |
| decision_log | DEC |
| launch_plan | LAUNCH |

---

## Folder map

```
Knowledge/
  KB_SCHEMA.md
  Insights/       ← insight_atom and customer_insight files
  Topics/         ← topic map files
  Raw/            ← unprocessed source material
```

---

## Rules

- Agents create provisional items only
- Jere approves before status changes to approved
- All pricing, packaging, and launch decisions require Jere approval before external use
- Production capacity must be checked before any campaign or launch plan is approved
