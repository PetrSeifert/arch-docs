# Terminal — Kitty

**Config file:** `~/.config/kitty/kitty.conf`

## Settings

| Setting | Value | Notes |
|---------|-------|-------|
| Font family | JetBrainsMono Nerd Font | |
| Font size | 13pt | |
| `sync_to_monitor` | `no` | VMware performance fix |
| Cursor shape | Block | |
| Cursor blink | Disabled | |
| Scrollback | 10,000 lines | |
| Copy on select | clipboard | |
| Audio bell | Disabled | |
| Initial window size | 1200×750 | |
| Window padding | 8px | |
| Tab bar position | Bottom | |
| Tab bar style | Powerline | |

## VMware wrapper fix

Kitty defaults to GPU rendering. In VMware, this can cause rendering artifacts. The `sync_to_monitor = no` setting disables vsync to avoid lag:

```
sync_to_monitor no
```

If you encounter black windows or rendering glitches, also try:

```sh
LIBGL_ALWAYS_SOFTWARE=1 kitty
```

## Theme

Loaded via include at the bottom of `kitty.conf`:

```
include themes/current.conf
```

`~/.config/kitty/themes/current.conf` is a symlink pointing to the active theme file. On theme switch, the symlink is updated and Kitty receives `SIGUSR1` — colors reload instantly without restarting.

## Keybindings

| Key | Action |
|-----|--------|
| `Ctrl+Shift+T` | New tab (inherits cwd) |
| `Ctrl+Shift+Q` | Close tab |
| `Ctrl+Shift+→` | Next tab |
| `Ctrl+Shift+←` | Previous tab |
| `Ctrl+Shift+Enter` | New window (inherits cwd) |
| `Ctrl+Shift+=` | Increase font size |
| `Ctrl+Shift+-` | Decrease font size |
| `Ctrl+Shift+0` | Reset font size |
| `Ctrl+Shift+C` | Copy to clipboard |
| `Ctrl+Shift+V` | Paste from clipboard |
