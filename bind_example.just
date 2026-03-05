default:
    docker run -it --rm \
    -v $(pwd)/.root/nix:/nix \
    -v $(pwd)/.root/home/ubuntu:/home/ubuntu \
    local/home-manager-container bash

project project-path project-name:
    mkdir -p .root/home/ubuntu/repos/{{ project-name }}
    docker run -it --rm \
    -v $(pwd)/.root/nix:/nix \
    -v $(pwd)/.root/home/ubuntu:/home/ubuntu \
    -v {{ project-path }}:/home/ubuntu/repos/{{ project-name }} \
    -w /home/ubuntu/repos/{{ project-name }} \
    local/home-manager-container bash

foo:
    just bind project ${HOME}/repos/foo foo

bar:
    just bind project ${HOME}/repos/bar bar
