#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

APP_HOST="${APP_HOST:-127.0.0.1}"
APP_PORT="${APP_PORT:-8000}"

echo "Starting backend on http://${APP_HOST}:${APP_PORT}"
exec uv run uvicorn app.main:app --host "$APP_HOST" --port "$APP_PORT" --reload
