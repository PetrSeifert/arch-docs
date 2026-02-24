# Dev Tools

## Rust

Installed via `rustup` (the toolchain manager), not pacman's `rust` package:

```sh
sudo pacman -S rustup
rustup default stable
rustup component add rust-src clippy
```

| Component | Why |
|-----------|-----|
| `stable` toolchain | Default compiler, `rustc`, `cargo`, `rustfmt` |
| `rust-src` | Required by `rust-analyzer` for std jump-to-definition |
| `clippy` | Linter — runs on save via `rust_analyzer.checkOnSave.command = "clippy"` |

Binaries land in `~/.cargo/bin/` (on PATH via `.zshrc`).

## Node / pnpm

```sh
sudo pacman -S nodejs pnpm
```

After install, run once in a **new shell**:

```sh
pnpm setup
```

This adds `PNPM_HOME` to your environment and updates `~/.zshrc`. Already pre-configured in `.zshrc`:

```sh
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"
```

## Build tools

| Package | Provides |
|---------|---------|
| `base-devel` | `gcc`, `make`, `binutils`, `patch`, etc. |
| `cmake` | CMake build system |
| `meson` | Meson build system |
| `ninja` | Ninja build backend |

Installed in Phase 1 (`base-devel`) and Phase 6 (`cmake`, `meson`, `ninja`).
