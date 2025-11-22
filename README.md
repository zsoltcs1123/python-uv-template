# Python UV Template

A modern, production-ready Python project template using [uv](https://github.com/astral-sh/uv) for fast dependency management.
This template provides a complete development environment with best practices pre-configured, saving you hours of setup time.
Includes full agentic coding support with comprehensive standards for Cursor, Claude, and other AI coding assistants.

## 🚀 Features

This template comes with everything you need to start a professional Python project:

- **⚡ Fast Dependency Management**: Uses `uv` for lightning-fast package installation and resolution
- **🔧 Pre-configured Tools**: Ruff (linting/formatting), Mypy (type checking), Pytest (testing)
- **🪝 Pre-commit Hooks**: Automatic code quality checks on every commit
- **📝 Commitizen Integration**: Interactive CLI for committing and automated versioning
- **📊 Test Coverage**: Pytest with coverage reporting configured
- **🏗️ Modern Project Structure**: Clean, scalable architecture following Python best practices
- **🏢 Monorepo Support**: Optional `packages/` directory for multi-package projects using [uv workspaces](https://docs.astral.sh/uv/concepts/projects/workspaces/)
- **🔒 Security**: Secret detection and file validation hooks
- **📦 Package Ready**: Configured for building and distributing Python packages
- **🚀 CI/CD Ready**: GitHub Actions workflows included
- **⚙️ Makefile**: Convenient shortcuts for common commands
- **🎯 Cursor Integration**: Complete `.cursor/rules/` with detailed Python and testing standards
- **🤖 Multi-Agent Support**: `AGENTS.md` and `CLAUDE.md` reference Cursor rules for cross-agent compatibility

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

3. **Install dependencies and package**:

   ```bash
   uv sync --dev
   uv pip install -e .
   ```

4. **Install pre-commit hooks**:

   ```bash
   uv run pre-commit install --hook-type pre-commit --hook-type commit-msg --hook-type pre-push
   ```

5. **Initialize git repository** (if starting fresh):

   ```bash
   git init
   git add .
   git commit -m "chore: initial commit from template"
   ```

6. **(Optional) Setup convenient aliases**:

   ```bash
   ./scripts/setup-aliases.sh
   # This automatically adds aliases to your ~/.bashrc or ~/.zshrc
   # Run 'source ~/.bashrc' (or ~/.zshrc) or start a new terminal to use them
   ```

**Convenient Aliases** (after running setup-aliases.sh):

- `czc` - Run pre-commit hooks then Commitizen commit (runs `./scripts/cz-commit.sh`)
- `test-cov` - Run tests with coverage (runs `./scripts/test-cov.sh`)

## Development

For detailed information about development tools, workflows, testing, and troubleshooting, see **[DEVELOPMENT.md](DEVELOPMENT.md)**.

Quick reference:

```bash
make check              # Run all checks (format, lint, type-check, test)
./scripts/cz-commit.sh  # Commit with conventional commits
uv run pytest -m unit   # Run unit tests
```

## Using as a GitHub Template

This repository can be used as a GitHub template:

1. Click "Use this template" on GitHub
2. Create your new repository
3. Clone it locally
4. Follow the "Initial Setup" steps above
5. **Customize this README** for your specific project
6. Start coding!

## Documentation Files

- **[DEVELOPMENT.md](DEVELOPMENT.md)** - Development tools, workflows, and troubleshooting
- **[AGENTS.md](AGENTS.md)** - AI coding agent guidance (cross-platform)
- **[CLAUDE.md](CLAUDE.md)** - Claude Code specific guidance
- **`.cursor/rules/`** - Detailed Python and testing standards for Cursor and other agents

## Project Structure Template

When starting a new project, consider adding these files:

- **README.md** - Project-specific overview (replace this file)
- **ARCHITECTURE.md** - System design, tech stack, key components
- **DOMAIN.md** - Business logic, domain models, key workflows
- **DEVELOPMENT.md** - Keep as-is (generic tooling docs)

## License

[Your License Here]
