# AGENTS.md

> Baseline guidance for AI coding agents. For detailed python standards see `.cursor/rules/`.

**your-package**: Python 3.14, uv. Main package at `src/your_package/`, workspace members under `packages/`.

New project from this template? Follow `docs/use-this-template.md` first. It covers renaming the package and removing every template placeholder.

## Development loop

Read `PRINCIPLES.md` and `DEVELOPING.md` before coding work, answering queries or giving advice.
Iterate with path-local ruff/mypy (`src/your_package` or `packages/<pkg>`). Canonical gate: `uv run prek run --all-files`.
Commit only after the gate. Commit rules: `DEVELOPING.md`.
