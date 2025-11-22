#!/bin/bash
# Setup convenient aliases for Python project development
# Compatible with both bash and zsh
# Run: ./scripts/setup-aliases.sh (or source it)
# This will add aliases permanently to your shell config file

# Get script directory (works in both bash and zsh)
if [ -n "$ZSH_VERSION" ]; then
    # zsh
    SCRIPT_DIR="$(cd "$(dirname "${(%):-%x}")" && pwd)"
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    # bash
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    SHELL_CONFIG="$HOME/.bashrc"
else
    # fallback
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    SHELL_CONFIG="$HOME/.bashrc"
fi

PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SETUP_LINE="source $PROJECT_ROOT/scripts/setup-aliases.sh"

# Add aliases to current shell session
alias czc="$PROJECT_ROOT/scripts/cz-commit.sh"
alias test-cov="$PROJECT_ROOT/scripts/test-cov.sh"

# Check if already added to config file
if grep -qF "$SETUP_LINE" "$SHELL_CONFIG" 2>/dev/null; then
    echo "✓ Aliases already configured in $SHELL_CONFIG"
    echo ""
    echo "Aliases available:"
    echo "  czc       - Run pre-commit hooks then Commitizen commit"
    echo "  test-cov  - Run tests with coverage"
else
    # Add to shell config file
    echo "" >> "$SHELL_CONFIG"
    echo "# Python project aliases" >> "$SHELL_CONFIG"
    echo "$SETUP_LINE" >> "$SHELL_CONFIG"
    echo "✓ Aliases added permanently to $SHELL_CONFIG"
    echo ""
    echo "Aliases available:"
    echo "  czc       - Run pre-commit hooks then Commitizen commit"
    echo "  test-cov  - Run tests with coverage"
    echo ""
    echo "Run 'source $SHELL_CONFIG' or start a new terminal to use aliases."
fi
