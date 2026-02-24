# Browser — Qutebrowser

**Config file:** `~/.config/qutebrowser/config.py`

Keyboard-driven browser built on QtWebEngine. Vim-style bindings, scriptable in Python.

## Settings

| Setting | Value |
|---------|-------|
| Font | JetBrainsMono Nerd Font 13pt |
| Theme | Catppuccin Mocha |
| Default search | DuckDuckGo |
| Dark mode | Enabled (images excluded) |
| 3rd-party cookies | Blocked |
| Autoplay | Disabled |
| Editor | `kitty -- nvim` |
| Session restore | Enabled |

## Search engines

| Keyword | Engine |
|---------|--------|
| `DEFAULT` | DuckDuckGo |
| `g` | Google |
| `yt` | YouTube |
| `gh` | GitHub |
| `aw` | Arch Wiki |
| `py` | Python docs |
| `r` | Reddit |

Usage: type the keyword followed by your query in the address bar, e.g. `aw pacman`.

## Keybindings

### Navigation

| Key | Action |
|-----|--------|
| `o` | Open URL |
| `O` | Open URL in new tab |
| `go` | Edit current URL |
| `H` | Back |
| `L` | Forward |
| `r` | Reload |
| `R` | Hard reload |
| `gg` | Scroll to top |
| `G` | Scroll to bottom |
| `j / k` | Scroll down / up |
| `d / u` | Half-page down / up |

### Tabs

| Key | Action |
|-----|--------|
| `gt` | Next tab |
| `gT` | Previous tab |
| `d` | Close tab |
| `u` | Undo close tab |
| `co` | Close other tabs |
| `<alt-N>` | Go to tab N |

### Hints (link following)

| Key | Action |
|-----|--------|
| `f` | Open link in current tab |
| `F` | Open link in new tab |
| `yf` | Yank link URL |
| `;i` | Hint images |
| `;d` | Download link |

### Search

| Key | Action |
|-----|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n / N` | Next / previous match |

### Custom bindings

| Key | Action |
|-----|--------|
| `,e` | Open new tab |
| `,d` | Toggle dark mode |
| `,c` | Clear search highlight |
| `,y` | Copy current URL |
| `,C` | Open config in editor |

### Misc

| Key | Action |
|-----|--------|
| `yy` | Copy current URL |
| `pp` | Open clipboard URL |
| `Pp` | Open clipboard URL in new tab |
| `:q` | Quit |
| `ZQ` | Quit without saving |

## Quick config reference

Open the config file directly from within qutebrowser:

```
,C
```

Or reload config without restarting:

```
:config-source
```

## Theme

Catppuccin Mocha applied via `config.py`. Colors match the rest of the system (Hyprland borders, Waybar, Kitty).
