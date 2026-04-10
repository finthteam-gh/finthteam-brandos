# Typography — AndamanLife Design System

## Brand Font

**Primary font:** PolySans Trial
**Fallback stack:** PolySans Trial, sans-serif
**Font files location:** `_SHARED/Fonts/AndamanLife/`

| File | Weight / Style | Character |
|------|---------------|-----------|
| PolySansTrial-Slim.otf | Light / Slim | Elegant, airy |
| PolySansTrial-Neutral.otf | Regular / Neutral | Clean, readable |
| PolySansTrial-Median.otf | Medium / Median | Balanced emphasis |
| PolySansTrial-Bulky.otf | Bold / Bulky | Strong, impactful |

> To install: open `_SHARED/Fonts/AndamanLife/` in Finder and double-click each .otf file.
> Note: These are Trial weights — upgrade to full commercial licence before production use.

---

## Font Usage Rules

| Element | Weight | Size guidance |
|---------|--------|---------------|
| H1 / Main heading | Bulky (Bold) | Large, confident |
| H2 / Section heading | Median (Medium) | Clear hierarchy below H1 |
| H3 / Sub-heading | Neutral (Regular) | Lighter than H2 |
| Body text | Neutral (Regular) | Comfortable, readable |
| Caption / pull quotes | Slim (Light) | Airy, editorial feel |

---

## Document Rules

- All Word documents (.docx): use PolySans Trial throughout
- All Keynote slides: use PolySans Trial throughout — never Calibri, Arial, or Helvetica
- All HTML/email: use `@font-face` or hosted font reference (see below)
- PDFs: always embed font — never rely on system font substitution

---

## CSS Reference (Web/HTML/Email)

```css
@font-face {
  font-family: 'PolySans';
  src: url('/_SHARED/Fonts/AndamanLife/PolySansTrial-Slim.otf') format('opentype');
  font-weight: 300;
  font-style: normal;
}
@font-face {
  font-family: 'PolySans';
  src: url('/_SHARED/Fonts/AndamanLife/PolySansTrial-Neutral.otf') format('opentype');
  font-weight: 400;
  font-style: normal;
}
@font-face {
  font-family: 'PolySans';
  src: url('/_SHARED/Fonts/AndamanLife/PolySansTrial-Median.otf') format('opentype');
  font-weight: 500;
  font-style: normal;
}
@font-face {
  font-family: 'PolySans';
  src: url('/_SHARED/Fonts/AndamanLife/PolySansTrial-Bulky.otf') format('opentype');
  font-weight: 700;
  font-style: normal;
}

body {
  font-family: 'PolySans', sans-serif;
}
```

---

## General Type Rules

- Sentence case always — never Title Case for headings except proper nouns
- Prefer prose over bullet lists in long-form content
- Figures for numbers 10 and above; write out one through nine
