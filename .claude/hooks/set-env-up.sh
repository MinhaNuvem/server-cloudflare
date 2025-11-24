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

# Check if Docker is available
if ! command -v docker &> /dev/null; then
  echo "Docker is not available. Skipping devcontainer setup."
  echo "Commands will run directly in the current environment."
  exit 0
fi

# Verify Docker daemon is accessible
if ! docker info &> /dev/null; then
  echo "Docker daemon is not accessible. Skipping devcontainer setup."
  echo "Commands will run directly in the current environment."
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
echo ""
echo "✓ Devcontainer is running with session ID: $DEVCONTAINER_SESSION_ID"
echo ""
echo "Container-level commands (npm, wrangler, etc.) MUST be run via devcontainer exec:"
echo "  devcontainer exec --workspace-folder . --id-label \"session=\$DEVCONTAINER_SESSION_ID\" npm test"
echo "  devcontainer exec --workspace-folder . --id-label \"session=\$DEVCONTAINER_SESSION_ID\" wrangler dev"
echo ""
echo "Host-level commands (git, gh) run directly without devcontainer exec."
echo ""

