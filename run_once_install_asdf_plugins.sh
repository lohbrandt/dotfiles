#!/bin/bash

# Install asdf plugins and tools
# This script runs once when chezmoi is applied

set -e

echo "🔧 Setting up asdf..."

# Check if asdf is installed
if ! command -v asdf &> /dev/null; then
    echo "❌ asdf is not installed. Please install it first with Homebrew:"
    echo "   brew install asdf"
    exit 1
fi

# Source asdf to make it available in this script
source $(brew --prefix asdf)/libexec/asdf.sh

# Install plugins and tools from .tool-versions
if [[ -f "$HOME/.tool-versions" ]]; then
    echo "📋 Installing asdf plugins and tools from .tool-versions..."
    
    # Read each line from .tool-versions
    while IFS=' ' read -r plugin version || [[ -n "$plugin" ]]; do
        if [[ -n "$plugin" && "$plugin" != "#"* ]]; then
            echo "🔌 Installing plugin: $plugin"
            asdf plugin add "$plugin" 2>/dev/null || echo "   Plugin $plugin already installed"
            
            echo "📦 Installing $plugin version $version"
            asdf install "$plugin" "$version" 2>/dev/null || echo "   Version $version already installed"
        fi
    done < "$HOME/.tool-versions"
    
    # Install all versions and set global defaults
    echo "🌍 Installing all tools and setting global versions..."
    asdf install
    
else
    echo "❌ .tool-versions file not found in $HOME"
    exit 1
fi

echo "✅ asdf setup complete!"
