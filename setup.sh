#!/bin/bash

set -euo pipefail

# Check if any arguments were passed
if [[ $# -gt 0 ]]; then
  case "$1" in
    "packages")
      # Run package installation script
      source ./install_packages.sh
      install_packages
      ;;
    "services")
      # Run service installation script
      source ./install_services.sh
      install_services
      ;;
    "dotfiles")
      # Create symlink for dotfiles
      source ./dotfiles.sh
      dotfiles
      ;;
    "config-gnome")
      # Create symlink for dotfiles
      source ./config_gnome.sh
      config_gnome
      ;;
    *)
      echo "Usage: $0 {packages|services}"
      exit 1
      ;;
  esac
else
  # If no argument, show the menu
  echo "=============================="
  echo "    System Setup Script"
  echo "=============================="
  echo "1) Install packages"
  echo "2) Install services"
  echo "3) Dotfiles"
  echo "4) Config Gnome"
  echo "*) Exit"
  echo
  read -rp "Choose an option [1-*]: " choice
  case "$choice" in
    1) source ./install_packages.sh && install_packages ;;
    2) source ./install_services.sh && install_services ;;
    3) source ./dotfiles.sh && dotfiles ;;
    4) source ./config_gnome.sh && config_gnome ;;
    5) echo "Goodbye!"; exit 0 ;;
    *) echo "❌ Invalid option"; exit 1 ;;
  esac
fi
