#!/bin/bash
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" = "true" ]; then
  # Claude Code for Web can't use `gh`:
  # https://github.com/anthropics/claude-code/issues/11139
  cat <<EOF
The \`gh\` CLI is unavailable. However, this and any other public repository can be queried via the GitHub API using the \`WebFetch\` tool.
EOF

  # Can't use Docker in this environment
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
We're using Dev Containers, so container-level commands (e.g. npm, wrangler) MUST be run via \`devcontainer\`. For example, \`devcontainer exec --workspace-folder . --id-label "session=\$DEVCONTAINER_SESSION_ID" npm test\`.

Host-level commands (e.g. \`git\`) run directly without devcontainer exec.

EOF
