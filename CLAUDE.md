# CLAUDE.md

> This file provides project-specific instructions for Claude Code.
> Also see: `AGENTS.md` for general agent guidance and `.cursor/rules/` for complete standards.

## Project Context

Modern Python template using **uv** for dependency management. Enforces type safety, conventional commits, and pre-configured tooling with multi-package support through uv workspaces.

- **Python**: 3.14+
- **Package Manager**: uv
- **Main Package**: `src/your_package/` (rename for each project)
- **Additional Packages**: `/packages/`

## Setup

```bash
uv sync && uv pip install -e .
uv run pre-commit install --hook-type pre-commit --hook-type commit-msg --hook-type pre-commit
```

## Python Standards

**Complete standards in**: `.cursor/rules/python.mdc` and `.cursor/rules/python-testing.mdc`

## Important

1. Rename `src/your_package/` and update `pyproject.toml` for new projects
2. See `DEVELOPMENT.md` for detailed tooling documentation
3. See `README.md` for project-specific information
