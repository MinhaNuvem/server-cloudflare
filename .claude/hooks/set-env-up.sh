#!/bin/bash
set -euo pipefail

DEVCONTAINER_CLI_VERSION="0.80.2"

# Install CLI only for remote Claude Code
if [ "$CLAUDE_CODE_REMOTE" = "true" ]; then
  if ! command -v devcontainer &> /dev/null; then
    echo "Installing @devcontainers/cli@${DEVCONTAINER_CLI_VERSION}..."
    npm install -g "@devcontainers/cli@${DEVCONTAINER_CLI_VERSION}" --silent
  fi
fi

# Check if Docker daemon is accessible
if ! docker info &> /dev/null; then
  exit 0
fi

# Generate unique session ID
DEVCONTAINER_SESSION_ID="claude-$(date +%s)-$$"

# Start dev container with unique session label
devcontainer up --workspace-folder . --id-label "session=$DEVCONTAINER_SESSION_ID"

# Persist session ID for subsequent commands
if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  echo "export DEVCONTAINER_SESSION_ID=$DEVCONTAINER_SESSION_ID" >> "$CLAUDE_ENV_FILE"
fi

# Output usage instructions
cat <<EOF

✓ Devcontainer is running with session ID: $DEVCONTAINER_SESSION_ID

Run container commands via \`devcontainer exec\`:
  devcontainer exec --workspace-folder . --id-label "session=\$DEVCONTAINER_SESSION_ID" npm test

Run host commands (git, gh) directly without \`devcontainer exec\`.

EOF

