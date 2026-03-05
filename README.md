# Home Manager Container

A Docker container for development with Nix and Home Manager pre-configured.

## What's Included

- **Ubuntu 24.04** base
- **Nix** package manager (single-user mode)
- **Home Manager** for declarative dotfile management
- **Fish** shell with starship prompt
- **Neovim** as default editor
- **yazi** - file manager
- **fzf** - fuzzy finder
- **zoxide** - smart cd
- Plus: bat, fd, ripgrep, git, fastfetch, eza, tree, dust

## Quick Start

Build the Docker image:

```bash
just docker-build
```

Run the container with persistent nix store and home directory:

```bash
just docker-run-bind-root
```

## Just Commands

| Command | Description |
|---------|-------------|
| `just docker-build` | Build the Docker image |
| `just docker-run` | Run container interactively |
| `just docker-run-bind-root` | Run with bound nix and home directories |
| `just docker-run-bind-project <path> <name>` | Run with additional project bound |

## Inside the Container

Use the Justfile at `~/.home/ubuntu/Justfile`:

```bash
just install-nix          # Install nix (if needed)
just home-manager-switch # Apply home-manager configuration
just install-rustup      # Install Rust toolchain
just install-node        # Install Node.js via fnm
just install-opencode    # Install opencode CLI
just clean               # Clean nix store
```

## Configuration

Home Manager configuration is in:
```
.root/home/ubuntu/.config/home-manager/
```

Edit `home.nix` to add packages or programs, then run:
```bash
just home-manager-switch
```
