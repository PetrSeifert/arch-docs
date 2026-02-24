# CLI Tools

All installed in Phase 7 of `install.sh`:

```sh
sudo pacman -S fzf ripgrep bat eza fd zoxide lazygit btop git-delta jq yq tealdeer
```

## Tool reference

| Tool | Purpose | Notable usage |
|------|---------|---------------|
| `fzf` | Fuzzy finder | `Ctrl+R` history, `Ctrl+T` file, `Alt+C` cd |
| `ripgrep` (`rg`) | Fast grep | Used by Telescope `live_grep`, nvim grep operations |
| `bat` | Syntax-highlighted cat | Also used as `PAGER` and `MANPAGER` |
| `eza` | Modern `ls` | `ll`, `lt` aliases; git status, icons, tree view |
| `fd` | Fast `find` | Used by fzf `FZF_DEFAULT_COMMAND` |
| `zoxide` (`z`) | Smarter `cd` | Learns visited dirs, jump with partial names |
| `lazygit` | TUI git client | `lg` alias or `<leader>gg` in nvim |
| `btop` | System monitor | Real-time CPU/RAM/net/disk |
| `git-delta` | Better git diffs | Side-by-side, syntax highlighting, navigate hunks |
| `jq` | JSON processing | Parse and filter JSON in shell |
| `yq` | YAML processing | Same as `jq` but for YAML |
| `tealdeer` | Fast tldr pages | `tldr <command>` — practical command examples |

## git-delta config

Set as git's pager and diff filter in `~/.gitconfig`:

```gitconfig
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true
    side-by-side = true
[merge]
    conflictstyle = diff3
```

- `navigate = true` — use `n`/`N` to jump between diff hunks
- `side-by-side = true` — old/new shown in two columns
- `conflictstyle = diff3` — shows common ancestor in merge conflicts

## bat as MANPAGER

`bat` renders man pages with syntax highlighting. Set in `.zshrc`:

```sh
export MANPAGER="bat"
export PAGER="bat"
```

## zoxide

After `eval "$(zoxide init zsh)"` in `.zshrc`, the `cd` alias points to `z`. Zoxide tracks visited directories by frequency. Jump to any previously-visited path with a partial name:

```sh
z nvim       # jumps to ~/.config/nvim
z arch       # jumps to ~/arch-docs
```

## tldr update

Run after install or periodically to refresh the local page cache:

```sh
tldr --update
```
