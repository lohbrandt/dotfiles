#!/usr/bin/env zsh

# ============================================================================
# Shell Aliases - Managed by chezmoi
# ============================================================================

# -----------------------------------------------------------------------------
# Quick Config Editing
# -----------------------------------------------------------------------------
alias zshconfig="chezmoi edit ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias aliasconfig="chezmoi edit ~/.config/shell/aliases.zsh"
alias funcconfig="chezmoi edit ~/.config/shell/functions.zsh"

# -----------------------------------------------------------------------------
# chezmoi Shortcuts
# -----------------------------------------------------------------------------
alias cm="chezmoi"
alias cma="chezmoi apply"
alias cmd="chezmoi diff"
alias cms="chezmoi status"
alias cme="chezmoi edit"
alias cmu="chezmoi update"
alias cmcd="cd $(chezmoi source-path)"

# -----------------------------------------------------------------------------
# Homebrew Shortcuts
# -----------------------------------------------------------------------------
alias brewup="brew update && brew upgrade && brew cleanup"
alias brewfile="brew bundle dump --file=\$(chezmoi source-path)/Brewfile --force"
alias brewinstall="brew bundle --file=\$HOME/Brewfile"
alias brewsearch="brew search"
alias brewinfo="brew info"
alias brewlist="brew list"
alias brewoutdated="brew outdated"

# -----------------------------------------------------------------------------
# asdf Shortcuts
# -----------------------------------------------------------------------------
alias asdfup="asdf plugin update --all"
alias asdflist="asdf list"
alias asdfglobal="asdf global"
alias asdflocal="asdf local"
alias asdfinstall="asdf install"
alias asdfplugins="asdf plugin list"
alias asdfcurrent="asdf current"

# -----------------------------------------------------------------------------
# System Maintenance
# -----------------------------------------------------------------------------
alias sysmaint="\$(chezmoi source-path)/scripts/maintenance.sh"
alias sysupdate="brewup && asdfup"
alias sysclean="brew cleanup && docker system prune -f"

# -----------------------------------------------------------------------------
# Git Shortcuts
# -----------------------------------------------------------------------------
alias gs="git status"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gl="git log --oneline"
alias gll="git log --oneline --graph --all"
alias gd="git diff"
alias gds="git diff --staged"
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gm="git merge"
alias gr="git remote"
alias grv="git remote -v"
alias gst="git stash"
alias gstp="git stash pop"

# -----------------------------------------------------------------------------
# Directory Navigation
# -----------------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

# -----------------------------------------------------------------------------
# File Operations
# -----------------------------------------------------------------------------
alias ls="ls -G"
alias ll="ls -la"
alias la="ls -la"
alias l="ls -l"
alias lh="ls -lh"
alias lr="ls -lR"
alias lt="ls -lt"
alias ltr="ls -ltr"

# -----------------------------------------------------------------------------
# File Permissions
# -----------------------------------------------------------------------------
alias chx="chmod +x"
alias 755="chmod 755"
alias 644="chmod 644"

# -----------------------------------------------------------------------------
# Network
# -----------------------------------------------------------------------------
alias ping="ping -c 5"
alias myip="curl -s https://ipecho.net/plain; echo"
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ports="lsof -i -P -n | grep LISTEN"

# -----------------------------------------------------------------------------
# Docker (if installed)
# -----------------------------------------------------------------------------
if command -v docker &> /dev/null; then
    alias d="docker"
    alias dc="docker-compose"
    alias dcu="docker-compose up"
    alias dcd="docker-compose down"
    alias dcb="docker-compose build"
    alias dps="docker ps"
    alias dpsa="docker ps -a"
    alias di="docker images"
    alias drm="docker rm"
    alias drmi="docker rmi"
    alias dexec="docker exec -it"
    alias dlogs="docker logs"
    alias dprune="docker system prune -f"
fi

# -----------------------------------------------------------------------------
# Development Tools
# -----------------------------------------------------------------------------
alias py="python"
alias py3="python3"
alias pip="pip3"
alias venv="python -m venv"
alias serve="python -m http.server"
alias json="python -m json.tool"

# Node.js
alias ni="npm install"
alias ns="npm start"
alias nt="npm test"
alias nb="npm run build"
alias nd="npm run dev"
alias nls="npm list"
alias nout="npm outdated"

# -----------------------------------------------------------------------------
# Miscellaneous
# -----------------------------------------------------------------------------
alias grep="grep --color=auto"
alias h="history"
alias j="jobs"
alias path="echo -e \${PATH//:/\\n}"
alias reload="exec \$SHELL -l"
alias cls="clear"
alias c="clear"
alias edit="code"
alias o="open"
alias finder="open -a Finder"
alias brewdeps="brew deps --tree"
alias week="date +%V"
alias timer="echo 'Timer started. Stop with Ctrl-D.' && date && time cat && date"
