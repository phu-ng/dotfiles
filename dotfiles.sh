#!/bin/bash

dotfiles() {
  DOT_FILE_LOCATION="~/setup/dotfiles"
  # List of dotfiles and their locations
  declare -A DOTFILES=(
    [".gitconfig"]="$DOT_FILE_LOCATION/.gitconfig"
    [".vimrc"]="$DOT_FILE_LOCATION/.vimrc"
    [".terraformrc"]="$DOT_FILE_LOCATION/.terraformrc"
  )

  # Loop through each dotfile and create a symlink if it doesn't exist
  for dotfile in "${!DOTFILES[@]}"; do
    target="${DOTFILES[$dotfile]}"
    
    if [ ! -L "$HOME/$dotfile" ]; then
      echo "Creating symlink for $dotfile..."
      ln -s "$target" "$HOME/$dotfile"
    else
      echo "$dotfile already exists as a symlink. Skipping."
    fi
  done  
}
