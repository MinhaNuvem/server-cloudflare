#!/bin/bash
set -euo pipefail

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

Dev container is running with session ID \`$DEVCONTAINER_SESSION_ID\`.

Container-level commands (npm, wrangler, etc.) MUST be run via \`devcontainer\`. For example, \`devcontainer exec --workspace-folder . --id-label "session=\$DEVCONTAINER_SESSION_ID" npm test\`.

Host-level commands (\`git\`, \`gh\`) run directly without devcontainer exec.

EOF

