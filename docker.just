build:
    docker build --build-arg USER=$USER -t local/home-manager-container .

run:
    docker run -it --rm local/home-manager-container
