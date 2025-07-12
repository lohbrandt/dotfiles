# Dotfiles managed by chezmoi

This repository contains my personal dotfiles managed by [chezmoi](https://www.chezmoi.io/).

## Files managed

- `.zshrc` - Zsh configuration with Oh My Zsh
- `.gitconfig` - Git configuration
- `.tool-versions` - asdf version manager configuration
- `Brewfile` - Homebrew package list
- Setup scripts for automated installation

## Setup

### Install chezmoi (if not already installed)

```bash
brew install chezmoi
```

### Initialize chezmoi with this repository

```bash
chezmoi init
```

### Apply the dotfiles

```bash
chezmoi apply
```

## Daily usage

### Check what would change

```bash
chezmoi diff
```

### Apply changes

```bash
chezmoi apply
```

### Edit a file

```bash
chezmoi edit ~/.zshrc
```

### Add a new file

```bash
chezmoi add ~/.newfile
```

### Common aliases (available after sourcing .zshrc)

**chezmoi shortcuts:**
- `cm` - chezmoi
- `cma` - chezmoi apply
- `cmd` - chezmoi diff
- `cms` - chezmoi status
- `cme` - chezmoi edit

**Homebrew shortcuts:**
- `brewup` - Update, upgrade, and cleanup Homebrew
- `brewfile` - Update Brewfile with current packages
- `brewinstall` - Install packages from Brewfile

**asdf shortcuts:**
- `asdfup` - Update all asdf plugins
- `asdflist` - List all installed versions
- `asdfglobal` - Show global versions

**System maintenance:**
- `sysmaint` - Run comprehensive system maintenance

## Configuration

The chezmoi configuration is in `.chezmoi.toml` and includes:
- Auto-commit changes to git
- Use VS Code for editing
- Personal information for templates

## Features

### Zsh Configuration

- **Oh My Zsh**: Modern zsh framework
- **Plugins**: git, asdf, brew, macos
- **Theme**: robbyrussell
- **asdf integration**: Automatic version manager initialization
- **Useful aliases**: Git shortcuts, development tools
- **Functions**: mkcd, gcb for common tasks
- **Local config**: Support for ~/.zshrc.local for machine-specific settings

### Git Configuration

- Your personal git settings
- Managed through chezmoi templates

### Homebrew Integration

- **Brewfile**: Automatically managed list of installed packages
- **Auto-update**: Brewfile updates automatically when chezmoi status is checked
- **Installation scripts**: Automated setup for new machines
- **Maintenance**: Built-in scripts for system maintenance

### asdf Integration

- **Tool versions**: .tool-versions file for consistent development environments
- **Auto-installation**: Scripts to install plugins and versions automatically
- **Plugin management**: Easy updates and maintenance
- **Cross-machine sync**: Automatically synced across machines

## Best Practices

1. **Edit files through chezmoi**: Use `chezmoi edit` instead of editing files directly
2. **Check differences**: Always run `chezmoi diff` before applying
3. **Commit changes**: The setup auto-commits to track changes
4. **Use local configs**: Put machine-specific settings in `~/.zshrc.local`
5. **Keep it simple**: Don't over-engineer your dotfiles

## Troubleshooting

### Re-apply all files

```bash
chezmoi apply --force
```

### Check chezmoi status

```bash
chezmoi status
```

### Reset a file

```bash
chezmoi apply --force ~/.zshrc
```
