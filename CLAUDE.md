# Nuvem: Local Development

**Nuvem is a zero-knowledge Platform-as-a-Service (PaaS) for local-first applications**. It enables individuals and households to leverage cloud infrastructure for synchronisation and collaboration whilst maintaining complete privacy through end-to-end encryption.

This repository contains the Cloudflare implementation of Nuvem's server-side services. For detailed architecture, roadmap, and design decisions, see [`product.md`](./product.md).

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
