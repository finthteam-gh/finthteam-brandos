#!/bin/bash
# FINTH OS — Auto-push hook
# Fires after every Claude Code session
# Commits and pushes all changes to GitHub automatically

cd ~/Dev/finth-os || exit 1

# Check if there is anything to commit
if git diff --quiet && git diff --staged --quiet; then
  echo "Auto-push: nothing to commit."
  exit 0
fi

# Stage all changes
git add .

# Commit with timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H%M")
git commit -m "auto: session $TIMESTAMP"

# Push to GitHub
git push origin main

echo "Auto-push: committed and pushed at $TIMESTAMP"
