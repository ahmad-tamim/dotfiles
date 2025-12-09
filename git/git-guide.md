# Git Commands & Aliases Reference

Complete guide to git commands and configured aliases. Use this as your go-to reference.

## Git Aliases from .gitconfig

### Status & Info

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git s` | `git status` | Quick status |
| `git st` | `git status -sb` | Short branch status |
| `git last` | `git log -1 HEAD --stat` | Show last commit with stats |
| `git hist` | Pretty formatted log | Colored log with graph |

**Examples**:
```bash
git s                          # Quick status check
git st                         # Short status with branch
git last                       # What was my last commit?
git hist                       # Pretty commit history
```

### Adding Files

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git a` | `git add` | Add files |
| `git aa` | `git add --all` | Add all changes |
| `git unstage` | `git reset HEAD --` | Unstage files |

**Examples**:
```bash
git a src/                     # Add src directory
git aa                         # Add everything
git unstage file.js            # Unstage specific file
```

### Committing

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git c` | `git commit -m` | Commit with message |
| `git ca` | `git commit --amend` | Amend last commit |
| `git can` | `git commit --amend --no-edit` | Amend without changing message |
| `git undo` | `git reset HEAD~1 --soft` | Undo last commit (keep changes) |

**Examples**:
```bash
git c "Add login feature"      # Quick commit
git ca                         # Fix last commit (opens editor)
git can                        # Fix last commit (keep message)
git undo                       # Oops, undo that commit
```

### Pushing & Pulling

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git p` | `git push` | Push to remote |
| `git pf` | `git push --force-with-lease` | Safe force push |
| `git pl` | `git pull` | Pull from remote |
| `git sync` | Pull then push | Sync with remote |
| `git update` | Fetch all & pull | Update from remote |

**Examples**:
```bash
git p                          # Push changes
git pf                         # Force push (safe way)
git pl                         # Pull latest
git sync                       # Pull and push in one command
git update                     # Fetch and update everything
```

### Branches

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git b` | `git branch` | List branches |
| `git ba` | `git branch -a` | List all branches (including remote) |
| `git bd` | `git branch -d` | Delete branch (safe) |
| `git bdf` | `git branch -D` | Force delete branch |
| `git clean-branches` | Remove merged branches | Clean up old branches |

**Examples**:
```bash
git b                          # See local branches
git ba                         # See all branches
git bd old-feature             # Delete merged branch
git bdf broken-feature         # Force delete
git clean-branches             # Clean up all merged branches
```

### Checkout

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git co` | `git checkout` | Switch branches |
| `git cob` | `git checkout -b` | Create and switch to branch |
| `git discard` | `git checkout --` | Discard file changes |

**Examples**:
```bash
git co main                    # Switch to main
git cob feature/new-api        # Create and switch to new branch
git discard file.js            # Throw away changes to file
```

### Logs & History

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git l` | `git log --oneline -10` | Last 10 commits |
| `git ll` | `git log --oneline -20` | Last 20 commits |
| `git lg` | `git log --graph --oneline --decorate --all -20` | Graph view of history |
| `git hist` | Pretty formatted log | Colored, detailed history |
| `git contributors` | `git shortlog -sn` | Show all contributors |

**Examples**:
```bash
git l                          # Quick look at recent commits
git lg                         # Visual branch graph
git hist                       # Pretty, detailed history
git contributors               # Who contributed to this repo?
```

### Diffs

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git d` | `git diff` | Show unstaged changes |
| `git dc` | `git diff --cached` | Show staged changes |
| `git ds` | `git diff --stat` | Show diff statistics |

**Examples**:
```bash
git d                          # What did I change?
git dc                         # What's staged?
git ds                         # Summary of changes
```

### Stash

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git save` | `git stash save` | Stash changes with message |
| `git pop` | `git stash pop` | Apply and remove stash |
| `git list` | `git stash list` | List all stashes |

**Examples**:
```bash
git save "WIP: new feature"    # Save work in progress
git pop                        # Get it back
git list                       # See all stashes
```

### Local File Ignore

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git ignore` | `git update-index --assume-unchanged` | Ignore file locally |
| `git unignore` | `git update-index --no-assume-unchanged` | Stop ignoring |
| `git ignored` | Show locally ignored files | List ignored files |

