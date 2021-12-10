#!/bin/bash
set -euo pipefail

# Directories
mkdir -p ~/{Downloads,Documents,workspace/src}

# RPMFusion
sudo dnf -y install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Some sane defaults
sudo dnf -y install \
  dnf-plugins-core \
  exa \
  fzf \
  git \
  gnome-tweaks \
  htop \
  neovim \
  python3 \
  ranger \
  ripgrep \
  tldr \
  tmux \
  util-linux-user \
  wget

# Chrome; see firefox-nightly.sh for Firefox
sudo dnf config-manager --set-enabled google-chrome
sudo dnf -y install google-chrome-stable

# Sublime Text
sudo rpm --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/dev/x86_64/sublime-text.repo
sudo dnf -y install sublime-text

# 1Password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf -y install 1password
