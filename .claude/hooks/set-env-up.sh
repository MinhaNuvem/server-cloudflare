#!/bin/bash
set -euo pipefail

if [ "$CLAUDE_CODE_REMOTE" != "true" ]; then
  exit 0
fi

cat <<EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️  DEVELOPMENT ENVIRONMENT NOTICE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

This project requires the Dev Containers CLI for local development.

Most commands must be run inside the dev container:
  • npm install / npm test / npm run check / npm run format
  • wrangler dev / wrangler deploy

Commands that work OUTSIDE the container:
  • git (commit, push, pull, etc.)
  • gh (GitHub CLI commands)

To run commands inside the container:
  devcontainer exec --workspace-folder . npm test

Learn more: https://containers.dev/supporting#devcontainer-cli

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
