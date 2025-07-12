# Terminal Font Configuration

To ensure your terminal displays powerline and special characters correctly, you need to configure it to use the **MesloLGS NF** font.

## Manual Configuration

### iTerm2

1. Open **iTerm2**
2. Go to **Preferences** (⌘,)
3. Navigate to **Profiles**
4. Select the **Text** tab
5. Set the font to **MesloLGS NF** 12pt

### Terminal.app

1. Open **Terminal.app**
2. Go to **Preferences** (⌘,)
3. Select the **Profiles** tab
4. Choose your profile and click **Font**
5. Set the font to **MesloLGS NF** 12pt

### Alacritty

Add the following to your `~/.config/alacritty/alacritty.yml`:

```yaml
font:
  normal:
    family: MesloLGS NF
    style: Regular
  size: 12.0
```

## Configuration Files

Optional configuration files are available in `private_terminal_configs/` for chezmoi to manage:

- `iterm2_profile.json` - iTerm2 profile settings
- `alacritty_font.yml` - Alacritty font configuration snippet

You can symlink these files to your terminal's configuration directory as needed.
