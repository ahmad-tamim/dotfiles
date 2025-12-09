# Ahmad's Dotfiles

Production-ready development environment configuration for macOS. Optimized for React/Next.js, TypeScript, and Python development.

## What's Inside

```
dotfiles/
├── vscode/              # VSCode settings, keybindings, and snippets
│   ├── settings.json    # Editor configuration
│   ├── keybindings.json # Custom keyboard shortcuts
│   └── snippets/        # Code snippets (JS, TS, React, Python)
├── zsh/                 # Terminal configuration
│   ├── .zshrc           # Zsh configuration with aliases
│   └── aliases.md       # Complete aliases reference
├── git/                 # Git configuration
│   ├── .gitconfig       # Git settings and aliases
│   ├── .gitignore_global # Global gitignore
│   └── git-guide.md     # Git commands reference
├── docs/                # Documentation
│   └── snippets-guide.md # Complete snippets reference
├── SHORTCUTS.md         # VSCode keyboard shortcuts reference
├── setup.sh             # Installation script
├── update.sh            # Update script (sync configs back)
└── README.md            # This file
```

## Quick Start

### 1. Install Prerequisites

#### Homebrew (if not installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Modern CLI Tools

```bash
brew install eza bat fd ripgrep zoxide
```

#### Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Powerlevel10k Theme

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

#### Fonts (JetBrains Mono Nerd Font)

```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### 2. Clone & Install Dotfiles

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

# Run setup script
cd ~/dotfiles
chmod +x setup.sh
./setup.sh

# Restart terminal
```

### 3. Configure VSCode

The setup script automatically symlinks VSCode configs. Just restart VSCode to apply changes.

#### Required Extensions

Install these VSCode extensions for the best experience:

```bash
# Essentials
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension ms-python.python
code --install-extension ms-python.black-formatter

# UI & Themes
code --install-extension PKief.material-icon-theme
code --install-extension aaron-bond.better-comments

# Optional but Recommended
code --install-extension bradlc.vscode-tailwindcss
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension formulahendry.auto-rename-tag
code --install-extension GitHub.copilot
```

Or install all at once:

```bash
cd ~/dotfiles
cat << 'EOF' | while read ext; do code --install-extension $ext; done
esbenp.prettier-vscode
dbaeumer.vscode-eslint
ms-python.python
ms-python.black-formatter
PKief.material-icon-theme
aaron-bond.better-comments
EOF
```

## Features

### VSCode Configuration

- **Theme**: CodeSandbox with Material Icons
- **Font**: JetBrains Mono with ligatures
- **Auto-save**: On focus change
- **Format on save**: Enabled (Prettier for JS/TS, Black for Python)
- **Smart suggestions**: Optimized for productivity
- **Custom keybindings**: Efficient keyboard shortcuts
- **Snippets**: 100+ snippets for JavaScript, TypeScript, React, Python

### Terminal Setup

- **Shell**: Zsh with Oh My Zsh
- **Theme**: Powerlevel10k
- **Modern tools**:
  - `eza` (better ls)
  - `bat` (better cat)
  - `fd` (better find)
  - `ripgrep` (better grep)
  - `zoxide` (smart cd)
- **Aliases**: 100+ shortcuts for git, docker, npm, python

### Git Configuration

- **Default branch**: main
- **Editor**: VS Code
- **Pull strategy**: Rebase (cleaner history)
- **Merge tool**: VS Code
- **Custom aliases**: 30+ git shortcuts
- **Colors**: Beautiful colored output
- **Auto-prune**: Removes deleted remote branches

## Quick Reference Guides

Open these files whenever you need to remember shortcuts or commands:

- **[SHORTCUTS.md](SHORTCUTS.md)** - Complete VSCode keyboard shortcuts
- **[zsh/aliases.md](zsh/aliases.md)** - All terminal aliases with examples
- **[git/git-guide.md](git/git-guide.md)** - Git commands and aliases
- **[docs/snippets-guide.md](docs/snippets-guide.md)** - All code snippets reference

## Daily Workflow Examples

### Starting a New Feature

```bash
# Terminal
gco main              # Switch to main
gpl                   # Pull latest
gcb feature/new-api   # Create feature branch

# Code in VSCode using snippets:
# rfc → React component
# us → useState
# ue → useEffect

# Commit and push
gaa                   # Stage all
gc "Add API client"   # Commit
gp                    # Push
```

### Quick Docker Setup

```bash
dcb                   # Build and start containers
dcl                   # Watch logs
dps                   # See running containers
dex api bash          # Execute bash in api container
dcd                   # Stop everything
```

