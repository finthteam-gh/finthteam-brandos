#!/usr/bin/env bash
# =============================================================
#  BRAND OS — Full Mac Setup Script
#  Runs all 5 setup steps and produces a final report
# =============================================================

set -euo pipefail

ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
REPORT=()
WARNINGS=()

# ── colour helpers ────────────────────────────────────────────
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; RESET='\033[0m'
ok()   { echo -e "${GREEN}✔${RESET}  $*"; REPORT+=("✅ $*"); }
warn() { echo -e "${YELLOW}⚠${RESET}  $*"; WARNINGS+=("⚠️  $*"); }
fail() { echo -e "${RED}✘${RESET}  $*"; WARNINGS+=("❌ $*"); }
header() { echo; echo -e "${GREEN}══════════════════════════════════════${RESET}"; echo -e "${GREEN}  $*${RESET}"; echo -e "${GREEN}══════════════════════════════════════${RESET}"; }

# ═══════════════════════════════════════════════════════════════
# STEP 1 — Unzip FINTHteam_BrandOS.zip
# ═══════════════════════════════════════════════════════════════
header "STEP 1 · Unzipping FINTHteam_BrandOS.zip"

ZIP="$ICLOUD/FINTHteam_BrandOS.zip"

if [ ! -f "$ZIP" ]; then
  fail "FINTHteam_BrandOS.zip not found at: $ZIP"
  echo "  ↳ Make sure iCloud Drive is synced and the file is downloaded."
else
  echo "  Found: $ZIP"
  echo "  Unzipping…"
  unzip -o "$ZIP" -d "$ICLOUD" 2>&1 | tail -5
  ok "FINTHteam_BrandOS.zip unzipped to iCloud Drive"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 2 — Run new_mac_setup.sh
# ═══════════════════════════════════════════════════════════════
header "STEP 2 · Running new Mac setup script"

SETUP_SCRIPT="$ICLOUD/BrandOS/_SHARED/Scripts/new_mac_setup.sh"

if [ ! -f "$SETUP_SCRIPT" ]; then
  fail "Setup script not found: $SETUP_SCRIPT"
  echo "  ↳ This may be because Step 1 failed or the zip didn't contain that path."
else
  chmod +x "$SETUP_SCRIPT"
  echo "  Running: $SETUP_SCRIPT"
  echo "  (This may take several minutes if Homebrew needs to install…)"
  echo "──────────────────────────────────────────"
  bash "$SETUP_SCRIPT"
  echo "──────────────────────────────────────────"
  ok "new_mac_setup.sh completed"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 3 — Install brand fonts
# ═══════════════════════════════════════════════════════════════
header "STEP 3 · Installing brand fonts"

FONTS_SRC="$ICLOUD/CoWork_Projects/_SHARED/Fonts"
FONTS_DEST="$HOME/Library/Fonts"

if [ ! -d "$FONTS_SRC" ]; then
  fail "Fonts folder not found: $FONTS_SRC"
  echo "  ↳ Check that CoWork_Projects/_SHARED/Fonts/ exists in iCloud Drive."
else
  mkdir -p "$FONTS_DEST"
  FONT_COUNT=0
  FONT_NAMES=()

  while IFS= read -r -d '' font; do
    fname="$(basename "$font")"
    cp "$font" "$FONTS_DEST/"
    FONT_NAMES+=("$fname")
    (( FONT_COUNT++ ))
  done < <(find "$FONTS_SRC" \( -iname "*.ttf" -o -iname "*.otf" \) -print0)

  if [ "$FONT_COUNT" -eq 0 ]; then
    warn "No .ttf or .otf files found in $FONTS_SRC"
  else
    ok "$FONT_COUNT font(s) installed to ~/Library/Fonts/"
    for f in "${FONT_NAMES[@]}"; do
      echo "     · $f"
    done
  fi
fi

# ═══════════════════════════════════════════════════════════════
# STEP 4 — Run install_launchagent.sh
# ═══════════════════════════════════════════════════════════════
header "STEP 4 · Installing LaunchAgent for GitHub auto-sync"

LA_SCRIPT="$ICLOUD/CoWork_Projects/_SHARED/Scripts/install_launchagent.sh"

if [ ! -f "$LA_SCRIPT" ]; then
  fail "LaunchAgent script not found: $LA_SCRIPT"
  echo "  ↳ Confirm the script exists at CoWork_Projects/_SHARED/Scripts/"
else
  chmod +x "$LA_SCRIPT"
  echo "  Running: $LA_SCRIPT"
  echo "──────────────────────────────────────────"
  bash "$LA_SCRIPT"
  echo "──────────────────────────────────────────"
  ok "install_launchagent.sh completed"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 5 — Verify CoWork_Projects folder structure
# ═══════════════════════════════════════════════════════════════
header "STEP 5 · Verifying CoWork_Projects folder structure"

COWORK="$ICLOUD/CoWork_Projects"
REQUIRED_FOLDERS=("FINTH" "AndamanLife" "HEARTBAKER" "_SHARED")
ALL_PRESENT=true

for folder in "${REQUIRED_FOLDERS[@]}"; do
  if [ -d "$COWORK/$folder" ]; then
    ok "Folder exists: CoWork_Projects/$folder"
  else
    fail "MISSING folder: CoWork_Projects/$folder"
    ALL_PRESENT=false
  fi
done

if $ALL_PRESENT; then
  ok "All required folders are present in CoWork_Projects/"
else
  warn "One or more required folders are missing — see above"
fi

# ═══════════════════════════════════════════════════════════════
# FINAL REPORT
# ═══════════════════════════════════════════════════════════════
echo
echo -e "${GREEN}╔══════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║       BRAND OS SETUP — FINAL REPORT      ║${RESET}"
echo -e "${GREEN}╚══════════════════════════════════════════╝${RESET}"
echo
echo "COMPLETED:"
for item in "${REPORT[@]}"; do echo "  $item"; done

if [ ${#WARNINGS[@]} -gt 0 ]; then
  echo
  echo "NEEDS YOUR ATTENTION:"
  for item in "${WARNINGS[@]}"; do echo "  $item"; done
else
  echo
  echo -e "${GREEN}  🎉 All steps completed with no warnings!${RESET}"
fi

echo
echo "Done. Brand OS setup complete."
