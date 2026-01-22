docker-build:
    docker build -t youyoumu2025/opencode-container .

docker-run:
    docker run -it --rm youyoumu2025/opencode-container

docker-run-bind-root:
    docker run -it --rm \
    -v $(pwd)/.root/nix:/nix \
    -v $(pwd)/.root/home/ubuntu:/home/ubuntu \
    youyoumu2025/opencode-container bash
