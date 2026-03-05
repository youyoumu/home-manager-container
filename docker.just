build:
    docker build -t local/home-manager-container .

run:
    docker run -it --rm local/home-manager-container
