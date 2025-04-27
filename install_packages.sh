#!/bin/bash

install_packages() {
  # Define your packages here
  PACKAGES=(
    git
    curl
    wget
    htop
    syncthing
    zsh
    vim
    gnome-tweaks
    lm_sensors
    gvfs-nfs
    kdiff3
  )

  echo "🔍 Checking for updates..."
  sudo dnf check-update || true

  echo "📦 Installing packages..."
  sudo dnf install -y "${PACKAGES[@]}"

  echo "✅ All packages installed!"
}
