#!/usr/bin/env zsh

# ============================================================================
# Shell Functions - Managed by chezmoi
# ============================================================================

# -----------------------------------------------------------------------------
# Directory Navigation
# -----------------------------------------------------------------------------

# Create directory and cd into it
function mkcd() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: mkcd <directory>"
        return 1
    fi
    mkdir -p "$1" && cd "$1"
}

# cd into directory and list contents
function cdls() {
    if [[ $# -eq 0 ]]; then
        cd && ls
    else
        cd "$1" && ls
    fi
}

# Find and cd into directory
function fcd() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: fcd <directory_name>"
        return 1
    fi
    local dir
    dir=$(find . -type d -name "*$1*" -print -quit 2>/dev/null)
    if [[ -n $dir ]]; then
        cd "$dir"
    else
        echo "Directory not found: $1"
        return 1
    fi
}

# -----------------------------------------------------------------------------
# Git Functions
# -----------------------------------------------------------------------------

# Git branch creation and switch
function gcb() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: gcb <branch_name>"
        return 1
    fi
    git checkout -b "$1"
}

# Git commit with message
function gcom() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: gcom <commit_message>"
        return 1
    fi
    git add . && git commit -m "$1"
}

# Git push current branch
function gpush() {
    local branch=$(git branch --show-current)
    if [[ -n $branch ]]; then
        git push origin "$branch"
    else
        echo "Not on a git branch"
        return 1
    fi
}

# Git log with pretty format
function glog() {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

# Git clone and cd into directory
function gclone() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: gclone <repository_url>"
        return 1
    fi
    git clone "$1" && cd "$(basename "$1" .git)"
}

# -----------------------------------------------------------------------------
# Development Functions
# -----------------------------------------------------------------------------

# Create new Node.js project
function npminit() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: npminit <project_name>"
        return 1
    fi
    mkcd "$1"
    npm init -y
    echo "node_modules/" > .gitignore
    echo "*.log" >> .gitignore
    git init
    git add .
    git commit -m "Initial commit"
}

# Quick HTTP server
function serve() {
    local port=${1:-8000}
    echo "Starting HTTP server on port $port..."
    python -m http.server "$port"
}

# Extract archives
function extract() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: extract <archive_file>"
        return 1
    fi
    
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz) tar xzf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x "$1" ;;
            *.gz) gunzip "$1" ;;
            *.tar) tar xf "$1" ;;
            *.tbz2) tar xjf "$1" ;;
            *.tgz) tar xzf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *.7z) 7z x "$1" ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
        return 1
    fi
}

# -----------------------------------------------------------------------------
# System Functions
# -----------------------------------------------------------------------------

# Show process using port
function port() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: port <port_number>"
        return 1
    fi
    lsof -i ":$1"
}

# Kill process on port
function killport() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: killport <port_number>"
        return 1
    fi
    local pid=$(lsof -ti ":$1")
    if [[ -n $pid ]]; then
        kill -9 "$pid"
        echo "Killed process on port $1"
    else
        echo "No process found on port $1"
        return 1
    fi
}

# Get file size
function filesize() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: filesize <file>"
        return 1
    fi
    if [[ -f $1 ]]; then
        du -h "$1"
    else
        echo "'$1' is not a valid file"
        return 1
    fi
}

# Create backup of file
function backup() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: backup <file>"
        return 1
    fi
    if [[ -f $1 ]]; then
        cp "$1" "$1.backup.$(date +%Y%m%d-%H%M%S)"
        echo "Backup created: $1.backup.$(date +%Y%m%d-%H%M%S)"
    else
        echo "'$1' is not a valid file"
        return 1
    fi
}

# -----------------------------------------------------------------------------
# Search Functions
# -----------------------------------------------------------------------------

# Find files by name
function ff() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: ff <filename>"
        return 1
    fi
    find . -name "*$1*" -type f
}

# Find directories by name
function fd() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: fd <dirname>"
        return 1
    fi
    find . -name "*$1*" -type d
}

# Grep with color and line numbers
function search() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: search <pattern> [file/directory]"
        return 1
    fi
    local pattern=$1
    local target=${2:-.}
    grep -rn --color=always "$pattern" "$target"
}

# -----------------------------------------------------------------------------
# Homebrew Functions
# -----------------------------------------------------------------------------

# Install and add to Brewfile
function brewi() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: brewi <package_name>"
        return 1
    fi
    brew install "$1" && brewfile
}

# Install cask and add to Brewfile
function brewic() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: brewic <cask_name>"
        return 1
    fi
    brew install --cask "$1" && brewfile
}

# -----------------------------------------------------------------------------
# asdf Functions
# -----------------------------------------------------------------------------

# Install asdf plugin and latest version
function asdf_install_latest() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: asdf_install_latest <plugin_name>"
        return 1
    fi
    asdf plugin add "$1" 2>/dev/null || true
    local latest=$(asdf latest "$1")
    asdf install "$1" "$latest"
    asdf global "$1" "$latest"
}

# List available versions for a plugin
function asdf_versions() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: asdf_versions <plugin_name>"
        return 1
    fi
    asdf list all "$1"
}

# -----------------------------------------------------------------------------
# Utility Functions
# -----------------------------------------------------------------------------

# Weather
function weather() {
    local location=${1:-""}
    curl -s "wttr.in/$location"
}

# QR Code generator
function qr() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: qr <text>"
        return 1
    fi
    curl -s "qrenco.de/$1"
}

# Generate random password
function genpass() {
    local length=${1:-16}
    openssl rand -base64 "$length" | tr -d "=+/" | cut -c1-"$length"
}

# Convert to lowercase
function lowercase() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: lowercase <text>"
        return 1
    fi
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

# Convert to uppercase
function uppercase() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: uppercase <text>"
        return 1
    fi
    echo "$1" | tr '[:lower:]' '[:upper:]'
}

# -----------------------------------------------------------------------------
# chezmoi Functions
# -----------------------------------------------------------------------------

# Quick edit and apply
function cmedit() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: cmedit <file>"
        return 1
    fi
    chezmoi edit "$1" && chezmoi apply "$1"
}

# Add file to chezmoi and apply
function cmadd() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: cmadd <file>"
        return 1
    fi
    chezmoi add "$1" && chezmoi apply "$1"
}
