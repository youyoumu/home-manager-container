#!/usr/bin/env bash
set -e

default() {
  docker run -it --rm \
    -v "$(pwd)/.root/nix:/nix" \
    -v "$(pwd)/.root/home/ubuntu:/home/$USER" \
    -v "$HOME/.local/share/pnpm:/home/$USER/.local/share/pnpm" \
    -v "$HOME/.local/share/uv:/home/$USER/.local/share/uv" \
    -v "$HOME/.cache/uv:/home/$USER/.cache/uv" \
    local/home-manager-container bash
}

project() {
  local project_path="$1"
  local project_name="$2"

  mkdir -p ".root/home/ubuntu/repos/$project_name"
  docker run -it --rm \
    -e "npm_config_store_dir=/home/$USER/.local/share/pnpm/store" \
    -v "$(pwd)/.root/nix:/nix" \
    -v "$(pwd)/.root/home/ubuntu:/home/$USER" \
    -v "$HOME/.local/share/pnpm:/home/$USER/.local/share/pnpm" \
    -v "$HOME/.local/share/uv:/home/$USER/.local/share/uv" \
    -v "$HOME/.cache/uv:/home/$USER/.cache/uv" \
    -v "$project_path:/home/$USER/repos/$project_name" \
    -w "/home/$USER/repos/$project_name" \
    local/home-manager-container bash
}

case "${1:-default}" in
default)
  default
  ;;
project)
  if [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 project <project-path> <project-name>"
    exit 1
  fi
  project "$2" "$3"
  ;;
*)
  echo "Usage: $0 {default|project <project-path> <project-name>}"
  exit 1
  ;;
esac
