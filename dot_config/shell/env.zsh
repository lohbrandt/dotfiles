#!/usr/bin/env zsh

# ============================================================================
# Environment Variables - Managed by chezmoi
# ============================================================================

# -----------------------------------------------------------------------------
# Editor Configuration
# -----------------------------------------------------------------------------
export EDITOR='code'
export VISUAL='code'
export PAGER='less'

# -----------------------------------------------------------------------------
# Language and Locale
# -----------------------------------------------------------------------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# -----------------------------------------------------------------------------
# Compilation and Build
# -----------------------------------------------------------------------------
export ARCHFLAGS="-arch $(uname -m)"

# -----------------------------------------------------------------------------
# History Configuration
# -----------------------------------------------------------------------------
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
export HISTCONTROL=ignoredups:erasedups

# -----------------------------------------------------------------------------
# Less Configuration
# -----------------------------------------------------------------------------
export LESS='-R -i -w -M -z-4'
export LESSOPEN='|/usr/bin/lesspipe %s'
export LESSCLOSE='/usr/bin/lesspipe %s %s'

# -----------------------------------------------------------------------------
# Development Tools
# -----------------------------------------------------------------------------

# Node.js
export NODE_OPTIONS="--max-old-space-size=4096"

# Python
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# Rust
export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$HOME/.rustup"

# Ruby (Homebrew)
export RUBY_HOME="$(brew --prefix ruby)"
export GEM_HOME="$HOME/.gem"

# -----------------------------------------------------------------------------
# Path Configuration
# -----------------------------------------------------------------------------

# Add common development paths
path_dirs=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$GOBIN"
    "$CARGO_HOME/bin"
    "$RUBY_HOME/bin"
    "$GEM_HOME/bin"
    "/opt/homebrew/lib/ruby/gems/3.4.0/bin"
    "/usr/local/bin"
    "/usr/local/sbin"
)

# Add paths if they exist
for dir in "${path_dirs[@]}"; do
    if [[ -d "$dir" && ":$PATH:" != *":$dir:"* ]]; then
        export PATH="$dir:$PATH"
    fi
done

# -----------------------------------------------------------------------------
# XDG Base Directory Specification
# -----------------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# -----------------------------------------------------------------------------
# Application-specific Configuration
# -----------------------------------------------------------------------------

# Docker
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS="--require-sha"

# GPG
export GPG_TTY=$(tty)

# FZF (if installed)
if command -v fzf &> /dev/null; then
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
    export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.*' 2>/dev/null"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# -----------------------------------------------------------------------------
# macOS-specific Configuration
# -----------------------------------------------------------------------------
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Disable Gatekeeper quarantine for downloaded apps
    export HOMEBREW_CASK_OPTS="--no-quarantine"
    
    # Set default browser (if needed)
    # export BROWSER='open'
fi

# -----------------------------------------------------------------------------
# Security
# -----------------------------------------------------------------------------

# Disable telemetry for various tools
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GATSBY_TELEMETRY_DISABLED=1
export NEXT_TELEMETRY_DISABLED=1
export NUXT_TELEMETRY_DISABLED=1
export ASTRO_TELEMETRY_DISABLED=1

# -----------------------------------------------------------------------------
# Custom Environment Variables
# -----------------------------------------------------------------------------

# Set default projects directory
export PROJECTS_DIR="$HOME/Projects"

# Set default downloads directory
export DOWNLOADS_DIR="$HOME/Downloads"

# Set default documents directory
export DOCUMENTS_DIR="$HOME/Documents"
