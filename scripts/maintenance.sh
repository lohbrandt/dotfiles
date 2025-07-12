#!/bin/bash

# Maintenance script for Homebrew and asdf
# Usage: ./maintenance.sh

set -e

echo "🔧 Running system maintenance..."

# Update Homebrew
echo "🍺 Updating Homebrew..."
brew update
brew upgrade
brew cleanup

# Update asdf plugins
echo "🔧 Updating asdf plugins..."
if command -v asdf &> /dev/null; then
    source $(brew --prefix asdf)/libexec/asdf.sh
    asdf plugin update --all
else
    echo "⚠️  asdf not found, skipping plugin updates"
fi

# Update Brewfile
echo "📋 Updating Brewfile..."
BREWFILE_PATH="$(chezmoi source-path)/Brewfile"
brew bundle dump --file="$BREWFILE_PATH" --force

# Show system status
echo "📊 System Status:"
echo "  🍺 Homebrew packages: $(brew list --formula | wc -l | xargs)"
echo "  🖥️  Homebrew casks: $(brew list --cask | wc -l | xargs)"
echo "  🔧 asdf plugins: $(asdf plugin list | wc -l | xargs)"

echo "✅ Maintenance complete!"
echo "💡 Don't forget to run 'chezmoi apply' to sync changes"
