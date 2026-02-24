# VMware Gotchas

These are already set in the configs but documented here so you know why.

## `WLR_RENDERER=gles2`

VMware's `vmwgfx` driver has no Vulkan support. Hyprland defaults to Vulkan since v0.40 and will black-screen without this. Set in `hyprland.conf`:

```
env = WLR_RENDERER,gles2
```

## `WLR_NO_HARDWARE_CURSORS=1`

VMware GPU has no hardware cursor support. Without this the mouse cursor is invisible.

```
env = WLR_NO_HARDWARE_CURSORS,1
```

## `video` group

Hyprland needs DRM device access (`/dev/dri/*`). The `install.sh` adds `psrock` to the group, but it requires a logout/login to take effect.

```sh
sudo usermod -aG video psrock
```

Verify after re-login:

```sh
groups | grep video
```

## `uwsm` for launching

Hyprland is launched via `uwsm` (in `extra`), which wraps it as a systemd user unit. This correctly sets `WAYLAND_DISPLAY`, `XDG_RUNTIME_DIR`, and starts portals. The `~/.zprofile` handles this:

```sh
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec uwsm start -- Hyprland
fi
```

## Blur and shadows disabled

Both hurt performance significantly in VMware. Disabled in `hyprland.conf`:

```
decoration {
    blur        { enabled = false }
    drop_shadow = false
}
```

## No Mason for LSPs

All required LSPs are in Arch's `extra` repo. Install via pacman — Mason is not used and not installed.

## Kitty: `sync_to_monitor = no`

Kitty's default vsync causes noticeable lag in VMware. Set in `kitty.conf`:

```
sync_to_monitor no
```

## GPU enable note

If running VMware Workstation, ensure **3D acceleration** is enabled in VM settings:
*VM → Settings → Display → Accelerate 3D graphics*

Without this, `vmwgfx` won't expose a DRM device and Hyprland won't start.
