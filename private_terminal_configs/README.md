# Terminal Configuration Files

This directory contains optional configuration files for various terminal emulators to set up the MesloLGS NF font.

## Files

- `iterm2_profile.json` - iTerm2 profile configuration
- `alacritty_font.yml` - Alacritty font configuration snippet

## Usage

### iTerm2

1. Open iTerm2
2. Go to Preferences → Profiles
3. Click the "Other Actions" dropdown and select "Import JSON Profiles..."
4. Import the `iterm2_profile.json` file
5. Set the imported profile as default

### Alacritty

Add the contents of `alacritty_font.yml` to your `~/.config/alacritty/alacritty.yml` file.

## Chezmoi Integration

You can use chezmoi to manage these configuration files by creating appropriate symlinks or templates in your chezmoi configuration.

For example, you could create a symlink for Alacritty:

```bash
chezmoi add --template ~/.config/alacritty/alacritty.yml
```

Or use chezmoi's `modify` command to merge the font configuration into your existing Alacritty config.
