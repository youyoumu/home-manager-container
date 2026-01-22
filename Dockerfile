# hadolint global ignore=DL3008,SC1091
FROM ubuntu:24.04
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  xz-utils \
  sudo \
  ca-certificates \
  unzip \
  just \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -m 0755 /nix && chown ubuntu /nix

USER ubuntu
ENV USER=ubuntu
WORKDIR /home/ubuntu
