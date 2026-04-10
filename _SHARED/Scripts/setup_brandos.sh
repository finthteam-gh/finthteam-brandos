#!/bin/bash

# ============================================================
# FINTH BRAND OS — SETUP SCRIPT
# Creates the full CoWork_Projects folder structure in iCloud Drive
# Run this once on any new Mac after cloning from GitHub
# ============================================================

set -e

ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ROOT="$ICLOUD/CoWork_Projects"

echo ""
echo "================================"
echo "  FINTH Brand OS — Setup"
echo "================================"
echo ""

if [ ! -d "$ICLOUD" ]; then
  echo "❌ iCloud Drive not found. Sign into iCloud first."
  exit 1
fi

echo "✅ iCloud Drive found"
echo "📁 Creating structure at: $ROOT"
echo ""

mkdir -p "$ROOT/_SHARED/Fonts"
mkdir -p "$ROOT/_SHARED/Scripts"
mkdir -p "$ROOT/FINTH/01_Brand_Identity"
mkdir -p "$ROOT/FINTH/02_Design_System"
mkdir -p "$ROOT/FINTH/03_Content_Templates"
mkdir -p "$ROOT/FINTH/C-SUITE"
mkdir -p "$ROOT/FINTH/CLIENTS/JÄÄDE/03_Active_Projects"
mkdir -p "$ROOT/FINTH/CLIENTS/JÄÄDE/04_Deliverables"
mkdir -p "$ROOT/FINTH/04_Active_Projects"
mkdir -p "$ROOT/FINTH/05_Output_Archive"
mkdir -p "$ROOT/AndamanLife/01_Brand_Identity"
mkdir -p "$ROOT/AndamanLife/02_Design_System"
mkdir -p "$ROOT/AndamanLife/STRATEGY"
mkdir -p "$ROOT/AndamanLife/CONTENT/Blog/published"
mkdir -p "$ROOT/AndamanLife/CONTENT/Blog/drafts"
mkdir -p "$ROOT/AndamanLife/CONTENT/Social"
mkdir -p "$ROOT/AndamanLife/CONTENT/Newsletter"
mkdir -p "$ROOT/AndamanLife/PARTNERSHIPS/KOLs"
mkdir -p "$ROOT/AndamanLife/PARTNERSHIPS/Local_Brands"
mkdir -p "$ROOT/AndamanLife/C-SUITE"
mkdir -p "$ROOT/AndamanLife/05_Archive"
mkdir -p "$ROOT/HEARTBAKER/01_Brand_Identity"
mkdir -p "$ROOT/HEARTBAKER/02_Design_System"
mkdir -p "$ROOT/HEARTBAKER/03_Content_Templates"
mkdir -p "$ROOT/HEARTBAKER/C-SUITE"
mkdir -p "$ROOT/HEARTBAKER/04_Active_Projects"
mkdir -p "$ROOT/HEARTBAKER/05_Output_Archive"

echo "✅ All folders created"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"

if [ -d "$REPO_ROOT/FINTH" ]; then
  echo "📄 Copying Brand OS files from repo..."
  cp -rn "$REPO_ROOT/_SHARED/." "$ROOT/_SHARED/" 2>/dev/null || true
  cp -rn "$REPO_ROOT/FINTH/." "$ROOT/FINTH/" 2>/dev/null || true
  cp -rn "$REPO_ROOT/AndamanLife/." "$ROOT/AndamanLife/" 2>/dev/null || true
  cp -rn "$REPO_ROOT/HEARTBAKER/." "$ROOT/HEARTBAKER/" 2>/dev/null || true
  echo "✅ Brand OS files copied"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Install fonts: open _SHARED/Fonts/ and double-click each font file"
echo "  2. Run: bash _SHARED/Scripts/install_launchagent.sh"
echo "  3. Open Claude Desktop → Cowork → create Projects:"
echo "     FINTH:        $ROOT/FINTH"
echo "     AndamanLife:  $ROOT/AndamanLife"
echo "     HEARTBAKER:   $ROOT/HEARTBAKER"
echo ""
