# Justfile for dotfiles management tasks

# Verify powerlevel10k installation
verify_p10k:
    #!/usr/bin/env bash
    set -euo pipefail
    
    echo "🔍 Verifying powerlevel10k installation..."
    
    # Check if powerlevel10k directory exists
    if [ ! -d "${HOME}/.oh-my-zsh/themes/powerlevel10k" ] && [ ! -d "${HOME}/.powerlevel10k" ]; then
        echo "❌ powerlevel10k directory not found in ~/.oh-my-zsh/themes/ or ~/.powerlevel10k"
        exit 1
    else
        echo "✅ powerlevel10k directory found"
    fi
    
    # Check if font files are present (common locations)
    font_found=false
    for font_dir in "${HOME}/Library/Fonts" "${HOME}/.fonts" "/usr/local/share/fonts" "/System/Library/Fonts"; do
        if [ -d "$font_dir" ] && find "$font_dir" -name "*Nerd*" -o -name "*MesloLGS*" -o -name "*Powerline*" | grep -q .; then
            echo "✅ Font files found in $font_dir"
            font_found=true
            break
        fi
    done
    
    if [ "$font_found" = false ]; then
        echo "❌ No powerlevel10k/Nerd fonts found in common font directories"
        exit 1
    fi
    
    # Check if powerlevel10k is referenced in .zshrc
    if [ -f "${HOME}/.zshrc" ] && grep -q 'powerlevel10k' "${HOME}/.zshrc"; then
        echo "✅ powerlevel10k found in ~/.zshrc"
    else
        echo "❌ powerlevel10k not found in ~/.zshrc"
        exit 1
    fi
    
    echo "🎉 powerlevel10k verification complete!"
