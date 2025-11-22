# Python UV Template

A modern, production-ready Python project template using [uv](https://github.com/astral-sh/uv) for fast dependency management.
Pre-configured tooling, pre-commit hooks, and agentic coding support out of the box.

## Features

- **uv** for fast dependency management and [workspace](https://docs.astral.sh/uv/concepts/projects/workspaces/) support (`packages/`)
- **Ruff** for linting and formatting
- **Mypy** for strict type checking
- **Pytest** with coverage, markers, and importlib mode
- **prek** for pre-commit hooks (ruff, mypy, pytest, detect-secrets, file validation)
- **conventional-pre-commit** for commit message validation with required scopes
- **Commitizen** for version bumping and changelog generation
- **Makefile** wrappers for common `uv run` commands
- **GitHub Actions** CI and **Dependabot** for uv and GitHub Actions updates
- **Dev Containers** with Python 3.14, zsh, Oh My Zsh, and Powerlevel10k
- **Agent support** via `AGENTS.md` and `.cursor/rules/`

## Quick Start

### Prerequisites

- Python 3.14+
- [uv](https://github.com/astral-sh/uv)

### Setup

> **Starting a new project from this template?**
>
> **Follow this [step-by-step guide](docs/use-this-template.md).**
>
> It covers renaming your package, updating configs, and removing every template placeholder.

For an existing project, install and start:

```bash
uv sync --dev && uv pip install -e .
prek install --hook-type pre-commit --hook-type commit-msg
```

## Development

See **[DEVELOPING.md](DEVELOPING.md)** for commands, hooks, commit conventions, and configuration details.

```bash
uv run ruff format .     # Format
uv run ruff check .      # Lint
uv run mypy .            # Type check
uv run pytest            # Test
prek run --all-files     # All pre-commit hooks
```

## Project Structure

```
your-project/
├── src/your_package/      # Main package (rename for your project)
├── tests/                 # Test suite
│   ├── unit/
│   └── integration/
├── packages/              # Workspace members
└── docs/                  # Documentation
```

## Documentation

- **[Use this template](docs/use-this-template.md)** -- Turn this template into a real project
- **[DEVELOPING.md](DEVELOPING.md)** -- Development tools and workflows
- **[AGENTS.md](AGENTS.md)** -- AI coding agent guidance
- **`.cursor/rules/`** -- Python and testing standards

## License

[Your License Here]
