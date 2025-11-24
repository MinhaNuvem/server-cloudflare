# Nuvem: Local Development

**Nuvem is a zero-knowledge Platform-as-a-Service (PaaS) for local-first applications**. It enables individuals and households to leverage cloud infrastructure for synchronisation and collaboration whilst maintaining complete privacy through end-to-end encryption.

This repository contains the Cloudflare implementation of Nuvem's server-side services. For detailed architecture, roadmap, and design decisions, see [`product.md`](./product.md).

## Development Environment

This project requires [Dev Containers](https://containers.dev/) for local development.

You MUST run container-level commands, like `npm test` and `wrangler dev`, via the dev containers CLI:

```bash
devcontainer exec --workspace-folder . --id-label "session=$DEVCONTAINER_SESSION_ID" npm test
devcontainer exec --workspace-folder . --id-label "session=$DEVCONTAINER_SESSION_ID" wrangler dev
```

Host-level commands, like `git commit` and `gh pr create`, must be run directly (outside the container):

```bash
git commit -m "Your message"
gh pr create
```

## Tech Stack

Built with TypeScript on Cloudflare Workers. Unit tests use Vitest with `@cloudflare/vitest-pool-workers`, coding conventions are enforced by Biome, and deployment is handled through Wrangler.

## Essential Commands

```bash
npm install
npm test
npm run check   # Lint and format check
npm run format  # Auto-fix linting and formatting
wrangler dev    # Local development server
```

## Language

British English MUST be used throughout the codebase, except when using pre-existing terms such as "MIT License".
