#!/bin/bash

# ==============================================================================
# Ahmad's Dotfiles Setup Script
# ==============================================================================
# Creates symlinks from dotfiles to actual config locations (macOS)
# Safe to run multiple times - will backup existing files
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

# Backup directory
BACKUP_DIR="$DOTFILES_DIR/backup-$(date +%Y%m%d-%H%M%S)"

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

# Backup file if it exists and is not a symlink
backup_if_exists() {
    local file="$1"
    if [ -e "$file" ] && [ ! -L "$file" ]; then
        mkdir -p "$BACKUP_DIR"
        cp -r "$file" "$BACKUP_DIR/"
        print_info "Backed up: $file → $BACKUP_DIR/"
        return 0
    fi
    return 1
}

# Create symlink
create_symlink() {
    local source="$1"
    local target="$2"

    # Check if source exists
    if [ ! -e "$source" ]; then
        print_error "Source does not exist: $source"
        return 1
    fi

    # Backup existing target if needed
    backup_if_exists "$target"

    # Remove existing file/symlink
    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
    fi

    # Create parent directory if needed
    mkdir -p "$(dirname "$target")"

    # Create symlink
    ln -sf "$source" "$target"

    if [ -L "$target" ]; then
        print_success "Linked: $(basename "$source") → $target"
        return 0
    else
        print_error "Failed to link: $source"
        return 1
    fi
}

# ==============================================================================
# Main Setup
# ==============================================================================

print_header "Ahmad's Dotfiles Setup"

echo "Dotfiles directory: $DOTFILES_DIR"
echo "Current directory: $(pwd)"
echo ""

# Verify we're in the right place
if [ ! -f "$DOTFILES_DIR/README.md" ]; then
    print_error "Cannot find README.md. Are you in the dotfiles directory?"
    exit 1
fi

# ==============================================================================
# VSCode Configuration
# ==============================================================================

print_header "Setting up VSCode"

VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"

# Check if VSCode is installed
if [ ! -d "$HOME/Library/Application Support/Code" ]; then
    print_warning "VSCode not found. Install VSCode and run this script again."
else
    mkdir -p "$VSCODE_USER_DIR"

    # Settings
    if [ -f "$DOTFILES_DIR/vscode/settings.json" ]; then
        create_symlink "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
    else
        print_warning "settings.json not found in dotfiles"
    fi

    # Keybindings
    if [ -f "$DOTFILES_DIR/vscode/keybindings.json" ]; then
        create_symlink "$DOTFILES_DIR/vscode/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"
    else
        print_warning "keybindings.json not found in dotfiles"
    fi

    # Snippets
    if [ -d "$DOTFILES_DIR/vscode/snippets" ]; then
        print_info "Linking snippets..."
        mkdir -p "$VSCODE_USER_DIR/snippets"

        for snippet in "$DOTFILES_DIR/vscode/snippets"/*.json; do
            if [ -f "$snippet" ]; then
                snippet_name=$(basename "$snippet")
                create_symlink "$snippet" "$VSCODE_USER_DIR/snippets/$snippet_name"
            fi
        done
    else
        print_warning "Snippets directory not found"
    fi
fi

# ==============================================================================
# Zsh Configuration
# ==============================================================================

print_header "Setting up Zsh"

if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
    create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
else
    print_warning ".zshrc not found in dotfiles"
fi

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_warning "Oh My Zsh not installed"
    print_info "Install with: sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

# Check if Powerlevel10k is installed
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    print_warning "Powerlevel10k theme not installed"
    print_info "Install with: git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# ==============================================================================
# Git Configuration
# ==============================================================================

print_header "Setting up Git"

if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
    create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
else
    print_warning ".gitconfig not found in dotfiles"
fi

if [ -f "$DOTFILES_DIR/git/.gitignore_global" ]; then
    create_symlink "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"
else
    print_warning ".gitignore_global not found in dotfiles"
fi

# ==============================================================================
# Check Dependencies
# ==============================================================================

print_header "Checking Dependencies"

check_command() {
    if command -v "$1" &> /dev/null; then
        print_success "$1 is installed"
        return 0
    else
        print_warning "$1 is not installed"
        if [ -n "$2" ]; then
            print_info "Install with: $2"
        fi
        return 1
    fi
}

# Modern CLI tools
print_info "Modern CLI tools:"
check_command "eza" "brew install eza"
check_command "bat" "brew install bat"
check_command "fd" "brew install fd"
check_command "rg" "brew install ripgrep"
check_command "zoxide" "brew install zoxide"

echo ""
print_info "Package managers:"
check_command "npm" "Install Node.js from nodejs.org"
check_command "python3" "Install from python.org or 'brew install python'"
check_command "pip" "Comes with python3"
check_command "docker" "Install Docker Desktop"

# ==============================================================================
# Summary
# ==============================================================================

print_header "Setup Complete!"

echo "What was done:"
echo "  • VSCode settings, keybindings, and snippets linked"
echo "  • Zsh configuration linked"
echo "  • Git configuration linked"
echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Backups created in:${NC}"
    echo "  $BACKUP_DIR"
    echo ""
fi

echo "Next steps:"
echo "  1. Restart VSCode to apply settings"
echo "  2. Restart terminal or run: source ~/.zshrc"
echo "  3. Install missing dependencies (see warnings above)"
echo "  4. Configure Powerlevel10k: p10k configure"
echo ""

echo "Documentation:"
echo "  • VSCode shortcuts: $DOTFILES_DIR/SHORTCUTS.md"
echo "  • Terminal aliases: $DOTFILES_DIR/zsh/aliases.md"
echo "  • Git guide: $DOTFILES_DIR/git/git-guide.md"
echo "  • Snippets guide: $DOTFILES_DIR/docs/snippets-guide.md"
echo ""

print_success "Done! Enjoy your new setup! 🚀"
echo ""
