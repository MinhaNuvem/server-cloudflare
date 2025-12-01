#!/bin/bash
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" = "true" ]; then
  # This is Claude Code for Web

  npm ci --no-fund --no-update-notifier --no-audit

  echo "Neither Docker nor Dev Containers are available."
fi
