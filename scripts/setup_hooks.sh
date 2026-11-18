#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo "🛠️ Setting up Git hooks for the project..."

# Reset hooks path to default in case it was overridden previously
git config --unset core.hooksPath 2>/dev/null || true

# 1. Python dev dependencies (pre-commit is a dev dependency, run via uv)
if ! command -v uv &> /dev/null; then
    echo "❌ Error: uv not found. Install it: https://docs.astral.sh/uv/getting-started/installation/"
    exit 1
fi
echo "📦 Installing Python dev dependencies..."
uv sync

# 2. Node dev dependencies (commitlint runs via npx on commit-msg)
if ! command -v npm &> /dev/null; then
    echo "❌ Error: npm not found. Install Node.js (https://nodejs.org) so commitlint can run."
    exit 1
fi
echo "📦 Installing Node dev dependencies (commitlint)..."
npm ci --no-audit --no-fund

# 3. Wire up all configured hook types in one shot and pre-warm environments
# (hook types are read from `default_install_hook_types` in .pre-commit-config.yaml)
echo "🔧 Wiring up pre-commit hooks..."
uv run pre-commit install --install-hooks

echo "🎉 Git hooks setup completed successfully!"
echo "💡 Tip: Run 'uv run pre-commit run --all-files' to format your repo for the first time."
