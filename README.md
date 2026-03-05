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
just docker build
```

Run the container with persistent nix store and home directory:

```bash
just bind
```

## Just Commands

| Command                           | Description                             |
| --------------------------------- | --------------------------------------- |
| `just docker build`               | Build the Docker image                  |
| `just docker run`                 | Run container interactively             |
| `just bind`                       | Run with bound nix and home directories |
| `just bind project <path> <name>` | Run with additional project bound       |

## Project Binding Examples

Copy `bind_example.just` to `bind.just` and customize for your projects:

```bash
cp bind_example.just bind.just
# Edit paths in bind.just to match your setup
just bind foo  # Opens project foo
just bind bar  # Opens project bar
```

## Inside the Container

Use the Justfile at `~/.home/ubuntu/Justfile`:

```bash
just default                # home-manager-switch
just clean                  # Clean nix store
just install nix            # Install nix (if needed)
just install home-manager   # Apply home-manager configuration
just install rustup         # Install Rust toolchain
just install node           # Install Node.js via fnm
just install pnpm           # Install pnpm
just install opencode       # Install opencode CLI
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
