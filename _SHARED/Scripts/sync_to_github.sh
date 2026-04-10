#!/bin/bash

# ============================================================
# FINTH BRAND OS — GITHUB SYNC SCRIPT
# Auto-commits and pushes any Brand OS changes to GitHub
# Called by the LaunchAgent automatically on file changes
# ============================================================

ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ROOT="$ICLOUD/CoWork_Projects"
REPO="https://github.com/finthteam-gh/finthteam-brandos.git"
LOG="$ROOT/_SHARED/sync.log"

timestamp() { date '+%Y-%m-%d %H:%M:%S'; }

cd "$ROOT" || exit 1

# Initialise git repo if not already done
if [ ! -d ".git" ]; then
  echo "$(timestamp) Initialising git repo..." >> "$LOG"
  git init
  git remote add origin "$REPO"
  echo "$(timestamp) Git repo initialised. Run 'git push -u origin main' once manually to set upstream." >> "$LOG"
  exit 0
fi

# Check for changes
if git diff --quiet && git diff --staged --quiet; then
  exit 0
fi

# Identify what changed for the commit message
CHANGED=$(git diff --name-only && git ls-files --others --exclude-standard)
FIRST_CHANGED=$(echo "$CHANGED" | head -1)
COUNT=$(echo "$CHANGED" | wc -l | tr -d ' ')

if [ "$COUNT" -gt 1 ]; then
  MSG="Brand OS update: $FIRST_CHANGED and $((COUNT - 1)) other file(s) — $(timestamp)"
else
  MSG="Brand OS update: $FIRST_CHANGED — $(timestamp)"
fi

git add -A
git commit -m "$MSG"
git push origin main 2>> "$LOG"

echo "$(timestamp) Synced: $MSG" >> "$LOG"
