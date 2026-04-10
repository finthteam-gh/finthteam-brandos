# Typography — HEARTBAKER Design System

## Brand Font

**Primary font:** Quicksand
**Fallback stack:** Quicksand, sans-serif
**Font files location:** `_SHARED/Fonts/HEARTBAKER/`

| File | Weight | Style |
|------|--------|-------|
| Quicksand_Light.otf | 300 — Light | Normal |
| Quicksand_Light_Oblique.otf | 300 — Light | Oblique |
| Quicksand_Book.otf | 400 — Book (Regular) | Normal |
| Quicksand_Book_Oblique.otf | 400 — Book (Regular) | Oblique |
| Quicksand_Dash.otf | 450 — Dash | Normal |
| Quicksand-Regular.ttf | 400 — Regular | Normal |
| Quicksand-Bold.ttf | 700 — Bold | Normal |

> To install: open `_SHARED/Fonts/HEARTBAKER/` in Finder and double-click each font file.

---

## Font Usage Rules

| Element | Weight | Size guidance |
|---------|--------|---------------|
| H1 / Main heading | Bold (700) | Warm, approachable — large |
| H2 / Section heading | Book/Regular (400) | Clear, friendly |
| H3 / Sub-heading | Book (400) | Lighter than H2 |
| Body text | Book/Regular (400) | Comfortable, readable |
| Caption / metadata | Light (300) | Small, soft |

---

## Document Rules

- All Word documents (.docx): use Quicksand throughout
- All Keynote slides: use Quicksand throughout
- Never use system defaults (Calibri, Arial, Helvetica)
- PDFs: always embed font — never rely on system font substitution

---

## CSS Reference (Web/HTML/Email)

```css
@font-face {
  font-family: 'Quicksand';
  src: url('/_SHARED/Fonts/HEARTBAKER/Quicksand_Light.otf') format('opentype');
  font-weight: 300;
  font-style: normal;
}
@font-face {
  font-family: 'Quicksand';
  src: url('/_SHARED/Fonts/HEARTBAKER/Quicksand_Book.otf') format('opentype');
  font-weight: 400;
  font-style: normal;
}
@font-face {
  font-family: 'Quicksand';
  src: url('/_SHARED/Fonts/HEARTBAKER/Quicksand-Bold.ttf') format('truetype');
  font-weight: 700;
  font-style: normal;
}

body {
  font-family: 'Quicksand', sans-serif;
}
```
