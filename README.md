# Python UV Template

A modern, production-ready Python project template using [uv](https://github.com/astral-sh/uv) for fast dependency management.
Pre-configured tooling, pre-commit hooks, and agentic coding support out of the box.

## Features

- **uv** for fast dependency management and optional [workspace](https://docs.astral.sh/uv/concepts/projects/workspaces/) support
- **Ruff** for linting and formatting
- **Mypy** for strict type checking
- **Pytest** with coverage, markers, and importlib mode
- **prek** for pre-commit hooks (ruff, mypy, pytest, detect-secrets, file validation)
- **conventional-pre-commit** for commit message validation with required scopes
- **Commitizen** for version bumping and changelog generation
- **GitHub Actions** CI and dependency update workflows (disabled by default)
- **Dev Containers** with Python 3.14, zsh, Oh My Zsh, and Powerlevel10k
- **Agent support** via `AGENTS.md` and `.cursor/rules/`

## Quick Start

### Prerequisites

- Python 3.14+
- [uv](https://github.com/astral-sh/uv)

### Setup

1. **Use this template** (GitHub "Use this template" button or clone)

2. **Rename the package**:

   ```bash
   mv src/your_package src/my_package
   ```

   Update `pyproject.toml`: package name, `packages = ["src/my_package"]`, commitizen `version_files`

3. **Install**:

   ```bash
   uv sync --dev && uv pip install -e .
   prek install --hook-type pre-commit --hook-type commit-msg
   ```

4. **Update scopes** in `.pre-commit-config.yaml` (replace `your_package,deps,repo` with your project's scopes)

5. **Start coding**

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
├── packages/              # Optional workspace packages
├── scripts/               # Utility scripts
└── docs/                  # Documentation
```

## Documentation

- **[DEVELOPING.md](DEVELOPING.md)** -- Development tools and workflows
- **[AGENTS.md](AGENTS.md)** -- AI coding agent guidance
- **`.cursor/rules/`** -- Python and testing standards

## License

[Your License Here]
