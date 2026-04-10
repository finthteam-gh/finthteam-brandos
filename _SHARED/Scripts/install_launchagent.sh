#!/bin/bash

# ============================================================
# FINTH BRAND OS — LAUNCHAGENT INSTALLER
# Installs the background auto-sync agent
# Watches for file changes and commits to GitHub silently
# ============================================================

ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ROOT="$ICLOUD/CoWork_Projects"
PLIST_NAME="com.finthteam.brandos.sync"
PLIST_PATH="$HOME/Library/LaunchAgents/$PLIST_NAME.plist"
SYNC_SCRIPT="$ROOT/_SHARED/Scripts/sync_to_github.sh"

echo "⚙️  Installing LaunchAgent: $PLIST_NAME"

# Create LaunchAgents directory if needed
mkdir -p "$HOME/Library/LaunchAgents"

# Write the plist
cat > "$PLIST_PATH" << PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.finthteam.brandos.sync</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/bash</string>
    <string>$SYNC_SCRIPT</string>
  </array>
  <key>WatchPaths</key>
  <array>
    <string>$ROOT/FINTH</string>
    <string>$ROOT/AndamanLife</string>
    <string>$ROOT/HEARTBAKER</string>
    <string>$ROOT/_SHARED</string>
  </array>
  <key>RunAtLoad</key>
  <false/>
  <key>StandardOutPath</key>
  <string>$ROOT/_SHARED/launchagent.log</string>
  <key>StandardErrorPath</key>
  <string>$ROOT/_SHARED/launchagent-error.log</string>
</dict>
</plist>
PLIST

# Load the agent
launchctl unload "$PLIST_PATH" 2>/dev/null || true
launchctl load "$PLIST_PATH"

echo "✅ LaunchAgent installed and running"
echo "   Watching: FINTH / AndamanLife / HEARTBAKER / _SHARED"
echo "   Any file change will auto-commit and push to GitHub silently"
echo "   Logs: $ROOT/_SHARED/sync.log"
