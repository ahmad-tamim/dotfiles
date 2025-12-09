# Terminal Aliases Reference

Quick reference for all configured terminal aliases. Open this when you forget what an alias does.

## Modern CLI Tools

These aliases use modern replacements for classic Unix tools. Make sure to install them first!

| Alias | Command | Description |
|-------|---------|-------------|
| `ls` | `eza --icons` | Modern ls replacement with icons |
| `ll` | `eza -lah --icons --git` | Long format list with git status |
| `la` | `eza -a --icons` | List all files including hidden |
| `lt` | `eza --tree --level=3 --icons` | Tree view (3 levels deep) |
| `cat` | `bat` | Syntax-highlighted cat alternative |
| `find` | `fd` | Fast and user-friendly find alternative |
| `grep` | `rg` | Fast ripgrep search tool |
| `cd` | `z` | Smart directory jumper (zoxide) |

**Installation (if missing)**:
```bash
brew install eza bat fd ripgrep zoxide
```

## Git Aliases

Quick shortcuts for common git operations.

### Status & Info
| Alias | Command | Description |
|-------|---------|-------------|
| `gst` | `git status` | Show working tree status |
| `gl` | `git log --oneline --graph --decorate -20` | Pretty log (last 20) |
| `gll` | `git log --oneline --graph --decorate` | Pretty log (all) |
| `gd` | `git diff` | Show changes in working directory |
| `gb` | `git branch` | List branches |

### Checkout & Branching
| Alias | Command | Description |
|-------|---------|-------------|
| `gco` | `git checkout` | Switch branches |
| `gcb` | `git checkout -b` | Create and switch to new branch |
| `gbd` | `git branch -d` | Delete branch (safe) |

### Add & Commit
| Alias | Command | Description |
|-------|---------|-------------|
| `ga` | `git add` | Add files to staging |
| `gaa` | `git add .` | Add all changes |
| `gc` | `git commit -m` | Commit with message |
| `gca` | `git commit --amend` | Amend last commit |

### Push & Pull
| Alias | Command | Description |
|-------|---------|-------------|
| `gp` | `git push` | Push to remote |
| `gpl` | `git pull` | Pull from remote |

### Merge & Rebase
| Alias | Command | Description |
|-------|---------|-------------|
| `gm` | `git merge` | Merge branch |
| `gr` | `git rebase` | Rebase current branch |
| `grs` | `git reset` | Reset HEAD |

### Stash
| Alias | Command | Description |
|-------|---------|-------------|
| `gsh` | `git stash` | Stash changes |
| `gsp` | `git stash pop` | Apply and remove stash |

**Examples**:
```bash
gst                    # Check status
gaa                    # Stage all changes
gc "Add new feature"   # Commit with message
gp                     # Push to remote

gcb feature/new-api    # Create new branch
gco main               # Switch back to main
gm feature/new-api     # Merge feature branch
```

## Docker Aliases

Shortcuts for Docker and Docker Compose commands.

### Basic Docker
| Alias | Command | Description |
|-------|---------|-------------|
| `d` | `docker` | Docker base command |
| `dps` | `docker ps` | List running containers |
| `dpsa` | `docker ps -a` | List all containers |
| `di` | `docker images` | List images |
| `dex` | `docker exec -it` | Execute command in container |
| `drm` | `docker rm` | Remove container |
| `drmi` | `docker rmi` | Remove image |
| `dprune` | `docker system prune -af` | Clean up everything |

### Docker Compose
| Alias | Command | Description |
|-------|---------|-------------|
| `dc` | `docker-compose` | Docker Compose base |
| `dcb` | `docker-compose up --build` | Build and start services |
| `dcu` | `docker-compose up -d` | Start services (detached) |
| `dcd` | `docker-compose down` | Stop and remove containers |
| `dcl` | `docker-compose logs -f` | Follow logs |

**Examples**:
```bash
dps                          # See running containers
dex my-container bash        # Open bash in container
dcb                          # Rebuild and start all services
dcl                          # Watch logs
dcd                          # Stop everything
dprune                       # Clean up unused resources
```

## NPM Aliases

Speed up npm commands.

| Alias | Command | Description |
|-------|---------|-------------|
| `ni` | `npm install` | Install dependencies |
| `nid` | `npm install --save-dev` | Install dev dependency |
| `nr` | `npm run` | Run npm script |
| `ns` | `npm start` | Start development server |
| `nt` | `npm test` | Run tests |
| `nb` | `npm run build` | Build for production |
| `nu` | `npm update` | Update dependencies |

