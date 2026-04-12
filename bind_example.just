# Copy this file to bind.just and customize the paths

user := "user"

default:
    docker run -it --rm \
    -v $(pwd)/.root/nix:/nix \
    -v $(pwd)/.root/home/ubuntu:/home/ubuntu \
    -v ${HOME}/.local/share/pnpm:/home/ubuntu/.local/share/pnpm \
    local/home-manager-container bash

# Can the pnpm store-dir be changed via environment variable? https://github.com/orgs/pnpm/discussions/9459
project project-path project-name:
    mkdir -p .root/home/ubuntu/repos/{{ project-name }}
    docker run -it --rm \
    -e npm_config_store_dir=/home/{{ user }}/.local/share/pnpm/store \
    -v $(pwd)/.root/nix:/nix \
    -v $(pwd)/.root/home/ubuntu:/home/ubuntu \
    -v ${HOME}/.local/share/pnpm:/home/{{ user }}/.local/share/pnpm \
    -v {{ project-path }}:/home/ubuntu/repos/{{ project-name }} \
    -w /home/ubuntu/repos/{{ project-name }} \
    local/home-manager-container bash

foo:
    just bind project ${HOME}/repos/foo foo

bar:
    just bind project ${HOME}/repos/bar bar
