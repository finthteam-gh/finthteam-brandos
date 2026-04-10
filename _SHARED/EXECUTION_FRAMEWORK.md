# EXECUTION FRAMEWORK — Shared Operating Rules
> This document governs how Claude CoWork operates across ALL companies in the portfolio. Read this alongside each company's COWORK_INSTRUCTIONS.md.

---

## 1. CoWork Project Structure

Each company is a separate CoWork Project, fully isolated:
- FINTH → `/CoWork_Projects/FINTH/`
- AndamanLife → `/CoWork_Projects/AndamanLife/`
- HEARTBAKER → `/CoWork_Projects/HEARTBAKER/`

When working on any task, confirm which company's project you are in before producing anything.

---

## 2. File Reading Protocol

Before any task, always read in this order:
1. This EXECUTION_FRAMEWORK.md (shared rules)
2. The company's BRAND_BRIEF.md (who they are)
3. The company's COWORK_INSTRUCTIONS.md (how to work)
4. The relevant C-SUITE/*.md file if a strategic perspective is needed
5. The specific task files or templates

---

## 3. Brand Version Control

Every output file must carry a brand version stamp:
```
Generated under: [Company] Brand v[X.X] — [Date]
```
Check CHANGELOG.md for the current version before producing any output.

---

## 4. Output Filing Rules

All completed outputs go to `/05_Output_Archive/` with this naming convention:
```
YYYY-MM-DD_[type]_[description].[ext]
```
Example: `2026-04-08_linkedin-post_corridor-brief-q2.md`

---

## 5. Brand Check — Required on Every Output

Before saving any file to archive, confirm:
- [ ] Font matches typography.md
- [ ] Colours match colors.md
- [ ] Tone matches voice-and-tone.md
- [ ] Version noted in file metadata
- [ ] Tagged correctly (pillar/category/type as applicable)

---

## 6. Universal Writing Rules (All Companies)

- Never use em dashes in any copy
- Sentence case always (not Title Case) except proper nouns
- Prefer prose over bullet lists in all deliverables
- Never invent data — flag for verification if uncertain
- Never use: synergy, leverage, ecosystem, game-changer, disruptive, pivot, best practices

---

## 7. C-Suite Activation

To get a strategic perspective, frame the task with the relevant role:
> "Thinking as [Company]'s [ROLE], review this and tell me what's missing."

Available roles: CEO, CMO, CFO, COO, CTO, CSO, CCO
Each role's context file is in `/C-SUITE/[ROLE].md`

---

## 8. Brand Update Protocol

When brand files are updated:
1. Edit the relevant file directly
2. Update CHANGELOG.md with version number and what changed
3. All new outputs after that update automatically reflect the change
4. Old outputs in archive are preserved as-is under their version stamp

---

## 9. New Mac Setup

If opening on a new Mac:
1. Run `new_mac_setup.sh` from the `_SHARED/Scripts/` folder
2. Install brand fonts (located in `_SHARED/Fonts/`)
3. Reconnect CoWork Projects pointing to iCloud paths
4. Confirm GitHub sync is running via LaunchAgent

---

## 10. GitHub Auto-Sync

All Brand OS changes auto-commit to:
`github.com/finthteam-github/finthteam-brandos` (private)

This runs silently in the background via the LaunchAgent. No manual git commands needed.
