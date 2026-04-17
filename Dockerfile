# hadolint global ignore=DL3008,SC1091
FROM ubuntu:26.04
ARG USER
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

ENV USER=$USER
RUN  userdel -r ubuntu && \
  useradd  -m -s /bin/bash -u 1000 $USER && \
  mkdir -m 0755 /nix && chown $USER /nix

USER $USER
WORKDIR /home/$USER