**Examples**:
```bash
ni                    # Install all dependencies
nid prettier          # Install prettier as dev dependency
nr dev                # Run "dev" script
nt                    # Run tests
```

## Yarn Aliases

Quick Yarn shortcuts.

| Alias | Command | Description |
|-------|---------|-------------|
| `y` | `yarn` | Yarn base command |
| `ya` | `yarn add` | Add dependency |
| `yr` | `yarn remove` | Remove dependency |
| `ys` | `yarn start` | Start development |

**Examples**:
```bash
y                     # Install dependencies
ya react react-dom    # Add React
yr lodash            # Remove lodash
```

## pnpm Aliases

Fast, disk-efficient package manager.

| Alias | Command | Description |
|-------|---------|-------------|
| `pn` | `pnpm` | pnpm base command |
| `pni` | `pnpm install` | Install dependencies |
| `pnr` | `pnpm run` | Run script |

**Examples**:
```bash
pni                   # Install dependencies
pnr dev              # Run dev script
```

## Python Aliases

Python and pip shortcuts.

### Python Basics
| Alias | Command | Description |
|-------|---------|-------------|
| `p3` | `python3` | Python 3 interpreter |
| `venv` | `python3 -m venv venv` | Create virtual environment |
| `activate` | `source venv/bin/activate` | Activate virtual environment |

### Pip Commands
| Alias | Command | Description |
|-------|---------|-------------|
| `pipi` | `pip install` | Install package |
| `pipu` | `pip install --upgrade` | Upgrade package |
| `pipr` | `pip install -r requirements.txt` | Install from requirements |
| `pipf` | `pip freeze > requirements.txt` | Export requirements |
| `piplist` | `pip list` | List installed packages |
| `pipout` | `pip list --outdated` | Show outdated packages |

**Examples**:
```bash
venv                     # Create virtual environment
activate                 # Activate it
pipi fastapi uvicorn     # Install packages
pipf                     # Export to requirements.txt
```

## Navigation Aliases

Quick directory navigation.

| Alias | Command | Description |
|-------|---------|-------------|
| `..` | `cd ..` | Go up one directory |
| `...` | `cd ../..` | Go up two directories |
| `....` | `cd ../../..` | Go up three directories |
| `~` | `cd ~` | Go to home directory |
| `-` | `cd -` | Go to previous directory |

**Examples**:
```bash
...                   # Go up 2 directories
-                     # Go back to previous directory
~                     # Go home
```

## File Operations

Safer file operations (interactive mode).

| Alias | Command | Description |
|-------|---------|-------------|
| `mkdir` | `mkdir -pv` | Create directories (verbose, parents) |
| `cp` | `cp -iv` | Copy (interactive, verbose) |
| `mv` | `mv -iv` | Move/rename (interactive, verbose) |
| `rm` | `rm -iv` | Remove (interactive, verbose) |

**Note**: These aliases ask for confirmation before overwriting/deleting.

## Utility Aliases

General purpose shortcuts.

| Alias | Command | Description |
|-------|---------|-------------|
| `h` | `history` | Show command history |
| `c` | `clear` | Clear terminal screen |
| `q` | `exit` | Exit terminal |
| `zshedit` | `nano ~/.zshrc` | Edit zsh config |

**Examples**:
```bash
h                     # See recent commands
h | grep docker       # Search command history
c                     # Clear screen
```

## Pro Tips

### Combining Aliases
```bash
# Quick git workflow
gaa && gc "Fix bug" && gp

# Quick Docker cleanup
dcd && dprune

# Python project setup
venv && activate && pipr
```

### Zoxide (Smart CD)
The `cd` alias uses zoxide, which learns your most-used directories:

```bash
z dotfiles           # Jump to dotfiles from anywhere
z dow               # Fuzzy match - jumps to Downloads
z ..                # Still works like regular cd
```

### Eza Power Usage
```bash
ll                  # Detailed list with git status
lt                  # Tree view
la | grep test      # List all, filter for "test"
```

### Git Log Tricks
```bash
gl                  # Last 20 commits, pretty
gll | head -5       # First 5 commits
gl --author="Ahmad" # Your commits only
```

---

**Need to add more aliases?** Edit `~/.zshrc` and reload with `source ~/.zshrc`
