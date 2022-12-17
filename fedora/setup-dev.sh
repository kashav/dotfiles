#!/bin/bash
set -euo pipefail

sudo dnf -y install \
  autoconf \
  clang \
  clang-format \
  gcc \
  gcc-c++ \
  golang \
  hg \
  jq \
  nodejs \
  podman \
  ruby \
  rr \
  shellcheck \
  strace \
  tokei

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
