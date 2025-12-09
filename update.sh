#!/bin/bash

# ==============================================================================
# Ahmad's Dotfiles Update Script
# ==============================================================================
# Copies current system configs back to dotfiles directory
# Run this before committing changes to keep dotfiles in sync
# ==============================================================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
    DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi

# ==============================================================================
# Helper Functions
# ==============================================================================

print_header() {
    echo ""
    echo -e "${BLUE}===================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}===================================${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Copy file if it exists
copy_file() {
    local source="$1"
    local target="$2"

    if [ ! -e "$source" ]; then
        print_warning "Source not found: $source"
        return 1
    fi

    # Create parent directory if needed
    mkdir -p "$(dirname "$target")"

    # Copy file
    cp "$source" "$target"

    if [ -f "$target" ]; then
        print_success "Copied: $(basename "$source") → $target"
        return 0
    else
        print_error "Failed to copy: $source"
        return 1
    fi
}

# Copy directory
copy_directory() {
    local source="$1"
    local target="$2"

    if [ ! -d "$source" ]; then
        print_warning "Source directory not found: $source"
        return 1
    fi

    # Create target directory
    mkdir -p "$target"

    # Copy all files from source to target
    cp -r "$source"/* "$target/" 2>/dev/null || true

    print_success "Copied directory: $(basename "$source") → $target"
    return 0
}

# ==============================================================================
# Main Update
# ==============================================================================

print_header "Ahmad's Dotfiles Update"

echo "Dotfiles directory: $DOTFILES_DIR"
echo "This will copy current configs to dotfiles directory"
echo ""

# Verify dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    print_error "Dotfiles directory not found: $DOTFILES_DIR"
    exit 1
fi

# ==============================================================================
# VSCode Configuration
# ==============================================================================

print_header "Updating VSCode Configs"

VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"

if [ ! -d "$VSCODE_USER_DIR" ]; then
    print_warning "VSCode user directory not found"
else
    # Settings
    if [ -f "$VSCODE_USER_DIR/settings.json" ]; then
        copy_file "$VSCODE_USER_DIR/settings.json" "$DOTFILES_DIR/vscode/settings.json"
    else
        print_warning "settings.json not found in VSCode"
    fi

    # Keybindings
    if [ -f "$VSCODE_USER_DIR/keybindings.json" ]; then
        copy_file "$VSCODE_USER_DIR/keybindings.json" "$DOTFILES_DIR/vscode/keybindings.json"
    else
        print_warning "keybindings.json not found in VSCode"
    fi

    # Snippets
    if [ -d "$VSCODE_USER_DIR/snippets" ]; then
        print_info "Copying snippets..."
        mkdir -p "$DOTFILES_DIR/vscode/snippets"

        for snippet in "$VSCODE_USER_DIR/snippets"/*.json; do
            if [ -f "$snippet" ]; then
                snippet_name=$(basename "$snippet")
                copy_file "$snippet" "$DOTFILES_DIR/vscode/snippets/$snippet_name"
            fi
        done
    else
        print_warning "Snippets directory not found"
    fi
fi

# ==============================================================================
# Zsh Configuration
# ==============================================================================

print_header "Updating Zsh Config"

if [ -f "$HOME/.zshrc" ]; then
    copy_file "$HOME/.zshrc" "$DOTFILES_DIR/zsh/.zshrc"
else
    print_warning ".zshrc not found in home directory"
fi

# ==============================================================================
# Git Configuration
# ==============================================================================

print_header "Updating Git Configs"

if [ -f "$HOME/.gitconfig" ]; then
    copy_file "$HOME/.gitconfig" "$DOTFILES_DIR/git/.gitconfig"
else
    print_warning ".gitconfig not found in home directory"
fi

if [ -f "$HOME/.gitignore_global" ]; then
    copy_file "$HOME/.gitignore_global" "$DOTFILES_DIR/git/.gitignore_global"
else
    print_warning ".gitignore_global not found in home directory"
fi

# ==============================================================================
# Git Status
# ==============================================================================

print_header "Git Status"

cd "$DOTFILES_DIR"

# Check if there are changes
if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
    print_info "Changes detected in dotfiles:"
    echo ""
    git status --short
    echo ""
    echo "Next steps:"
    echo "  1. Review changes: git diff"
    echo "  2. Stage changes: git add ."
    echo "  3. Commit: git commit -m 'Update configs'"
    echo "  4. Push: git push"
    echo ""
    echo "Or use aliases:"
    echo "  gaa && gc 'Update configs' && gp"
else
    print_success "No changes detected - dotfiles are up to date!"
fi

# ==============================================================================
# Summary
# ==============================================================================

print_header "Update Complete!"

echo "Updated configs:"
echo "  • VSCode settings, keybindings, and snippets"
echo "  • Zsh configuration"
echo "  • Git configuration"
echo ""

print_success "Done! Your dotfiles are synced! 🎉"
echo ""
