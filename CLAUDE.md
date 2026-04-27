# FINTH — Claude Code Master File

Read this at the start of every session.

---

## What FINTH is

FINTH is a boutique studio — never called an agency, consultancy, or firm.

FINTH provides full circle market entry between Nordic companies entering Thailand and Thai companies entering Nordic markets. Corridor positioning: Nordic clarity and Thai adaptability.

Founder and CEO: Apichai (Jere). Solopreneur operation. AI-first workflow. No permanent team.

FINTH operates across Helsinki, Bangkok, and Phuket.

---

## Active businesses in this system

| Business | Repo | Status |
|---|---|---|
| FINTH | finth-os/ | Active |
| AndamanLife | andamanlife-os/ | Building |
| HEARTBAKER | heartbaker-os/ | Framework only |

Each business has its own repo and CLAUDE.md. Shared agents and skills live in _shared/ and are available to all businesses via the ~/.claude symlink.

---

## Active clients

| Client | Phase | Priority |
|---|---|---|
| JÄÄDE | Phase 1 operational + Phase 2 brand/marketing (proposed) | Immediate |

New clients follow the same pod structure as JÄÄDE. Create Clients/[NAME]/ with client.md and specialist agents.

---

## Brand rules — apply to all FINTH output

- FINTH always in ALL CAPS
- Always "boutique studio" — never agency, consultancy, or firm
- No em dashes anywhere
- Sentence case always
- Prose over bullets in all deliverables
- Never invent data — flag for verification
- No banned words: synergy, leverage, ecosystem, game-changer, disruptive
- Writing tone: calm, intelligent, editorial — inspired by Monocle

---

## Content tagging — apply to all FINTH content

Every piece of content carries three tags:
```
[Pillar]     P1 / P2 / P3 / P4 / P5
[Sector]     Health / Green / General
[Direction]  N→T / T→N / Both
```

Buyer profiles:
- Profile A: Nordic executive entering Thailand
- Profile B: Thai business leader entering Europe or Nordics

Before drafting content: which profile would stop scrolling for this — A or B? If neither, rewrite the opener.

---

## Brand colors

Full color system reference: `02_Design_System/color-system.md`

### Primary palette

| Name | Hex | Role |
|---|---|---|
| Midnight | #272d4f | Primary brand anchor — covers, headers, closing slides, hero |
| Egg | #e8dec5 | Warm editorial base — softer layouts, diagram backgrounds |
| Silver | #f4f4f4 | Neutral base — content-heavy pages, data, tables, charts |
| Sauce | #e95c4b | Accent and action only — never default background, never body text |

### Support palette

| Name | Hex | Role |
|---|---|---|
| Ink | #111111 | Primary text on all light backgrounds — always |
| Egg supplement | #f8f5f0 | Soft supporting background, text panels, subtle cards |
| Linen supplement | #d8d6d3 | Dividers, secondary panels, chart fills, labels |
| Midnight supplement | #3a4268 | Layered depth in Midnight-led materials, charts |
| Warm linen | #c9c1ad | Borders, table rules, quiet separators on Egg layouts |
| Sauce supplement | #c96a5e | Secondary emphasis when Sauce is already main accent |

### Extended palette — use with semantic intent only

| Family | Light | Medium | Dark | When to use |
|---|---|---|---|---|
| Sage | #CADDDB | #A2B9B7 | #809A96 | Growth, success, positive metrics, sustainability |
| Slate | #EAF0F8 | #AABBCB | #839CBD | Technology, analysis, benchmarks, objectivity |
| Blush | #F7E6E8 | #F5CFD3 | #D4A9AE | People, culture, client stories, sentiment |

Extended palette rules:
- Never use extended colors as covers, hero sections, or closing slide backgrounds — primary palette only for those
- Maximum 2 extended families per deck or layout — choose based on topic
- Light shades → backgrounds and panel fills
- Medium shades → chart fills, diagram elements, UI components
- Dark shades → chart labels and emphasis only, never body text
- Never pair Sauce and Blush in the same element (both warm, they clash)
- Never use Slate Light on Silver backgrounds (too similar)
- Grid lines / axes: Warm linen #c9c1ad on light backgrounds, Midnight supplement #3a4268 on dark

### Color decisions

- Content about revenue, growth, or sustainability → Sage
- Content about technology, analysis, or data → Slate
- Content about people, culture, or team → Blush
- Brand identity moments, premium content → primary palette only
- Urgency, CTAs, key highlights → Sauce only

---

## CoWork source files — always read before relevant tasks

Brand:
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/BRAND_BRIEF.md
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/01_Brand_Identity/voice-and-tone.md
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/COWORK_INSTRUCTIONS.md

JÄÄDE client files:
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/CLIENTS/JAADE/account.md
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/CLIENTS/JAADE/regulatory.md
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/CLIENTS/JAADE/economics.md
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/CLIENTS/JAADE/channel-map.md

Design system:
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/02_Design_System/keynote-masters.md
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/02_Design_System/presentation-templates.md

Keynote automation script:
- ~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/02_Design_System/keynote_automation.applescript

---

## Folder structure

```
finth-os/
  CLAUDE.md                     ← this file
  _shared/                      ← symlinked to ~/.claude/
    agents/                     ← 13 shared agents (council + knowledge)
    skills/                     ← 4 core skills
    settings.json
  .claude/
    agents/                     ← FINTH-specific specialists
    hooks/                      ← auto-push and controls
  Knowledge/
    KB_SCHEMA.md
    Insights/
    Topics/
    Markets/
      Thailand/
      Nordics/
    Clients/
      JAADE/
    Raw/
  Clients/
    JAADE/
      client.md
      .claude/agents/           ← JÄÄDE-specific agents
  Output/
```

---

## Knowledge status definitions

| Status | Meaning |
|---|---|
| provisional | Extracted, not yet reviewed by Jere |
| approved | Reviewed and confirmed by Jere |
| archived | Superseded or no longer active |

Agents may create provisional atoms. Only Jere approves.

---

## Human approval rules

Jere approves before anything is sent externally or treated as final:
- Client-facing deliverables
- External communications
- Pricing commitments
- Legal wording leaving the firm
- New financial assumptions treated as official
- Publishing or posting content anywhere

Agents may draft, compare, score, challenge, structure, and summarise freely.

---

## Output naming convention

```
YYYY-MM-DD_[type]_[description].[ext]
```

Example: `2026-04-24_memo_jaade-channel-strategy.md`

---

## Adding a new business

1. Create [name]-os/ under ~/Dev/
2. Write CLAUDE.md for that business
3. Add business-specific specialist agents to .claude/agents/
4. Create CoWork folder at CoWork_Projects/[BUSINESS]/
5. Point CLAUDE.md to CoWork source files
6. Push to GitHub

The shared council and knowledge agents are inherited automatically. No rebuild required.

---

## Adding a new FINTH client

1. Create CoWork folder at CoWork_Projects/FINTH/CLIENTS/[NAME]/
2. Populate account.md, and relevant knowledge files
3. Create Clients/[NAME]/ in finth-os/
4. Write client.md with CoWork file paths
5. Add client-specific agents to Clients/[NAME]/.claude/agents/
6. Push to GitHub
