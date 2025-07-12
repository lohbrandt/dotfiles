#!/bin/bash

# Install Homebrew packages from Brewfile
# This script runs once when chezmoi is applied

set -e

echo "🍺 Installing Homebrew packages..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed. Please install it first:"
    echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

# Update Homebrew
echo "📦 Updating Homebrew..."
brew update

# Install packages from Brewfile
if [[ -f "$HOME/Brewfile" ]]; then
    echo "📋 Installing packages from Brewfile..."
    brew bundle --file="$HOME/Brewfile"
else
    echo "❌ Brewfile not found in $HOME"
    exit 1
fi

echo "✅ Homebrew setup complete!"