### Python Project

```bash
venv                  # Create virtual environment
activate              # Activate it
pipr                  # Install requirements.txt
p3 app.py            # Run app
```

## Updating Your Configs

### Update Dotfiles Repository

When you make changes to your configs and want to update the repo:

```bash
cd ~/dotfiles
./update.sh           # Copies current configs to dotfiles
git aa
gc "Update settings"
gp
```

### Update from Repository

When you want to pull latest dotfiles changes:

```bash
cd ~/dotfiles
git pull
./setup.sh            # Re-run setup to apply changes
```

## Customization

### Adding Your Own Aliases

Edit `~/.zshrc` or `~/dotfiles/zsh/.zshrc`:

```bash
# Add your custom aliases
alias myalias='command here'

# Reload shell
source ~/.zshrc
```

### Adding Custom Snippets

1. Open VSCode
2. `Cmd+Shift+P` → "Configure User Snippets"
3. Choose language
4. Add your snippet in JSON format
5. Run `./update.sh` to save to dotfiles

### Modifying Keybindings

1. Edit `~/dotfiles/vscode/keybindings.json`
2. Restart VSCode
3. Or use `Cmd+K Cmd+S` in VSCode to edit visually

## Scripts Reference

### setup.sh

Creates symlinks from dotfiles to actual config locations. Safe to run multiple times.

```bash
./setup.sh
```

**What it does**:

- Links VSCode settings → `~/Library/Application Support/Code/User/`
- Links `.zshrc` → `~/.zshrc`
- Links `.gitconfig` → `~/.gitconfig`
- Links `.gitignore_global` → `~/.gitignore_global`

### update.sh

Copies current configs back to dotfiles directory.

```bash
./update.sh
```

**What it does**:

- Copies VSCode configs from `~/Library/Application Support/Code/User/`
- Copies `.zshrc` from `~/.zshrc`
- Copies git configs from home directory
- Ready for `git commit` and `git push`

## Troubleshooting

### VSCode settings not applying

```bash
# Check if symlink exists
ls -la ~/Library/Application\ Support/Code/User/settings.json

# Re-run setup
cd ~/dotfiles
./setup.sh

# Restart VSCode
```

### Terminal aliases not working

```bash
# Reload zsh config
source ~/.zshrc

# Check if symlink exists
ls -la ~/.zshrc

# Re-run setup
cd ~/dotfiles
./setup.sh
```

### Modern tools (eza, bat, etc.) not found

```bash
# Install missing tools
brew install eza bat fd ripgrep zoxide

# Reload shell
source ~/.zshrc
```

### Git config not applying

```bash
# Check git config
git config --list

# Re-run setup
cd ~/dotfiles
./setup.sh
```

## Tips & Tricks

### Keyboard Shortcuts (Most Used)

- `Cmd+P` - Quick file open
- `Cmd+Shift+P` - Command palette
- `Cmd+D` - Multi-cursor select next
- `Alt+Up/Down` - Move line
- `Cmd+/` - Toggle comment
- `F2` - Rename symbol

### Terminal Power Moves

```bash
z project          # Jump to project directory (zoxide)
ll                 # Beautiful file list with git status
gll               # Pretty git log
dcb               # Build and run docker containers
```

### Snippet Shortcuts

- `rfc` → React functional component
- `us` → useState hook
- `ue` → useEffect hook
- `try` → try-catch block
- `cl` → console.log
- `imp` → import statement

## Tech Stack

**Editor**: VSCode with CodeSandbox theme
**Terminal**: iTerm2/Terminal with Zsh + Oh My Zsh + Powerlevel10k
**Font**: JetBrains Mono Nerd Font
**Languages**: JavaScript, TypeScript, React, Next.js, Python
**Tools**: Git, Docker, npm/yarn/pnpm

## Contributing

This is a personal dotfiles repository, but feel free to:

- Fork it and customize for your own use
- Open issues for bugs or suggestions
- Submit PRs for improvements

## License

MIT - Feel free to use and modify as you like.

## Author

**Ahmad Tamim**
GitHub: [@ahmad-tamim](https://github.com/ahmad-tamim)

---

**Quick Links**:

- [VSCode Shortcuts](SHORTCUTS.md)
- [Terminal Aliases](zsh/aliases.md)
- [Git Guide](git/git-guide.md)
- [Snippets Reference](docs/snippets-guide.md)

**Need help?** Open an issue or check the documentation files above!
