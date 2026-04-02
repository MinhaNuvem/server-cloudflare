# Nuvem: Local Development

**Nuvem is a zero-knowledge Platform-as-a-Service (PaaS) for local-first applications**. It enables individuals and households to leverage cloud infrastructure for synchronisation and collaboration whilst maintaining complete privacy through end-to-end encryption.

This repository contains the Cloudflare implementation of Nuvem's server-side services. For detailed architecture, roadmap, and design decisions, see [`product.md`](./product.md); for security considerations, see [`threats.md`](./threats.md).

## Tech Stack

Built with TypeScript on Cloudflare Workers. Unit tests use Vitest with `@cloudflare/vitest-pool-workers`, coding conventions are enforced by Biome, and deployment is handled through Wrangler.

## Essential Commands

- Run unit tests: `npm test`.
- Check linting and formatting: `npm run check`.
- Fix linting and formatting: `npm run format`.
- Start development server: `npm start`.

## Command Execution

**Nearly all commands MUST be executed via Dev Containers**, as long as `devcontainer` is available:

1. Create a Dev Container: `devcontainer up --workspace-folder=.` (outputs container id in last line upon success).
2. Execute commands using the container id: `devcontainer exec --workspace-folder=. <command>`. For example, `devcontainer exec --workspace-folder=. npm test`.
3. Delete Dev Container(s) when done, after obtaining user approval: `docker rm -fv ${CONTAINER_ID}`.

You MAY have multiple dev containers running simultaneously if you need isolation or parallel processing. In this case, `devcontainer exec` MUST be called with `--container-id` instead of `--workspace-folder`.

Commands that depend on host-level environment variables, processes, and/or files MUST be executed on the host machine. For example, most `gh` and some `git` subcommands require host-level credentials.

## Language

British English MUST be used throughout the codebase, except when using pre-existing terms such as "MIT License".

## References

-[The Messaging Layer Security (MLS) Architecture](https://github.com/mlswg/mls-architecture/raw/refs/heads/main/draft-ietf-mls-architecture.md).
