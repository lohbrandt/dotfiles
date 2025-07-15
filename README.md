# Dotfiles managed by chezmoi

This repository contains my personal dotfiles managed by [chezmoi](https://www.chezmoi.io/).

## Files managed

### Core Configuration
- `.zshrc` - Main zsh configuration file
- `.gitconfig` - Git configuration
- `.tool-versions` - asdf version manager configuration
- `Brewfile` - Homebrew package list

### Modular Shell Configuration
- `.config/shell/env.zsh` - Environment variables
- `.config/shell/aliases.zsh` - Command aliases
- `.config/shell/functions.zsh` - Shell functions

### Setup Scripts
- `run_once_install_homebrew.sh` - Homebrew package installation
- `run_once_install_asdf_plugins.sh` - asdf plugin and tool installation
- `scripts/maintenance.sh` - System maintenance
- `scripts/update-brewfile.sh` - Brewfile management

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

**Important:** Before running `chezmoi apply`, ensure that the external/network volume is mounted at `/Volumes/docs`. The Obsidian configuration files will be placed in `/Volumes/docs/obsidian/.obsidian/`.

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

**Configuration editing:**
- `zshconfig` - Edit main .zshrc file
- `aliasconfig` - Edit aliases configuration
- `funcconfig` - Edit functions configuration
- `zshreload` - Reload zsh configuration

## Configuration

The chezmoi configuration is in `.chezmoi.toml` and includes:
- Auto-commit changes to git
- Use VS Code for editing
- Personal information for templates

## Features

### Modular Zsh Configuration

- **Modular Structure**: Configuration split into logical files
- **Environment Variables**: Centralized in `~/.config/shell/env.zsh`
- **Aliases**: Organized in `~/.config/shell/aliases.zsh`
- **Functions**: Collected in `~/.config/shell/functions.zsh`
- **Oh My Zsh**: Modern zsh framework with useful plugins
- **Theme**: robbyrussell (easily customizable)
- **asdf integration**: Automatic version manager initialization
- **Local config**: Support for ~/.zshrc.local for machine-specific settings

#### Modular Benefits
- **Easy maintenance**: Each component in its own file
- **Better organization**: Logical separation of concerns
- **Selective editing**: Edit only what you need
- **Reusability**: Components can be shared across setups

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
- **Ruby exception**: Ruby is managed via Homebrew for better compatibility

### Ruby via Homebrew

- **Installation**: Ruby installed via Homebrew instead of asdf
- **Path management**: Automatically configured in environment
- **Gem management**: Proper gem paths and environment setup
- **Compatibility**: Avoids compilation issues on newer macOS versions

### Obsidian Configuration

- **Location**: Configuration files are placed in `/Volumes/docs/obsidian/.obsidian/`
- **External Volume**: Requires the external/network volume to be mounted at `/Volumes/docs`
- **Conditional Setup**: If the volume is not available, the Obsidian configuration will be skipped
- **JSON Files**: Core Obsidian settings (app.json, appearance.json, etc.) are synced across machines

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

### Obsidian Configuration Issues

#### Volume Not Mounted
If the `/Volumes/docs` volume is not available, the Obsidian configuration will be automatically skipped. You can verify this by checking:

```bash
ls -la /Volumes/docs
```

If the volume is not mounted, either:
1. Mount the external/network volume at `/Volumes/docs`
2. Or run `chezmoi apply` anyway - the Obsidian config will be skipped

#### Force Apply Obsidian Config
If you've mounted the volume after running `chezmoi apply`, you can specifically apply the Obsidian configuration:

```bash
chezmoi apply --force /Volumes/docs/obsidian/.obsidian/
```