**Examples**:
```bash
git ignore config.local.js     # Stop tracking changes to this file
git ignored                    # What am I ignoring?
git unignore config.local.js   # Track it again
```

### Quick Workflows

| Alias | Full Command | Description |
|-------|--------------|-------------|
| `git quick` | Add all, commit with timestamp, push | Quick save & push |

**Examples**:
```bash
git quick                      # Add, commit, push all at once
```

## Common Git Workflows

### Starting New Feature
```bash
git co main                    # Switch to main branch
git pl                         # Get latest changes
git cob feature/new-login      # Create feature branch
# ... do your work ...
git aa                         # Stage all changes
git c "Add new login system"   # Commit
git p                          # Push to remote
```

### Quick Fix
```bash
git cob hotfix/critical-bug    # Create hotfix branch
# ... fix the bug ...
git aa && git c "Fix critical bug" && git p
```

### Update Feature Branch
```bash
git co feature/my-feature      # Switch to feature
git co main                    # Switch to main
git pl                         # Pull latest main
git co feature/my-feature      # Back to feature
git merge main                 # Merge main into feature
# Or use rebase:
git rebase main                # Rebase onto main
```

### Undo Mistakes
```bash
# Undo last commit, keep changes
git undo

# Discard all local changes
git reset --hard HEAD

# Discard changes to specific file
git discard path/to/file.js

# Fix commit message
git ca
```

### Clean Up
```bash
# Remove local merged branches
git clean-branches

# See what will be deleted
git branch --merged | grep -v '\*\|main\|master'

# Clean up everything
git fetch --prune
git clean-branches
```

## Advanced Git Commands

### Interactive Rebase
```bash
# Clean up last 3 commits
git rebase -i HEAD~3

# Rebase onto main
git rebase -i main
```

### Cherry Pick
```bash
# Apply specific commit to current branch
git cherry-pick abc123

# Cherry pick multiple commits
git cherry-pick abc123 def456
```

### Bisect (Find Bad Commit)
```bash
git bisect start
git bisect bad              # Current commit is bad
git bisect good abc123      # This commit was good
# Git will checkout commits to test
git bisect good/bad         # Tell git if commit is good or bad
git bisect reset           # Done, go back
```

### Reflog (Recovery)
```bash
# See all ref updates
git reflog

# Recover deleted branch/commit
git checkout -b recovered-branch abc123
```

## Best Practices

### Commit Messages
```bash
# Good
git c "Add user authentication feature"
git c "Fix navbar mobile responsive issue"
git c "Update dependencies to latest versions"

# Bad
git c "stuff"
git c "WIP"
git c "fix"
```

### Branch Naming
```bash
feature/user-profile
feature/payment-integration
bugfix/navbar-overflow
hotfix/security-patch
refactor/api-client
```

### Before Pushing
```bash
git st                  # Check what you're committing
git d                   # Review your changes
git dc                  # Review staged changes
git l                   # Check commit looks good
```

## Git Configuration

Your `.gitconfig` includes:

- **Default branch**: `main`
- **Editor**: VS Code (`code --wait`)
- **Pull strategy**: Rebase (cleaner history)
- **Push**: Current branch by default
- **Merge tool**: VS Code
- **Diff tool**: VS Code
- **Colors**: Enabled for better readability
- **Auto-prune**: Remove deleted remote branches
- **Credential cache**: 1 hour

## Troubleshooting

### Merge Conflicts
```bash
git st                         # See conflicted files
# Edit files, resolve conflicts
git aa                         # Stage resolved files
git commit                     # Complete merge
```

### Detached HEAD
```bash
git checkout -b temp-branch    # Create branch from detached HEAD
git co main                    # Go back to main
git merge temp-branch          # Merge if needed
```

### Wrong Branch
```bash
git stash                      # Save changes
git co correct-branch          # Switch to right branch
git stash pop                  # Apply changes
```

### Reset Remote Branch
```bash
# DANGER: Only do this if you're sure
git reset --hard origin/main
```

---

**Pro Tip**: Use `git s` after every command to see what changed!
