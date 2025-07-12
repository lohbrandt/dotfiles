#!/usr/bin/env bash
set -euo pipefail

ZSH_CUSTOM=${ZSH_CUSTOM:-"$HOME/.oh-my-zsh/custom"}
THEME_DIR="$ZSH_CUSTOM/themes/powerlevel10k"

if [ ! -d "$THEME_DIR/.git" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$THEME_DIR"
else
  git -C "$THEME_DIR" pull --ff-only
fi
