# Window Manager — Hyprland

**Config file:** `~/.config/hypr/hyprland.conf`

## Autostarted services

```
exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec-once = swww-daemon
exec-once = waybar
exec-once = mako
exec-once = wl-paste --type text  --watch cliphist store
exec-once = wl-paste --type image --watch cliphist store
```

PipeWire is managed by systemd user services (not exec-once):

```sh
systemctl --user enable --now pipewire pipewire-pulse wireplumber
```

## Environment variables (VMware)

```
env = WLR_RENDERER,gles2
env = WLR_NO_HARDWARE_CURSORS,1
```

See [VMware Gotchas](vmware.md) for explanations.

## Waybar

Left: workspaces · active window title · Spotify now playing
Center: clock (day, date, time)
Right: audio · network · CPU% · RAM% · battery · tray · theme button

Waybar CSS is a symlink managed by `theme-switch`:

```
~/.config/waybar/style.css → ~/.config/themes/waybar/<theme>.css
```

Hot-reloaded via `SIGUSR2` on theme switch.

### Spotify module

Polls `https://api.peterrock.dev/api/spotify/playing-status` every 5 seconds and displays the currently playing track in the left bar. Shows nothing when paused or nothing is playing.

Script: `~/.config/waybar/scripts/spotify.sh`

## Mako (notifications)

Config is a symlink managed by `theme-switch`:

```
~/.config/mako/config → ~/.config/themes/mako/<theme>
```

Hot-reloaded via `makoctl reload`.

## Wofi (launcher)

`SUPER+Space` — centered, 600×400, fuzzy, gtk_dark style.

## Window rules

Floating windows for: wofi, mako, imv, pavucontrol, and similar utilities.

## Keybindings

### Core

| Key | Action |
|-----|--------|
| `SUPER+Return` | Open Kitty terminal |
| `SUPER+Q` | Kill active window |
| `SUPER+F` | Toggle fullscreen |
| `SUPER+V` | Toggle floating |
| `SUPER+Space` | Open Wofi launcher |
| `SUPER+SHIFT+E` | Exit Hyprland |
| `SUPER+SHIFT+T` | Theme switch (opens Wofi picker) |

### Focus

| Key | Action |
|-----|--------|
| `SUPER+H` | Focus left |
| `SUPER+L` | Focus right |
| `SUPER+K` | Focus up |
| `SUPER+J` | Focus down |
| `SUPER+←/→/↑/↓` | Focus (arrow keys) |

### Move windows

| Key | Action |
|-----|--------|
| `SUPER+SHIFT+←` | Move window left |
| `SUPER+SHIFT+→` | Move window right |
| `SUPER+SHIFT+↑` | Move window up |
| `SUPER+SHIFT+↓` | Move window down |

### Workspaces

| Key | Action |
|-----|--------|
| `SUPER+1–9, 0` | Switch to workspace 1–10 |
| `SUPER+SHIFT+1–9, 0` | Move window to workspace 1–10 |
| `SUPER+scroll up/down` | Cycle workspaces |

### Media keys

| Key | Action |
|-----|--------|
| `XF86AudioRaiseVolume` | Volume +5% |
| `XF86AudioLowerVolume` | Volume -5% |
| `XF86AudioMute` | Toggle mute |
| `XF86MonBrightnessUp` | Brightness +10% |
| `XF86MonBrightnessDown` | Brightness -10% |

### Screenshot & clipboard

| Key | Action |
|-----|--------|
| `Print` | Area screenshot → clipboard (grim + slurp) |
| `SUPER+Print` | Full screenshot → clipboard |
| `SUPER+C` | Clipboard history (cliphist + wofi) |
