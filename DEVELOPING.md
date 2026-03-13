# Development Guide

All commands use `uv run`. Works on all platforms.

## Commands

```bash
uv run ruff format .                                    # Format code
uv run ruff check .                                     # Lint
uv run ruff check --fix .                               # Lint + auto-fix
uv run mypy .                                           # Type check
uv run pytest                                           # Run all tests
uv run pytest -m unit                                   # Unit tests only
uv run pytest -m integration                            # Integration tests only
uv run pytest --cov=src --cov=packages                  # Tests with coverage
prek run --all-files                                    # Run all pre-commit hooks
```

A `Makefile` is included for Linux/macOS convenience (`make check`, `make test`, etc.). It wraps the same `uv run` commands.

## Pre-commit Hooks

Managed by [prek](https://github.com/j178/prek). Run automatically on `git commit`:

- ruff format + check
- mypy
- pytest (unit)
- conventional-pre-commit (commit message validation -- strict, scoped)
- detect-secrets
- file validation (YAML, JSON, TOML)

```bash
prek install --hook-type pre-commit --hook-type commit-msg   # Install hooks
prek run --all-files                                         # Run all hooks manually
```

**Configuration**: `.pre-commit-config.yaml`

## Commits

[Conventional Commits](https://www.conventionalcommits.org/) with **required scopes**.

Format: `type(scope): description`

**Scopes**: `your_package,deps,repo` (update in `.pre-commit-config.yaml` for your project)

**Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`

## Version Bumping

[Commitizen](https://commitizen-tools.github.io/commitizen/) handles version bumping and changelog generation:

```bash
uv run cz bump                                          # Bump version based on commits
```

Updates version in `pyproject.toml` and `src/your_package/__init__.py`, generates `CHANGELOG.md`, and creates a git tag.

**Configuration**: `pyproject.toml` -> `[tool.commitizen]`

## Configuration Files

| File                      | Purpose                                   |
| ------------------------- | ----------------------------------------- |
| `pyproject.toml`          | Project metadata, deps, coverage, commitizen |
| `ruff.toml`               | Linting and formatting                    |
| `mypy.ini`                | Type checking                             |
| `pytest.ini`              | Test discovery and markers                |
| `.pre-commit-config.yaml` | Pre-commit hooks                          |
| `.editorconfig`           | Editor formatting consistency             |
| `.secrets.baseline`       | Secret detection false positives          |

## GitHub Actions

Both workflows are disabled by default (manual trigger via `workflow_dispatch` only):

- **CI** (`.github/workflows/ci.yml`) -- lint, type check, test
- **Dependency Updates** (`.github/workflows/dependency-updates.yml`) -- creates PRs for outdated deps

Uncomment `push`/`pull_request` or `schedule` triggers to enable.
