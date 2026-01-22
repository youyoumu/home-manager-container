# OpenCode Container

A Docker container setup that provides a persistent, encapsulated development environment for running OpenCode AI with tracked configuration and tool installations.

## Overview

This project creates a barebones Ubuntu Docker container with mounted persistence for:

- `/nix` store - Nix package manager storage
- `/home/ubuntu` - User home directory with tools and configurations

The setup tracks configuration files and installation scripts in version control while keeping the actual installations persistent across container runs.

## Quick Start

1. Build the container:

```bash
just docker-build
```

2. Run with persistent storage:

```bash
just docker-run-bind-root
```

3. Run with a project mounted:

```bash
just docker-run-bind-project /path/to/your/project my-project
```

## Available Commands

### Docker Commands (via Just)

- `just docker-build` - Build the Docker image
- `just docker-run` - Run basic container
- `just docker-run-bind-root` - Run with persistent storage
- `just docker-run-bind-project <path> <name>` - Run with project mounted

### Setup Commands (inside container)

**First-time Setup Sequence:**
```bash
just install-nix              # Install Nix package manager
just install-rustup           # Install Rust toolchain
just install-rust             # Configure stable Rust with rust-analyzer
just install-fnm              # Install Fast Node Manager (requires Rust)
just install-node             # Install LTS Node.js via fnm
just install-pnpm             # Install pnpm package manager
just install-opencode         # Install OpenCode AI CLI
just home-manager-switch      # Apply Home Manager configuration
```

**Other Commands:**
- `just clean` - Clean Nix store garbage

## Architecture

### Persistence Strategy

- `.root/nix/` - Mounted to container's `/nix` (Nix store)
- `.root/home/ubuntu/` - Mounted to container's `/home/ubuntu`
- Tracked files in `.root/home/ubuntu/`:
  - `Justfile` - Installation scripts
  - `.config/home-manager/` - Home Manager configuration
  - `.config/nix/` - Nix configuration

