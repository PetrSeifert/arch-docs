# Themes

## The four themes

| Name | Style | Character |
|------|-------|-----------|
| `catppuccin` | Catppuccin Mocha | Purple/blue pastels, soft dark — default |
| `gruvbox` | Gruvbox Dark | Warm earth tones, retro/cozy |
| `tokyonight` | Tokyo Night | Cool blues/purples, neon accents |
| `rosepine` | Rosé Pine Main | Muted, nature-inspired, elegant |

## What gets switched

All seven targets switch simultaneously in under a second:

1. **Kitty** — symlink `~/.config/kitty/themes/current.conf` → theme file, sends `SIGUSR1` (hot reload, no restart)
2. **Zellij** — `sed` replaces `theme "..."` line in `config.kdl` (new sessions pick it up)
3. **Neovim** — writes to `~/.config/nvim/.current_theme`; live instances updated via `nvim --server <sock> --remote-expr "execute('colorscheme ...')"`
4. **Waybar** — symlink `~/.config/waybar/style.css` → theme CSS, `SIGUSR2` (hot reload, no restart)
5. **Hyprland borders** — `hyprctl keyword` for active and inactive border colors (live, no restart)
6. **Mako** — symlink `~/.config/mako/config` → theme file, `makoctl reload`
7. **Persist** — theme name written to `~/.config/themes/.current`

## Theme file layout

```
~/.config/themes/
├── .current                    ← active theme name
├── kitty/
│   ├── catppuccin.conf
│   ├── gruvbox.conf
│   ├── tokyonight.conf
│   └── rosepine.conf
├── waybar/
│   ├── catppuccin.css
│   ├── gruvbox.css
│   ├── tokyonight.css
│   └── rosepine.css
└── mako/
    ├── catppuccin
    ├── gruvbox
    ├── tokyonight
    └── rosepine
```

## Zellij theme name mapping

Zellij uses its own theme names. `theme-switch` maps them via `sed`:

| Our name | Zellij name |
|----------|-------------|
| `catppuccin` | `catppuccin-mocha` |
| `gruvbox` | `gruvbox-dark` |
| `tokyonight` | `tokyo-night` |
| `rosepine` | `rose-pine` |

## Invocation methods

```sh
# Direct — switch immediately
theme-switch catppuccin
theme-switch gruvbox
theme-switch tokyonight
theme-switch rosepine

# Interactive — no args opens Wofi picker
theme-switch
```

| Context | How |
|---------|-----|
| Terminal | `theme-switch <name>` |
| Hyprland keybind | `SUPER+SHIFT+T` (opens Wofi picker) |
| Zellij | `Ctrl+T` (opens Wofi picker) |
| Nvim colorscheme only | `<leader>tt` (vim.ui.select, no system switch) |
| Nvim system-wide | `<leader>tT` (calls theme-switch script) |
| Waybar | Click the ` theme` module |

## Theme script location

```
~/.local/bin/theme-switch
```

The script validates the theme name, performs all seven switches, and exits. It reads `~/.config/themes/.current` on each run to know the current theme.

## Persistence across reboots

- **System theme:** `~/.config/themes/.current` — read by `theme-switch` and by `~/.zprofile` (could be used to restore on login)
- **Nvim theme:** `~/.config/nvim/.current_theme` — read by `init.lua` on every nvim startup; the colorscheme is applied before any plugin loads
