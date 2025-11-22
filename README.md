# Python UV Template

A modern, production-ready Python project template using [uv](https://github.com/astral-sh/uv) for fast dependency management. This template provides a complete development environment with best practices pre-configured, saving you hours of setup time.

## 🚀 Features

This template comes with everything you need to start a professional Python project:

- **⚡ Fast Dependency Management**: Uses `uv` for lightning-fast package installation and resolution
- **🔧 Pre-configured Tools**: Ruff (linting/formatting), Mypy (type checking), Pytest (testing)
- **📝 Commitizen Integration**: Enforces conventional commits and automated versioning
- **🪝 Pre-commit Hooks**: Automatic code quality checks on every commit
- **📊 Test Coverage**: Pytest with coverage reporting configured
- **🏗️ Modern Project Structure**: Clean, scalable architecture following Python best practices
- **🔒 Security**: Secret detection and file validation hooks
- **📦 Package Ready**: Configured for building and distributing Python packages
- **🚀 CI/CD Ready**: GitHub Actions workflow included
- **⚙️ Makefile**: Convenient shortcuts for common commands

## ⏱️ Time Saved

Starting a new Python project typically requires:
- Setting up project structure (30+ minutes)
- Configuring linting and formatting tools (20+ minutes)
- Setting up testing framework (15+ minutes)
- Configuring pre-commit hooks (15+ minutes)
- Setting up type checking (10+ minutes)
- Configuring CI/CD workflows (20+ minutes)
- Writing documentation (30+ minutes)

**Total: ~2.5 hours** → **This template: ~5 minutes** ⚡

## Quick Start

### Prerequisites

- Python 3.14+
- [uv](https://github.com/astral-sh/uv) package manager
- Git

### Initial Setup

1. **Clone this repository** (or use GitHub's template feature):
   ```bash
   git clone <your-repo-url> my-project
   cd my-project
   ```

2. **Customize the project name**:
   ```bash
   # Rename the package directory
   mv src/your_package src/my_package

   # Update pyproject.toml:
   # - Change name = "your-package" to your desired package name
   # - Update packages = ["src/your_package"] to ["src/my_package"]
   # - Update version_files paths if needed

   # Update imports in tests/unit/test_main.py:
   # - Change "from your_package.main import main" to "from my_package.main import main"

   # Update src/my_package/__init__.py with your project description
   ```

3. **Install dependencies**:
   ```bash
   uv sync
   ```

4. **Install package in editable mode**:
   ```bash
   uv pip install -e .
   ```

5. **Install pre-commit hooks**:
   ```bash
   uv run pre-commit install --hook-type pre-commit --hook-type commit-msg --hook-type pre-push
   ```

6. **Initialize git repository** (if starting fresh):
   ```bash
   git init
   git add .
   git commit -m "chore: initial commit from template"
   ```

7. **(Optional) Setup convenient aliases**:
   ```bash
   ./scripts/setup-aliases.sh
   # This automatically adds aliases to your ~/.bashrc or ~/.zshrc
   # Run 'source ~/.bashrc' (or ~/.zshrc) or start a new terminal to use them
   ```

**Convenient Aliases** (after running setup-aliases.sh):
- `czc` - Run pre-commit hooks then Commitizen commit
- `test-cov` - Run tests with coverage

## Development Tools

### Code Formatting & Linting

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

### Type Checking

**Mypy** performs static type checking.

```bash
# Run type checking
uv run mypy .

# Or use the script
uv run type-check
```

**Configuration**: `mypy.ini`

### Testing

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

### Commit Management

**Commitizen** enforces conventional commits and manages versions.

```bash
# Create a commit interactively (recommended)
# Option 1: Run hooks first, then commit (recommended)
./scripts/cz-commit.sh

# Option 2: Standard commit (hooks run after via git hooks)
uv run cz commit
# or shortcut
uv run cz c

# Bump version and update changelog
uv run cz bump

# Check if commit message is valid
uv run cz check

# View current version
uv run cz version -p
```

**Recommended Workflow**: Use `./scripts/cz-commit.sh` to run pre-commit hooks before the interactive commit prompt. This ensures code quality checks pass before you write the commit message.

**Commit Types** (Conventional Commits):
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Configuration**: `pyproject.toml` → `[tool.commitizen]`

### Pre-commit Hooks

Pre-commit hooks run automatically on `git commit` to ensure code quality.

**Installed Hooks**:
- Code formatting (ruff format)
- Linting (ruff check)
- Type checking (mypy)
- Unit tests (pytest)
- Commit message validation (commitizen)
- Security scanning (detect-secrets)
- File validation (YAML, JSON, TOML)

**Manual Testing**:
```bash
# Run all hooks on all files
uv run pre-commit run --all-files

# Run specific hook
uv run pre-commit run ruff-check --all-files

# Update hook versions
uv run pre-commit autoupdate
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
```

**Note**: The `packages/` directory is optional and can be used for additional modules, services, or plugins if your project requires a more complex structure.

## Configuration Files

- `pyproject.toml` - Project metadata, dependencies, tool configs
- `ruff.toml` - Ruff linting and formatting rules
- `mypy.ini` - Type checking configuration
- `pytest.ini` - Test configuration
- `.pre-commit-config.yaml` - Pre-commit hooks configuration
- `.secrets.baseline` - Known false positives for secret detection
- `.editorconfig` - Editor configuration for consistent formatting
- `.env.example` - Template for environment variables

## Makefile Commands

For convenience, a `Makefile` is included with common commands:

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

## Common Workflows

### Making Changes

1. **Create a feature branch**
   ```bash
   git checkout -b feat/my-feature
   ```

2. **Make your changes**

3. **Format and lint**
   ```bash
   uv run ruff format .
   uv run ruff check --fix .
   ```

4. **Run tests**
   ```bash
   uv run pytest
   ```

5. **Commit with Commitizen**
   ```bash
   # Recommended: Run hooks first, then commit
   ./scripts/cz-commit.sh
   # Or if you've set up aliases:
   czc

   # Alternative: Standard commit (hooks run after via git hooks)
   uv run cz commit
   ```
   Pre-commit hooks will run automatically and validate your code.

6. **Push** (pre-push hooks will validate branch name)

### Version Bumping

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

## Using as a GitHub Template

This repository can be used as a GitHub template:

1. Click "Use this template" on GitHub
2. Create your new repository
3. Clone it locally
4. Follow the "Customize the project name" steps above
5. Start coding!

## Additional Resources

- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [Mypy Documentation](https://mypy.readthedocs.io/)
- [Pytest Documentation](https://docs.pytest.org/)
- [Commitizen Documentation](https://commitizen-tools.github.io/commitizen/)
- [Pre-commit Documentation](https://pre-commit.com/)
- [uv Documentation](https://github.com/astral-sh/uv)
