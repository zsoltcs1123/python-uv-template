# Development Guide

This guide covers the development tools, workflows, and conventions used in this Python UV template project.

## Quick Reference

```bash
make check              # Run all checks (format, lint, type-check, test)
make format             # Format code with Ruff
make lint               # Lint code with Ruff
make type-check         # Type check with Mypy
make test               # Run tests with Pytest
```

## Makefile Commands

The `Makefile` provides convenient shortcuts for common commands:

```bash
make install      # Install dependencies and package
make format       # Format code
make lint         # Lint code
make lint-fix     # Lint and auto-fix
make type-check   # Run type checking
make test         # Run tests
make test-cov     # Run tests with coverage
make check        # Run all checks (format, lint, type-check, test)
make clean        # Clean cache and build artifacts
make help         # Show all available commands
```

## Code Formatting & Linting

**Ruff** handles both linting and formatting.

```bash
# Format code
uv run ruff format .

# Check for linting issues
uv run ruff check .

# Auto-fix linting issues
uv run ruff check --fix .
```

**Configuration**: `ruff.toml`

## Type Checking

**Mypy** performs static type checking.

```bash
# Run type checking
uv run mypy .

# Or use the script
uv run type-check
```

**Configuration**: `mypy.ini`

## Testing

**Pytest** is used for testing with coverage reporting.

```bash
# Run all tests
uv run pytest

# Run only unit tests
uv run pytest -m unit

# Run only integration tests
uv run pytest -m integration

# Run tests with coverage (terminal output)
./scripts/test-cov.sh

# Run specific test file
uv run pytest tests/unit/test_main.py -v
```

**Test Markers**:

- `@pytest.mark.unit` - Fast unit tests (no I/O)
- `@pytest.mark.integration` - Integration tests (require services)
- `@pytest.mark.slow` - Slow running tests
- `@pytest.mark.api` - API endpoint tests

**Configuration**: `pytest.ini`

## Pre-commit Hooks

Pre-commit hooks run automatically on `git commit` to ensure code quality.

**Installed Hooks**:

- Code formatting (ruff format)
- Linting (ruff check)
- Type checking (mypy)
- Unit tests (pytest)
- Commit message validation (commitizen)
- Security scanning (detect-secrets)
- File validation (YAML, JSON, TOML)

**Manual Hook Testing**:

```bash
# Run all hooks on all files
uv run pre-commit run --all-files

# Run specific hook
uv run pre-commit run ruff-check --all-files

# Update hook versions
uv run pre-commit autoupdate
```

## Commit Management

**Commit Types** (Conventional Commits):

- `fix:` - Bug fix
- `feat:` - New feature
- `docs:` - Documentation only
- `style:` - Code style (formatting, no logic change)
- `perf:` - Performance improvements
- `refactor:` - Code refactoring (no feature change)
- `test:` - Adding or updating tests
- `build:` - Build system changes
- `ci:` - CI/CD changes

**Configuration**: `pyproject.toml` → `[tool.commitizen]`

## Version Bumping

When ready to release:

```bash
# Bump version (patch/minor/major based on commits)
uv run cz bump

# This will:
# - Analyze commits since last version
# - Determine next version number
# - Update version in pyproject.toml and __init__.py
# - Generate/update CHANGELOG.md
# - Create git tag
```

**Configuration**: `.pre-commit-config.yaml`

## Project Structure

```
your-project/
├── src/your_package/      # Main package (rename to your package name)
├── tests/                 # Test suite
│   ├── unit/              # Unit tests
│   └── integration/       # Integration tests
├── scripts/               # Utility scripts
├── docs/                  # Documentation
└── infrastructure/        # Infrastructure configs (optional)
├── packages/              # Additional modules/services (optional)

```

**Note**: The `packages/` directory is optional and can be used for additional modules, services, or plugins if your project requires a more complex structure.

## Configuration Files

- `pyproject.toml` - Project metadata, dependencies (runtime + dev groups), tool configs
- `ruff.toml` - Ruff linting and formatting rules
- `mypy.ini` - Type checking configuration
- `pytest.ini` - Test configuration
- `.pre-commit-config.yaml` - Pre-commit hooks configuration
- `.markdownlint.json` - Markdown linting rules for VS Code extension (optional)
- `.secrets.baseline` - Known false positives for secret detection
- `.editorconfig` - Editor configuration for consistent formatting
- `.env.example` - Template for environment variables

## Troubleshooting

### Pre-commit hooks failing

```bash
# Run hooks manually to see detailed errors
uv run pre-commit run --all-files

# Skip hooks temporarily (not recommended)
git commit --no-verify
```

### Type checking errors

```bash
# Check specific file
uv run mypy path/to/file.py

# Ignore specific errors (add to mypy.ini or use # type: ignore)
```

### Test failures

```bash
# Run with verbose output
uv run pytest -v

# Run with output capture disabled
uv run pytest -s

# Run specific test
uv run pytest tests/unit/test_main.py::test_function_name
```

## GitHub Actions Workflows

**Note**: Both GitHub Actions workflows are **disabled by default** to save costs. They can only be manually triggered via `workflow_dispatch`.

### Available Workflows

1. **CI Workflow** (`.github/workflows/ci.yml`)
   - Runs linting, type checking, and tests
   - Currently disabled (no automatic triggers)

2. **Dependency Updates Workflow** (`.github/workflows/dependency-updates.yml`)
   - Checks for dependency updates and creates PRs
   - Currently disabled (no scheduled runs)

### How to Enable Workflows

To enable automatic runs:

1. **Enable CI Workflow**:
   - Edit `.github/workflows/ci.yml`
   - Uncomment the `push` and `pull_request` triggers:

   ```yaml
   on:
     workflow_dispatch:
     push:
       branches: [main, master]
     pull_request:
       branches: [main, master]
   ```

   - Remove the comment block at the top

2. **Enable Dependency Updates Workflow**:
   - Edit `.github/workflows/dependency-updates.yml`
   - Uncomment the `schedule` trigger:

   ```yaml
   on:
     workflow_dispatch:
     schedule:
       # Run every Monday at 9 AM UTC
       - cron: '0 9 * * 1'
   ```

   - Remove the comment block at the top

**Manual Triggering**: Both workflows can be manually triggered from the GitHub Actions tab → Select workflow → "Run workflow" button.

## Additional Resources

- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [Mypy Documentation](https://mypy.readthedocs.io/)
- [Pytest Documentation](https://docs.pytest.org/)
- [Commitizen Documentation](https://commitizen-tools.github.io/commitizen/)
- [Pre-commit Documentation](https://pre-commit.com/)
- [uv Documentation](https://github.com/astral-sh/uv)
