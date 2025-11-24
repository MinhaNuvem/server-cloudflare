#!/bin/bash
set -euo pipefail

DEVCONTAINER_CLI_VERSION="0.80.2"

if [ "$CLAUDE_CODE_REMOTE" != "true" ]; then
  exit 0
fi

# Install Dev Containers CLI if not present
if ! command -v devcontainer &> /dev/null; then
  echo "Installing @devcontainers/cli@${DEVCONTAINER_CLI_VERSION}..."
  npm install -g "@devcontainers/cli@${DEVCONTAINER_CLI_VERSION}" --silent
fi

cat <<EOF
⚠️  Dev Containers required
   Container (via CLI): npm test, wrangler dev
   Host: git commit, gh pr create
EOF
