#!/bin/bash

# Update Brewfile with currently installed packages
# Usage: ./update-brewfile.sh

set -e

echo "🍺 Updating Brewfile..."

# Generate new Brewfile
BREWFILE_PATH="$(chezmoi source-path)/Brewfile"
brew bundle dump --file="$BREWFILE_PATH" --force

echo "📋 Brewfile updated at: $BREWFILE_PATH"

# Show what changed
if command -v git &> /dev/null; then
    cd "$(chezmoi source-path)"
    echo "📝 Changes in Brewfile:"
    git diff --no-index --color=always /dev/null Brewfile 2>/dev/null || git diff --color=always Brewfile || echo "No changes detected"
fi

echo "✅ Brewfile update complete!"
echo "💡 Run 'chezmoi apply' to sync the updated Brewfile to your home directory"
