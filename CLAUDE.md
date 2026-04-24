# ANDAMAN LIFE — Claude Code Master File

Read this at the start of every session.

---

## What Andaman Life is

**andaman.life** — a WordPress-based digital content platform for informed long-stay living in Phuket and the Andaman coast. The definitive reference platform every European or Nordic person reads before relocating, and continues to rely on after arriving.

Not a travel blog. Not a tourist guide. An editorial platform for people who chose Phuket for quality of life.

CEO and Editor in Chief: Jere (Apichai). Currently in content production phase, pre-revenue as of April 2026.

---

## Audience

**Primary:** European or Nordic, aged 30–60. Long-term Phuket residents or serious relocation planners. Financially independent, retired early, or remotely employed. Chose Phuket for quality of life, not price.

**Secondary:** Nordic 55+ considering Thailand for retirement or extended stay. High disposable income. Reads carefully, values accuracy.

**What they read Andaman Life for:** visa and residency accuracy, international schools, business setup, property rules, healthcare, banking, community and networking.

**What they expect:** respect for their intelligence, honest assessments including downsides, specific current information, and comparison points to European cities — never Bangkok.

---

## Editorial voice and tone — non-negotiable

The editorial model is Monocle: intelligent, culturally curious, quietly confident, anti-hype.

- Documentary lens: actual streets, real prices, named businesses
- Sentence economy: 12–18 words average, varied rhythm
- Concrete specifics over abstract claims
- British English strictly throughout: colour, organisation, licence (noun), practise (verb), travelling, centre, recognise
- Numbers: figures for 10 and above; write out one through nine; baht first, EUR/USD in brackets if helpful
- No em dashes anywhere, ever
- Sentence case for all headings — never title case except proper nouns
- Prose over bullets; lists only where genuinely list-like

**Banned words and phrases:** amazing, stunning, paradise, breathtaking, hidden gem, vibrant, bustling, enchanting, magical. Never: "Thailand has something for everyone" or "Phuket is more than just beaches."

**What good looks like:**
Correct: "The school accepts applications from November, with most places filled by January. Fees for the primary years run from 280,000 to 340,000 baht annually, depending on the programme."
Incorrect: "Phuket has some amazing international schools offering fantastic educational opportunities for expat families."

---

## 10 content categories

| Code | Category | Reader need |
|---|---|---|
| AL-1 | Living in Phuket | Neighbourhoods, cost of living, utilities |
| AL-2 | Business and Entrepreneurship | BOI, work permits, legal structures |
| AL-3 | Work and Career | Remote work, coworking, local employment |
| AL-4 | Lifestyle and Wellness | Gyms, healthcare, mental health, daily routines |
| AL-5 | Food and Dining | Restaurants, markets — for residents, not tourists |
| AL-6 | Family and Education | International schools, childcare, family life |
| AL-7 | Culture and Experiences | Local events, off-the-beaten-track |
| AL-8 | Guides and Resources | Practical how-to: visas, banking, driving, healthcare |
| AL-9 | Property and Housing | Renting, buying, leasehold vs freehold |
| AL-10 | Community and Networking | Expat groups, networking events |

**Production priority:** AL-1 first, then AL-8, AL-9, AL-2, AL-6, then rotate AL-3 through AL-10.

---

## Geographic balance

Coverage tracked across 7 Phuket zones. Maximum 30% from any single zone per month:
- Patong
- Kata / Karon
- Rawai / Nai Harn
- Chalong / Ao Chalong
- Old Phuket Town
- Laguna / Bang Tao / Cherng Talay
- East coast / Phuket City surrounds

---

## Article structure requirements

**Lengths:**
- Quick guides: 600–900 words
- Standard articles: 900–1,200 words
- Deep features: 1,200–2,500 words

**Every article opens with a WordPress metadata comment block:**
```
Focus Keyphrase / Secondary Keyphrases / Meta Description / Excerpt / Primary Category / Sub-Category / Secondary Tag / Tags
```

**Dual export required for every article:**
1. Notion-ready markdown
2. WordPress-ready HTML with metadata block

---

## SEO rules — apply to every article

- Focus keyphrase in first 6 words of H1
- H1 maximum 60 characters
- Meta description 140–155 characters, factual, no hype
- First paragraph structured to be quotable by AI overviews
- Keyphrase density 0.5–1%
- Minimum 2 internal links per article

**Highest-value search intent:**
- "living in Phuket as a foreigner"
- "retiring in Phuket [nationality]"
- "moving to Phuket from [country]"
- "long stay visa Thailand"
- "best areas to live in Phuket"

---

## Monetisation model

**Tier 1 — active now:**
- Native / sponsored content: property agencies, schools, legal, healthcare, coworking. All sponsored content disclosed.
- Affiliate: property platforms, health insurance, visa services, international banking, shipping.

**Tier 2 — at traffic threshold:**
- Display advertising (non-intrusive: sidebar or end of article only, never between paragraphs)

**Tier 3 — at audience scale:**
- Paid membership / newsletter: EUR 5–15/month
- Vetted service directory: annual listing fee for qualified providers

**Editorial independence rule:** no revenue stream compromises editorial coverage. Advertisers do not influence non-sponsored articles.

---

## CoWork source files — always read before relevant tasks

```
~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/AndamanLife/BRAND_BRIEF.md
~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/AndamanLife/01_Brand_Identity/voice-and-tone.md
~/Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/AndamanLife/COWORK_INSTRUCTIONS.md
```

---

## Folder structure

```
andamanlife-os/
  CLAUDE.md                     ← this file
  _shared/                      ← symlinked to ~/.claude/ (shared with all businesses)
  .claude/
    agents/                     ← AndamanLife specialist agents
    hooks/                      ← auto-push hook
    settings.json               ← Stop hook registration
  Knowledge/
    KB_SCHEMA.md
    Insights/
    Topics/
    Raw/
  Output/
```

---

## Knowledge status definitions

| Status | Meaning |
|---|---|
| provisional | Created by agent, not yet reviewed |
| approved | Reviewed and confirmed by Jere |
| archived | Superseded or no longer active |

---

## Human approval required before

- Publishing any article to WordPress
- Activating any sponsorship or affiliate arrangement
- Sending any outreach to potential partners or advertisers
- Any pricing commitment on directory or membership tiers

---

## Connection to FINTH

Andaman Life's readership is FINTH Profile A — Nordic executives living in or entering Thailand. The platform deepens direct understanding of this audience. Treat insights from reader behaviour and content performance as intelligence for the FINTH knowledge base.

---

## Adding a new business

All new businesses follow the same pattern. Create [name]-os/ under ~/Dev/, write CLAUDE.md, add specialist agents, point to CoWork source files. The shared council and knowledge agents are inherited automatically.
