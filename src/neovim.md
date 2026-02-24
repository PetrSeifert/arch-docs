# Editor — Neovim

**Leader key:** `Space`

## Directory structure

```
~/.config/nvim/
├── init.lua                    ← lazy.nvim bootstrap, loads config/, reads .current_theme
├── .current_theme              ← persisted theme name (written by theme-switch + <leader>tt)
└── lua/
    ├── config/
    │   ├── options.lua         ← vim.opt, leader = Space
    │   ├── keymaps.lua         ← all keymaps including theme pickers
    │   └── autocmds.lua        ← yank highlight, last position, ft settings
    └── plugins/
        ├── ui.lua              ← 4 colorschemes, lualine, bufferline, which-key, noice, gitsigns
        ├── treesitter.lua      ← parsers + textobjects
        ├── telescope.lua       ← + fzf-native
        ├── lsp.lua             ← nvim-lspconfig direct (no Mason)
        ├── completion.lua      ← nvim-cmp + LuaSnip + friendly-snippets
        ├── formatting.lua      ← conform.nvim (format on save)
        ├── oil.lua             ← file explorer
        └── dap.lua             ← nvim-dap + dap-ui + lldb adapter
```

## LSPs

All installed via pacman — no Mason.

| Language | Server | Package |
|----------|--------|---------|
| Rust | `rust_analyzer` | `rust-analyzer` |
| C/C++ | `clangd` | `clang` |
| TypeScript/JS | `ts_ls` | `typescript-language-server` |
| Bash | `bashls` | `bash-language-server` |
| Lua | `lua_ls` | `lua-language-server` |

**rust_analyzer extras:** `checkOnSave = clippy`, inlay hints enabled, `allFeatures = true`

**clangd extras:** `--background-index --clang-tidy --header-insertion=iwyu`

## Formatters

`conform.nvim` runs formatters on save.

| Language | Formatter | Package |
|----------|-----------|---------|
| Rust | `rustfmt` | comes with rustup |
| C/C++ | `clang-format` | `clang` |
| JS/TS/JSON/CSS/HTML/YAML/MD | `prettier` | `prettier` |
| Lua | `stylua` | `stylua` |
| Bash/sh | `shfmt` | `shfmt` |

## DAP (Debugger)

- **Adapter:** `lldb-dap` binary from `lldb` package (`/usr/bin/lldb-dap`)
- **Languages:** Rust, C, C++
- **Rust pretty-printers:** auto-loaded from `rustc --print sysroot` (renders `Vec`, `HashMap`, `Option`, etc. properly)
- **UI:** `nvim-dap-ui` auto-opens on session start, auto-closes on exit
- **Virtual text:** `nvim-dap-virtual-text` shows variable values inline while stepping

## First launch

```vim
:TSInstall rust c cpp typescript javascript lua bash json yaml markdown
```

Treesitter parsers also auto-install when you open a file of a supported type.

## Keybindings

### General

| Key | Action |
|-----|--------|
| `<Esc>` | Clear search highlight |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>Q` | Quit all |
| `<leader>bd` | Delete buffer |

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+H/J/K/L` | Move between splits |
| `Ctrl+←/→/↑/↓` | Resize splits |
| `Shift+H` | Previous buffer |
| `Shift+L` | Next buffer |
| `Alt+J` | Move line/selection down |
| `Alt+K` | Move line/selection up |
| `-` | Open Oil (file explorer) |

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

Active when an LSP is attached to the buffer.

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover documentation |
| `Ctrl+K` | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>cf` | Format buffer |
| `<leader>ih` | Toggle inlay hints |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
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
| `<leader>tt` | Theme picker (nvim colorscheme only, `vim.ui.select`) |
| `<leader>tT` | System-wide theme switch (calls `theme-switch` script) |

### Other

| Key | Action |
|-----|--------|
| `<leader>gg` | Lazygit float window |
