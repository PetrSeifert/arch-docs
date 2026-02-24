# Installation

Everything is automated. From a fresh Arch install, logged in as `psrock`:

```sh
bash ~/install.sh
```

## Phases

### Phase 1 — Bootstrap

```sh
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed base-devel git
sudo usermod -aG video psrock
# builds and installs paru (AUR helper) from /tmp
```

Packages: `base-devel`, `git`, `paru`

### Phase 2 — Shell

```sh
sudo pacman -S --noconfirm --needed \
  zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions starship
chsh -s /usr/bin/zsh
```

### Phase 3 — Hyprland stack

```sh
sudo pacman -S --noconfirm --needed \
  hyprland uwsm xdg-desktop-portal-hyprland xdg-desktop-portal xdg-desktop-portal-gtk \
  xdg-user-dirs xdg-utils waybar wofi mako swww grim slurp wl-clipboard cliphist \
  polkit-gnome xorg-xwayland \
  pipewire pipewire-alsa pipewire-pulse wireplumber \
  qt6-wayland libnotify playerctl brightnessctl
systemctl --user enable --now pipewire pipewire-pulse wireplumber
xdg-user-dirs-update
```

### Phase 4 — Kitty + Zellij + Fonts

```sh
sudo pacman -S --noconfirm --needed \
  kitty zellij \
  ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji ttf-nerd-fonts-symbols-mono
sudo fc-cache -fv
```

### Phase 5 — Neovim + LSPs + Formatters

```sh
sudo pacman -S --noconfirm --needed \
  neovim \
  rust-analyzer clang lldb typescript-language-server bash-language-server lua-language-server \
  shfmt prettier stylua
```

### Phase 6 — Dev Tools

```sh
sudo pacman -S --noconfirm --needed rustup nodejs pnpm cmake meson ninja
rustup default stable
rustup component add rust-src clippy
pnpm setup
```

### Phase 7 — CLI Tools

```sh
sudo pacman -S --noconfirm --needed \
  fzf ripgrep bat eza fd zoxide lazygit btop git-delta jq yq tealdeer
tldr --update
```

### Git global config

```sh
git config --global user.name "psrock"
git config --global user.email "your@email.com"   # change this
git config --global init.defaultBranch main
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global merge.conflictstyle diff3
```

## Post-install steps

```sh
# 1. Set your real git email
git config --global user.email "you@example.com"

# 2. Log out and back in — video group membership takes effect
logout

# 3. From tty1, login auto-launches Hyprland via uwsm. Open Kitty, then nvim:
nvim

# 4. On first nvim open, lazy.nvim installs all plugins automatically.
#    Then install Treesitter parsers:
:TSInstall rust c cpp typescript javascript lua bash json yaml markdown

# 5. Test the theme switch:
theme-switch gruvbox
theme-switch catppuccin
```
