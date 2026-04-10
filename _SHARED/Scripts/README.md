# Scripts — FINTH Brand OS

## Files in This Folder

### setup_brandos.sh
Run once on any Mac to create the full Brand OS folder structure in iCloud Drive.
Also installs fonts and sets up GitHub sync.

Usage: `bash setup_brandos.sh`

### new_mac_setup.sh
Complete new Mac setup in under 10 minutes.
Installs dependencies, syncs from GitHub, installs fonts, sets up LaunchAgent.

Usage: `bash new_mac_setup.sh`

### sync_to_github.sh
Auto-commits all Brand OS changes to GitHub with a timestamped message.
Called automatically by the LaunchAgent — you never need to run this manually.

### com.brandos.sync.plist
macOS LaunchAgent that watches the Brand OS folder for file changes
and triggers sync_to_github.sh automatically.

Installed to: `~/Library/LaunchAgents/com.brandos.sync.plist`

---

## GitHub Repository
`github.com/finthteam-gh/finthteam-brandos` (private)

One-time setup required:
1. Create the private repo at github.com
2. Run `git push -u origin main` from the CoWork_Projects folder
3. LaunchAgent handles all future commits automatically
