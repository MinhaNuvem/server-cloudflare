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
  echo "Docker is not available in this environment. Skipping devcontainer setup."
  echo "Note: Claude Code for Web runs in a sandboxed environment without Docker support."
  exit 0
fi

# Verify Docker daemon is accessible
if ! docker info &> /dev/null; then
  echo "Docker daemon is not accessible. Skipping devcontainer setup."
  echo "Note: This is expected in Claude Code for Web environment."
  exit 0
fi

# Generate unique session ID
DEVCONTAINER_SESSION_ID="claude-$(date +%s)-$$"

# Start dev container with unique session label
devcontainer up --workspace-folder . --id-label "session=$DEVCONTAINER_SESSION_ID"

# Persist session ID for subsequent commands
if [ -n "$CLAUDE_ENV_FILE" ]; then
  echo "export DEVCONTAINER_SESSION_ID=$DEVCONTAINER_SESSION_ID" >> "$CLAUDE_ENV_FILE"
fi

