# CLAUDE.md

> This file provides project-specific instructions for Claude Code.
> Also see: `AGENTS.md` for general agent guidance and `.cursor/rules/` for complete standards.

## Project Context

Modern Python template using **uv** for dependency management. Enforces type safety, conventional commits, and pre-configured tooling with multi-package support through uv workspaces.

- **Package Manager**: uv
- **Main Package**: `src/your_package/` (rename for each project)
- **Additional Packages**: `/packages/`

## Setup

```bash
uv sync && uv pip install -e .
uv run pre-commit install --hook-type pre-commit --hook-type commit-msg --hook-type pre-push
```

## Standards

**Complete standards in**: `.cursor/rules/python.mdc` and `.cursor/rules/python-testing.mdc`

**Critical requirements**:
- Always add type hints to all functions
- Use absolute imports (from `src/`)
- Use dataclasses for models
- Mock external dependencies in unit tests
- Run `make check` before committing

## Workflow

```bash
# Development
make format lint type-check test

# Commit
./scripts/cz-commit.sh  # or: uv run cz commit

# Test specific markers
uv run pytest -m unit
uv run pytest -m integration
```

## Important

1. Rename `src/your_package/` and update `pyproject.toml` for new projects
2. Use Commitizen for commits (conventional commits required)
3. Pre-commit hooks run automatically on commit
4. See `DEVELOPMENT.md` for detailed tooling documentation
5. See `README.md` for project-specific information
