# AGENTS.md

> Baseline guidance for AI coding agents. For detailed python standards see `.cursor/rules/`.

## Repo

**your-package** -- Python project using uv for dependency management. Main package at `src/your_package/`, optional workspace packages under `packages/`.

- **Python**: 3.14+
- **Package Manager**: uv

> New project from this template? Follow `docs/use-this-template.md` first — it covers renaming the package and removing every template placeholder.

## Development Loop

Before starting any meaningful work:

- Read the engineering principles in `PRINCIPLES.md`.
- Read the detailed development guide in `DEVELOPING.md`.

While iterating, use fast checks for feedback on the affected package only: `uv run ruff check <path>` and `uv run mypy <path>` (e.g. `src/your_package` or a `packages/<pkg>`). Do NOT run the full gate after every edit.

Once, when you believe the work is done, run `prek run --all-files` as the final gate. This is the single canonical gate — it runs formatting, linting, type checking, module size limits, and tests. If any hook fails, fix the issue and re-run `prek run --all-files`. Repeat until every hook passes. Do NOT consider the task done until `prek run --all-files` passes cleanly.

You are allowed to commit only if the canonical gate passes. Follow commit rules precisely from `DEVELOPING.md`. **Subject only, no body.**
