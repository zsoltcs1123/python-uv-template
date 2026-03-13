# AGENTS.md

> Baseline guidance for AI coding agents. For detailed standards see `.cursor/rules/`.

## Repo

**your-package** -- Python project using uv for dependency management. Main package at `src/your_package/`, optional workspace packages under `packages/`.

- **Python**: 3.14+
- **Package Manager**: uv

## Commands

Always use `uv run`. Do not use `make`.

```bash
uv run ruff format .                  # Format
uv run ruff check .                   # Lint
uv run mypy .                         # Type check
uv run pytest                         # Test
prek run --all-files                  # All pre-commit hooks
```

## Development Loop

After making changes, run all checks (`ruff format`, `ruff check`, `mypy`, `pytest`). If any check fails, fix the issue and re-run **all** checks. Repeat until every check passes before considering the task done.

## Important

1. Rename `src/your_package/` and update `pyproject.toml` for new projects
2. See `DEVELOPING.md` for detailed tooling documentation
