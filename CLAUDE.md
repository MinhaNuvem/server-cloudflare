# Nuvem: Local Development

**Nuvem is a zero-knowledge Platform-as-a-Service (PaaS) for local-first applications**. It enables individuals and households to leverage cloud infrastructure for synchronisation and collaboration whilst maintaining complete privacy through end-to-end encryption.

This repository contains the Cloudflare implementation of Nuvem's server-side services. For detailed architecture, roadmap, and design decisions, see [`product.md`](./product.md). For security considerations, see [`threats.md`](./threats.md).

## Tech Stack

Built with TypeScript on Cloudflare Workers. Unit tests use Vitest with `@cloudflare/vitest-pool-workers`, coding conventions are enforced by Biome, and deployment is handled through Wrangler.

## Dev Container Workflow

**Nearly all commands MUST be executed via Dev Containers** using the `dev-bin/x-devcontainer` wrapper script:

```bash
# Create container session (returns session ID, e.g., claude-123)
dev-bin/x-devcontainer create

# Execute commands using the session id
dev-bin/x-devcontainer exec claude-123 npm test
dev-bin/x-devcontainer exec claude-123 npm run check   # Lint and format check
dev-bin/x-devcontainer exec claude-123 npm run format  # Auto-fix linting and formatting
dev-bin/x-devcontainer exec claude-123 cat path/to/file.txt

# Cleanup when done (ask user approval first)
dev-bin/x-devcontainer delete claude-123
```

Commands that depend on host-level resources MUST be executed on the host machine. For example, `git` and `gh`, as they need credentials.

## Language

British English MUST be used throughout the codebase, except when using pre-existing terms such as "MIT License".
