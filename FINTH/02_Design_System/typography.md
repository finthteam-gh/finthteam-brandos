# Typography — FINTH Design System

## Brand Font

**Primary font:** Safiro
**Fallback stack:** Safiro, sans-serif
**Font files location:** `_SHARED/Fonts/FINTH/`

| File | Weight | Style |
|------|--------|-------|
| Safiro-Regular.otf | 400 — Regular | Normal |
| Safiro-RegularItalic.otf | 400 — Regular | Italic |
| Safiro-Medium.otf | 500 — Medium | Normal |
| Safiro-MediumItalic.otf | 500 — Medium | Italic |
| Safiro-SemiBold.otf | 600 — SemiBold | Normal |
| Safiro-SemiBoldItalic.otf | 600 — SemiBold | Italic |
| Safiro-Bold.otf | 700 — Bold | Normal |
| Safiro-BoldItalic.otf | 700 — Bold | Italic |

> To install: open `_SHARED/Fonts/FINTH/` in Finder and double-click each .otf file.

---

## Font Usage Rules

| Element | Weight | Size guidance |
|---------|--------|---------------|
| H1 / Main heading | Bold (700) | Large, dominant |
| H2 / Section heading | SemiBold (600) | Clear hierarchy below H1 |
| H3 / Sub-heading | Medium (500) | Smaller than H2 |
| Body text | Regular (400) | Readable, comfortable |
| Caption / metadata | Regular (400) | Small, secondary |

---

## Document Rules

- All Word documents (.docx): use Safiro for all headings and body
- All Keynote/PowerPoint slides: use Safiro throughout — never Calibri, Arial, or Helvetica
- All HTML/email: use `@font-face` or hosted font reference (see below)
- PDFs: always embed font — never rely on system font substitution

---

## CSS Reference (Web/HTML/Email)

```css
@font-face {
  font-family: 'Safiro';
  src: url('/_SHARED/Fonts/FINTH/Safiro-Regular.otf') format('opentype');
  font-weight: 400;
  font-style: normal;
}
@font-face {
  font-family: 'Safiro';
  src: url('/_SHARED/Fonts/FINTH/Safiro-RegularItalic.otf') format('opentype');
  font-weight: 400;
  font-style: italic;
}
@font-face {
  font-family: 'Safiro';
  src: url('/_SHARED/Fonts/FINTH/Safiro-Medium.otf') format('opentype');
  font-weight: 500;
  font-style: normal;
}
@font-face {
  font-family: 'Safiro';
  src: url('/_SHARED/Fonts/FINTH/Safiro-SemiBold.otf') format('opentype');
  font-weight: 600;
  font-style: normal;
}
@font-face {
  font-family: 'Safiro';
  src: url('/_SHARED/Fonts/FINTH/Safiro-Bold.otf') format('opentype');
  font-weight: 700;
  font-style: normal;
}
@font-face {
  font-family: 'Safiro';
  src: url('/_SHARED/Fonts/FINTH/Safiro-BoldItalic.otf') format('opentype');
  font-weight: 700;
  font-style: italic;
}

body {
  font-family: 'Safiro', sans-serif;
}
```

---

## General Type Rules

- Sentence case always — never Title Case for headings except proper nouns
- No em dashes in any copy
- Prefer prose over bullet lists
- Figures for numbers 10 and above; write out one through nine
