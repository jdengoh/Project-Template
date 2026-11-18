# my-project-template

A FastAPI template for my experimental learning

> [!IMPORTANT]
> After cloning, search and replace `my-project-template` across the whole project with your project name, then run `uv sync`.

> [!WARNING]
> Not building a FastAPI app? Strip the FastAPI parts and keep the tooling (hooks, ruff, commitlint, markdownlint):
>
> 1. Delete `app/`, `tests/`, `Dockerfile`, `.dockerignore`, `docker-compose.yaml` and `scripts/start.sh`
> 2. Remove `fastapi`, `pydantic`, `pydantic-settings`, `pyyaml`, `rich` and `uvicorn` from `pyproject.toml` (and `httpx2` from the dev group)
> 3. Run `uv sync`

[![Python](https://img.shields.io/badge/Python-3.14+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com)
[![uv](https://img.shields.io/badge/uv-DE5FE9?style=for-the-badge&logo=astral&logoColor=white)](https://docs.astral.sh/uv/)

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
  - [Folder Structure](#folder-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
- [Backend Setup](#backend-setup)
  - [Install Dependencies](#install-dependencies)
  - [Running backend with Script](#running-backend-with-script)
  - [Running backend with Docker](#running-backend-with-docker)
  - [Running with Uvicorn](#running-with-uvicorn)
- [Environment Variables](#environment-variables)
- [API Endpoints](#api-endpoints)
- [Development](#development)
- [Contributors](#contributors)
- [License](#license)

## Overview <a id="overview"></a>

TODO: Overview

## Features <a id="features"></a>

TODO: Features

## Project Structure <a id="project-structure"></a>

### Folder Structure <a id="folder-structure"></a>

```sh
app/
  api/            # FastAPI routers (routes/) and shared dependencies (deps.py)
  clients/        # Clients for external services (created in the app lifespan)
  config/         # Logging config (logging.yaml)
  core/           # Core setup, e.g. logging
  schemas/        # Pydantic request/response schemas
  services/       # Service layer / business logic
  app.py          # App factory (create_app) and lifespan
  main.py         # ASGI entrypoint (app.main:app)
  settings.py     # Settings loaded from environment / .env
docs/             # Project documentation
scripts/          # Startup and Git hook scripts
tests/            # Pytest suite
Dockerfile        # Docker build
README.md         # It's THE readme you are reading!
```

## Getting Started <a id="getting-started"></a>

### Prerequisites <a id="prerequisites"></a>

- [Python 3.14 or higher](https://www.python.org/downloads/)
- [uv](https://docs.astral.sh/uv/getting-started/installation/) package and project manager
- [Node.js](https://nodejs.org/) (for commitlint in the Git hooks)
- [Docker](https://docs.docker.com/get-docker/) (optional, for running in a container)

## Backend Setup <a id="backend-setup"></a>

### Install Dependencies <a id="install-dependencies"></a>

This project uses `uv` as the Python package and project manager. `uv sync` creates the `.venv` and installs all dependencies (including dev tools):

```sh
uv sync
```

Prefix commands with `uv run` (e.g. `uv run pytest`), or activate the venv.

On macOS or Linux, run:

```sh
source .venv/bin/activate
```

On Windows, run:

```powershell
.venv/Scripts/activate
```

### Running backend with Script <a id="running-backend-with-script"></a>

On macOS or Linux, run:

```sh
./scripts/start.sh
```

This starts Uvicorn with `--reload` on `http://127.0.0.1:8000`. Override with `APP_HOST` and `APP_PORT`.

### Running backend with Docker <a id="running-backend-with-docker"></a>

```sh
docker compose up --build
```

The container serves on `http://localhost:8000` with `ENVIRONMENT=production`. A `.env` file is loaded if present.

### Running with Uvicorn <a id="running-with-uvicorn"></a>

Run the following command to run the app with Uvicorn:

```sh
uv run uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```

## Environment Variables <a id="environment-variables"></a>

Copy `.env.example` to `.env` in the project root and adjust as needed:

```env
APP_NAME=my-project-template
ENVIRONMENT=dev
```

- Variable names map to fields in `app/settings.py` (case-insensitive).
- Never commit your real `.env` file to version control.

## API Endpoints <a id="api-endpoints"></a>

| Endpoint  | Method | Description                              |
|-----------|--------|------------------------------------------|
| `/health` | GET    | Health check, returns `{"status": "ok"}` |

Interactive API docs are served at `/docs` (Swagger UI) and `/redoc`.

## Development <a id="development"></a>

Install the dev tooling and wire up the Git hooks (pre-commit, commitlint, branch name check):

```sh
uv sync
./scripts/setup_hooks.sh
```

Run the tests and linters:

```sh
uv run pytest
uv run pre-commit run --all-files
```

Branch names must match `main`, `staging`, `release/yyyy-mm-dd`, or `feature|fix|bugfix|hotfix|data|function|job/<name>`. Commits follow [Conventional Commits](https://www.conventionalcommits.org/).

## Contributors <a id="contributors"></a>

TODO: List contributors

## License

MIT
