# Quick Reference

## Hyprland keybinds (`SUPER` = Windows key)

### Core

| Key | Action |
|-----|--------|
| `SUPER+Return` | Open Kitty terminal |
| `SUPER+Q` | Kill active window |
| `SUPER+F` | Toggle fullscreen |
| `SUPER+V` | Toggle floating |
| `SUPER+Space` | Open Wofi launcher |
| `SUPER+SHIFT+E` | Exit Hyprland |
| `SUPER+SHIFT+T` | Theme switch (Wofi picker) |

### Focus & move

| Key | Action |
|-----|--------|
| `SUPER+H/J/K/L` | Focus left/down/up/right |
| `SUPER+←/→/↑/↓` | Focus (arrows) |
| `SUPER+SHIFT+←/→/↑/↓` | Move window |
| `SUPER+1–0` | Switch workspace 1–10 |
| `SUPER+SHIFT+1–0` | Move window to workspace |
| `SUPER+scroll` | Cycle workspaces |

### Media & utils

| Key | Action |
|-----|--------|
| `XF86AudioRaiseVolume` | Volume +5% |
| `XF86AudioLowerVolume` | Volume -5% |
| `XF86AudioMute` | Toggle mute |
| `XF86MonBrightnessUp/Down` | Brightness ±10% |
| `Print` | Area screenshot → clipboard |
| `SUPER+Print` | Full screenshot → clipboard |
| `SUPER+C` | Clipboard history (Wofi) |

---

## Neovim keybinds (`<leader>` = Space)

### General

| Key | Action |
|-----|--------|
| `<Esc>` | Clear search highlight |
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>Q` | Quit all |
| `<leader>bd` | Delete buffer |
| `<leader>gg` | Lazygit float |

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+H/J/K/L` | Move between splits |
| `Shift+H/L` | Prev/next buffer |
| `Alt+J/K` | Move line down/up |
| `-` | Oil file explorer |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fd` | Diagnostics |
| `<leader>fc` | Commands |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover docs |
| `Ctrl+K` | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>cf` | Format buffer |
| `<leader>ih` | Toggle inlay hints |
| `[d` / `]d` | Prev/next diagnostic |
| `<leader>e` | Show diagnostic float |

### DAP

| Key | Action |
|-----|--------|
| `F5` | Continue |
| `F10` | Step over |
| `F11` | Step into |
| `F12` | Step out |
| `<leader>db` | Toggle breakpoint |
| `<leader>du` | Toggle DAP UI |

### Theme

| Key | Action |
|-----|--------|
| `<leader>tt` | Nvim colorscheme picker |
| `<leader>tT` | System-wide theme switch |

---

## Kitty keybinds

| Key | Action |
|-----|--------|
| `Ctrl+Shift+T` | New tab (cwd) |
| `Ctrl+Shift+Q` | Close tab |
| `Ctrl+Shift+→/←` | Next/prev tab |
| `Ctrl+Shift+Enter` | New window (cwd) |
| `Ctrl+Shift+=/−` | Font size up/down |
| `Ctrl+Shift+0` | Reset font size |
| `Ctrl+Shift+C/V` | Copy/paste |

---

## Verification checklist

```sh
# Phase 1
paru --version
groups | grep video          # must show 'video' after re-login

# Phase 2
echo $SHELL                  # /usr/bin/zsh
starship --version

# Phase 3
hyprctl monitors             # responds when inside Hyprland
pgrep waybar && echo ok
pgrep mako  && echo ok

# Phase 4
kitty --version
zellij --version
fc-list | grep JetBrains     # font installed

# Phase 5
nvim --version               # 0.10+
# Inside nvim:
# :Lazy            — all plugins green
# :LspInfo         — servers attached on .rs/.c/.ts
# :checkhealth     — review warnings

# Phase 6
rustc --version
cargo --version
node --version
pnpm --version

# Phase 7
lg                           # lazygit opens
bat --version
eza -la

# Theme
theme-switch gruvbox         # all apps switch in <1s
theme-switch catppuccin      # back to default
cat ~/.config/themes/.current
```

---

## Maintenance

| Command | What it does |
|---------|-------------|
| `paru -Syu` | Update everything (pacman + AUR) |
| `:Lazy update` | Update Neovim plugins |
| `:TSUpdate` | Update Treesitter parsers |
| `tldr --update` | Update tldr page cache |
| `rustup update` | Update Rust toolchain |

## Useful paths

| Path | Contents |
|------|----------|
| `~/.config/nvim/.current_theme` | Active nvim colorscheme name |
| `~/.config/themes/.current` | Active system theme name |
| `~/.local/bin/theme-switch` | Theme switch script |
| `~/install.sh` | Full package + setup installer |
| `~/.config/hypr/hyprland.conf` | WM config |
| `~/.config/nvim/lua/plugins/` | All nvim plugin specs |
| `~/.config/kitty/themes/` | Kitty theme files |
| `~/.config/themes/` | All theme files (waybar, mako, etc.) |
| `~/.local/state/zsh/history` | Zsh history file |
