# Shell — Zsh

## Files

| File | Purpose |
|------|---------|
| `~/.zshenv` | XDG base dirs — sourced by **all** zsh instances |
| `~/.zprofile` | Login shell only — launches Hyprland on tty1 |
| `~/.zshrc` | Interactive config — everything else |

## `~/.zshenv` — XDG base dirs

Sourced by every zsh process (scripts, non-interactive, interactive). Sets XDG directories so tools respect them:

```sh
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
```

## `~/.zprofile` — Login shell

Runs once on login. Auto-starts Hyprland on tty1:

```sh
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec uwsm start -- Hyprland
fi
```

## `~/.zshrc` — Interactive shell

### History

```sh
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$XDG_STATE_HOME/zsh/history"
```

- Deduplication: `HIST_IGNORE_ALL_DUPS`
- Shared across sessions: `SHARE_HISTORY`

### Options

```
AUTO_CD              — type a dir name to cd into it
AUTO_PUSHD           — pushd automatically on cd
CORRECT              — suggest corrections for typos
INTERACTIVE_COMMENTS — allow # comments in interactive shell
```

### PATH additions

```
~/.local/bin          ← theme-switch and local scripts
~/.cargo/bin          ← cargo-installed binaries
$PNPM_HOME            ← pnpm global bins (~/.local/share/pnpm)
```

### Environment variables

```
EDITOR   = nvim
VISUAL   = nvim
PAGER    = bat
MANPAGER = bat    ← man pages with syntax highlighting
```

### Completion

- Cache enabled (`compinit -C`)
- Case-insensitive matching
- Colored menu

### Plugins

Sourced from pacman paths (no plugin manager needed):

```sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### FZF

```sh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
```

Keybinds added by fzf:

| Key | Action |
|-----|--------|
| `Ctrl+R` | Fuzzy search shell history |
| `Ctrl+T` | Fuzzy find files, insert path |
| `Alt+C` | Fuzzy cd into directory |

### Zoxide

```sh
eval "$(zoxide init zsh)"
```

Replaces `cd` — learns your most-visited directories and lets you jump with partial names.

### Starship prompt

```sh
eval "$(starship init zsh)"
```

## Aliases

| Alias | Expands to | Notes |
|-------|-----------|-------|
| `ls` | `eza --icons` | |
| `ll` | `eza -la --icons --git` | Long list with git status |
| `lt` | `eza --tree --icons` | Tree view |
| `cat` | `bat` | Syntax-highlighted output |
| `cd` | `z` | Zoxide smart cd |
| `vim` / `vi` | `nvim` | |
| `lg` | `lazygit` | TUI git |
| `pss` | `paru -Ss` | Search AUR/pacman |
| `pi` | `paru -S` | Install package |
| `pu` | `paru -Syu` | Update all |
| `prm` | `paru -Rns` | Remove package + deps |
| `ga` | `git add` | |
| `gc` | `git commit` | |
| `gd` | `git diff` | |
| `gs` | `git status` | |
| `gp` | `git push` | |
| `gl` | `git pull` | |
| `glog` | `git log --oneline --graph` | |
| `..` | `cd ..` | |
| `...` | `cd ../..` | |
