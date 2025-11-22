# Using This Template

This guide turns a fresh clone of the template into a clean, project-specific repository. Work through it top to bottom. When you finish, **no references to the template's placeholder names should remain anywhere** (`your_package`, `your-package`, `your-project`, `Python UV Template`, etc.).

Throughout this guide, replace:

- `my_package` with your import name (snake_case, e.g. `acme_billing`)
- `my-package` with your distribution name (kebab-case, e.g. `acme-billing`)
- `acme,deps,repo` with your commit scopes

## Prerequisites

- Python 3.14+
- [uv](https://github.com/astral-sh/uv)

## 1. Create the repository

Use the GitHub **"Use this template"** button, or clone and reset history:

```bash
git clone <template-url> my-package && cd my-package
rm -rf .git && git init
```

## 2. Rename the package

```bash
mv src/your_package src/my_package
```

Update the module docstring in `src/my_package/__init__.py` (currently "Your Package - A Python project template.").

## 3. Update `pyproject.toml`

Edit the following:

| Field                                       | Change                                              |
| ------------------------------------------- | --------------------------------------------------- |
| `[project] name`                            | `your-package` → `my-package`                       |
| `[project] description`                     | `"Add your description here"` → real description    |
| `[tool.hatch.build.targets.wheel] packages` | `["src/your_package"]` → `["src/my_package"]`       |
| `[tool.commitizen] version_files`           | `src/your_package/__init__.py` → `src/my_package/…` |

If you are **not** using workspace packages, also delete the empty `packages/` directory and remove the `[tool.uv.workspace]` block (and the commented `[tool.uv.sources]` block). If you **are**, fill them in.

## 4. Update the test suite

- `tests/__init__.py` — fix the docstring (`"""Test package for your_package."""`).
- `tests/unit/test_main.py` — update the import `from your_package.main import main` and the assertion `assert "your_package" in captured.out` to match your package and its actual output.

These are starter tests; replace them with real ones as you build.

## 5. Update commit scopes

In `.pre-commit-config.yaml`, replace the `your_package,deps,repo` line under `conventional-pre-commit` with your project's scopes, e.g. `acme,deps,repo`. Keep `deps` and `repo` if useful.

## 6. Update `ruff.toml`

Uncomment and set `known-first-party` under `[lint.isort]`:

```toml
[lint.isort]
known-first-party = ["my_package"]
```

## 7. Install and verify

```bash
uv sync --dev && uv pip install -e .
prek install --hook-type pre-commit --hook-type commit-msg
prek run --all-files
```

`prek run --all-files` is the canonical gate. It must pass cleanly before you consider setup done.

## 8. Clean up the documentation

The template docs describe the template itself. Strip that framing so the repo reads as *your* project.

### `README.md`

- Replace the title `# Python UV Template` and the template description with your project's name and purpose.
- Delete the **"Use this template" / Setup** numbered steps (steps 1–5 under Quick Start) — they no longer apply once setup is done. Keep a normal install/usage section instead.
- In **Project Structure**, change `your-project/` and `src/your_package/` to your real names, and drop the `(rename for your project)` annotation.
- Remove the link to this guide (`docs/use-this-template.md`) from the Documentation section.
- Replace `[Your License Here]` with your actual license (and add a `LICENSE` file).
- Trim the **Features** list to what your project actually ships (e.g. remove dev-container or workspace bullets if unused).

### `AGENTS.md`

- Replace the `**your-package** -- Python project…` line under `## Repo` with your project's name and a one-line description.
- Update `src/your_package/` to `src/my_package/`.
- Remove the link to this guide.

### `DEVELOPING.md`

- Update the **Scopes** line (`your_package,deps,repo`) to your scopes and drop the "(update … for your project)" note.
- Update the Version Bumping path `src/your_package/__init__.py` to `src/my_package/__init__.py`.
- If you removed workspace packages, drop `--cov=packages` from the coverage command and the `packages` mention in coverage config.

## 9. Final sweep

Confirm nothing template-specific remains:

```bash
grep -rIn -e your_package -e your-package -e your-project \
  -e "Python UV Template" -e "Your License" \
  --exclude-dir=.git --exclude-dir=.venv --exclude=uv.lock .
```

`uv.lock` will still contain `your-package` until you regenerate it — that is fixed by the `uv sync` in step 7. Re-run after syncing; the command should return nothing.

## 10. Delete this guide

Once the sweep is clean, remove this file and the empty `docs/.gitkeep` if no longer needed:

```bash
rm docs/use-this-template.md
```

Setup complete. Commit with a conventional message, e.g. `chore(repo): initialize project from template`.
