# Multiplexer — Zellij

**Config file:** `~/.config/zellij/config.kdl`

## Settings

| Setting | Value | Notes |
|---------|-------|-------|
| `default_shell` | `zsh` | |
| `default_layout` | `compact` | Minimal UI, no status bar clutter |
| `theme` | managed by `theme-switch` | `sed` rewrites this line |
| `pane_frames` | `false` | No pane borders |
| `auto_layout` | `true` | |
| `session_serialization` | `true` | Sessions survive restarts |
| `copy_on_select` | `true` | Auto-copy selected text |
| `mouse_mode` | `true` | Click to focus panes |

## Environment variables (passed to all panes)

```kdl
env {
    EDITOR "nvim"
    VISUAL "nvim"
}
```

## Theme names

Zellij has built-in themes. `theme-switch` maps our theme names to Zellij's internal names via `sed`:

| Our name | Zellij theme name |
|----------|-------------------|
| `catppuccin` | `catppuccin-mocha` |
| `gruvbox` | `gruvbox-dark` |
| `tokyonight` | `tokyo-night` |
| `rosepine` | `rose-pine` |

Theme changes take effect for **new Zellij sessions** (existing sessions keep the old theme).

## Keybind

| Key | Action |
|-----|--------|
| `Ctrl+T` | Run `theme-switch` (opens wofi picker) |

Zellij's default keybindings are extensive — use `Ctrl+G` to lock/unlock leader mode, `Ctrl+P` for pane mode, `Ctrl+T` for tab mode (overridden here), `Ctrl+S` for scroll mode.
