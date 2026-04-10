#!/usr/bin/env bash
# =============================================================
#  BRAND OS — GitHub Sync + LaunchAgent Setup
#  Run once from Terminal to initialise git and auto-sync
# =============================================================

set -euo pipefail

ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ROOT="$ICLOUD/CoWork_Projects"
REMOTE="https://github.com/finthteam-gh/finthteam-brandos.git"
SCRIPT_DIR="$ROOT/_SHARED/Scripts"
PLIST_SRC="$SCRIPT_DIR/com.brandos.sync.plist"
PLIST_DEST="$HOME/Library/LaunchAgents/com.brandos.sync.plist"

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; RESET='\033[0m'
ok()     { echo -e "${GREEN}✔${RESET}  $*"; }
warn()   { echo -e "${YELLOW}⚠${RESET}  $*"; }
fail()   { echo -e "${RED}✘${RESET}  $*"; }
header() { echo; echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"; echo -e "${GREEN}  $*${RESET}"; echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"; }

# ─── STEP 1: Git init ─────────────────────────────────────────
header "STEP 1 · Initialising git repo"

cd "$ROOT"

if [ -d ".git" ]; then
  ok "Git repo already initialised — skipping git init"
else
  git init
  ok "Git repo initialised at: $ROOT"
fi

# ─── STEP 2: Set remote ───────────────────────────────────────
header "STEP 2 · Setting GitHub remote"

EXISTING_REMOTE=$(git remote get-url origin 2>/dev/null || echo "")

if [ "$EXISTING_REMOTE" = "$REMOTE" ]; then
  ok "Remote 'origin' already set to correct URL"
elif [ -n "$EXISTING_REMOTE" ]; then
  warn "Remote 'origin' exists but points to: $EXISTING_REMOTE"
  warn "Updating to: $REMOTE"
  git remote set-url origin "$REMOTE"
  ok "Remote updated"
else
  git remote add origin "$REMOTE"
  ok "Remote added: $REMOTE"
fi

# ─── STEP 3: Stage + commit ───────────────────────────────────
header "STEP 3 · Staging and committing all files"

git add -A

STAGED=$(git diff --cached --name-only | wc -l | tr -d ' ')

if [ "$STAGED" -eq 0 ]; then
  ok "Nothing to commit — working tree is clean"
else
  git commit -m "Initial Brand OS commit — April 2026"
  ok "Committed $STAGED file(s)"
fi

# ─── STEP 4: Rename branch to main ────────────────────────────
header "STEP 4 · Setting branch to 'main'"

git branch -M main
ok "Branch set to: main"

# ─── STEP 5: Push to GitHub ───────────────────────────────────
header "STEP 5 · Pushing to GitHub"
echo
echo -e "${YELLOW}  Note: If prompted for credentials, use your GitHub username"
echo -e "  and a Personal Access Token (NOT your GitHub password).${RESET}"
echo -e "  Generate one at: github.com/settings/tokens → 'repo' scope"
echo

if git push -u origin main; then
  ok "Successfully pushed to github.com/finthteam-gh/finthteam-brandos"
else
  fail "Push failed — most likely an authentication issue (see note above)"
  echo
  echo "  To fix:"
  echo "  1. Go to https://github.com/settings/tokens"
  echo "  2. Generate a new token with 'repo' scope"
  echo "  3. Re-run this script and use the token as your password"
  echo "  4. Or set up SSH: https://docs.github.com/en/authentication/connecting-to-github-with-ssh"
  echo
fi

# ─── STEP 6: Install LaunchAgent ──────────────────────────────
header "STEP 6 · Installing LaunchAgent for auto-sync"

LAUNCH_SCRIPT="$SCRIPT_DIR/install_launchagent.sh"

if [ ! -f "$LAUNCH_SCRIPT" ]; then
  fail "install_launchagent.sh not found at: $LAUNCH_SCRIPT"
else
  chmod +x "$LAUNCH_SCRIPT"
  bash "$LAUNCH_SCRIPT"
  ok "LaunchAgent installer completed"
fi

# ─── STEP 7: Verify LaunchAgent is running ────────────────────
header "STEP 7 · Verifying LaunchAgent status"

sleep 1  # give launchctl a moment

if launchctl list | grep -q "com.brandos.sync"; then
  ok "LaunchAgent 'com.brandos.sync' is LOADED and watching for file changes"
else
  warn "LaunchAgent not found in launchctl list"
  warn "Attempting to load manually…"
  if [ -f "$PLIST_DEST" ]; then
    launchctl load "$PLIST_DEST" 2>/dev/null && ok "LaunchAgent loaded successfully" || fail "Could not load LaunchAgent — check $PLIST_DEST"
  else
    fail "Plist not found at $PLIST_DEST — install_launchagent.sh may have failed"
  fi
fi

# ─── FINAL REPORT ─────────────────────────────────────────────
echo
echo -e "${GREEN}╔══════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║   BRAND OS GITHUB SYNC — SETUP COMPLETE      ║${RESET}"
echo -e "${GREEN}╚══════════════════════════════════════════════╝${RESET}"
echo
echo "  Repo:          github.com/finthteam-gh/finthteam-brandos"
echo "  Local root:    $ROOT"
echo "  Branch:        main"
echo "  Auto-sync:     com.brandos.sync (LaunchAgent)"
echo
echo "  From now on, file changes in CoWork_Projects/ are"
echo "  automatically committed and pushed to GitHub."
echo
