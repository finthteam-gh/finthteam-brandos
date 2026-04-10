#!/bin/bash

# ============================================================
# FINTH BRAND OS — NEW MAC SETUP SCRIPT
# Gets a new Mac fully operational in under 10 minutes
# Run this first thing on any new machine
# ============================================================

echo ""
echo "================================"
echo "  FINTH Brand OS — New Mac Setup"
echo "================================"
echo ""

# 1 — Homebrew
if ! command -v brew &>/dev/null; then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed"
fi

# 2 — Git
if ! command -v git &>/dev/null; then
  echo "📦 Installing git..."
  brew install git
else
  echo "✅ Git already installed"
fi

# 3 — Clone Brand OS from GitHub
ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ROOT="$ICLOUD/CoWork_Projects"

if [ ! -d "$ROOT/.git" ]; then
  echo "📥 Cloning Brand OS from GitHub..."
  git clone https://github.com/finthteam-gh/finthteam-brandos.git "$ROOT"
  echo "✅ Brand OS cloned to iCloud Drive"
else
  echo "✅ Brand OS already present — pulling latest..."
  cd "$ROOT" && git pull origin main
fi

# 4 — Install fonts
echo ""
echo "🔤 Installing brand fonts..."
FONTS_DIR="$ROOT/_SHARED/Fonts"
if [ -d "$FONTS_DIR" ]; then
  for font in "$FONTS_DIR"/*.ttf "$FONTS_DIR"/*.otf; do
    [ -f "$font" ] || continue
    cp "$font" "$HOME/Library/Fonts/"
    echo "   ✅ Installed: $(basename "$font")"
  done
else
  echo "   ⚠️  No fonts folder found — add fonts to _SHARED/Fonts/ and re-run"
fi

# 5 — Install LaunchAgent for auto-sync
echo ""
echo "⚙️  Installing GitHub auto-sync LaunchAgent..."
bash "$ROOT/_SHARED/Scripts/install_launchagent.sh"

# 6 — Claude Desktop
echo ""
echo "🤖 Claude Desktop..."
if [ ! -d "/Applications/Claude.app" ]; then
  echo "   Please download Claude Desktop from: https://claude.ai/download"
  echo "   Then re-run this script or set up CoWork Projects manually."
else
  echo "   ✅ Claude Desktop already installed"
fi

echo ""
echo "================================"
echo "  New Mac setup complete!"
echo "================================"
echo ""
echo "Manual steps remaining:"
echo "  1. Open Claude Desktop → Cowork → create 3 Projects:"
echo "     FINTH:        $ROOT/FINTH"
echo "     AndamanLife:  $ROOT/AndamanLife"
echo "     HEARTBAKER:   $ROOT/HEARTBAKER"
echo "  2. Reconnect any CoWork connectors (Canva, Slack etc.)"
echo "  3. Test one task per project to confirm context loads"
echo ""
