# AGENTS.md

> **Note**: This file provides baseline guidance for AI coding agents.
> For complete, detailed standards see: `.cursor/rules/`

## Project Overview

Modern Python template using **uv** for dependency management. Enforces type safety, conventional commits, and pre-configured tooling with multi-package support through uv workspaces.

- **Python**: 3.14+
- **Package Manager**: uv
- **Main Package**: `src/your_package/` (rename for each project)
- **Additional Packages**: `/packages/`

## Setup

```bash
uv sync --dev && uv pip install -e .
uv run pre-commit install --hook-type pre-commit --hook-type commit-msg --hook-type pre-push
```

## Python Standards

**Complete standards in**: `.cursor/rules/python.mdc` and `.cursor/rules/python-testing.mdc`

## Important

1. Rename `src/your_package/` and update `pyproject.toml` for new projects
2. See `DEVELOPMENT.md` for detailed tooling documentation
3. See `README.md` for project-specific information
