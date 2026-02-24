# Overview

Full setup for a Hyprland-based Wayland desktop with Zsh, Neovim (from scratch), Kitty, Zellij, and a four-theme switching system. Built for VMware (Intel i5-12500H) from a bare 310-package Arch install.

## Stack

| Component   | Choice                                                            | Notes                          |
|-------------|-------------------------------------------------------------------|--------------------------------|
| Shell       | Zsh + Starship + autosuggestions + syntax-highlighting            |                                |
| WM          | Hyprland (Wayland)                                                | uwsm-managed systemd user unit |
| Terminal    | Kitty                                                             | GPU-accelerated, hot-reload themes |
| Multiplexer | Zellij                                                            | Built-in theme support         |
| Editor      | Neovim (lazy.nvim, no distro)                                     | Full LSP, DAP, treesitter      |
| Dev focus   | Rust/C, Web/TS/JS, scripting                                      |                                |
| Themes      | Catppuccin Mocha · Gruvbox Dark · Tokyo Night · Rosé Pine         | System-wide hot switch         |

## Quick Start

From a fresh Arch install, logged in as `psrock`:

```sh
bash ~/install.sh
```

See [Installation](installation.md) for full details, or [VMware Gotchas](vmware.md) if running in a VM.
