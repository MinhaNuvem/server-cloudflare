# renovate: datasource=docker depName=mcr.microsoft.com/devcontainers/javascript-node
FROM mcr.microsoft.com/devcontainers/javascript-node:22-bookworm@sha256:8ecd955dc231543929c46db04ab1a8962642bed804a84cdebb87a971dd5916d8

WORKDIR /app

# Install dependencies during build for faster dev container startup
COPY package.json package-lock.json ./
RUN npm ci --no-fund --no-update-notifier --no-audit && npm cache clean --force
