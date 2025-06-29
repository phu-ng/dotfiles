#!/bin/bash

config_gnome() {
  # Modify existing shortcut
  echo Set volume up to Alt+Up
  gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Alt>Up']"
  echo Set volume down to Alt+Down
  gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['<Alt>Down']"
  echo Set Switch to workspace 1 to Ctrl+1
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Alt>1']"
  echo Set Switch to workspace 2 to Ctrl+2
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Alt>2']"  
  echo Set Switch to workspace 3 to Ctrl+3
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Alt>3']"
  echo Set Switch to workspace 4 to Ctrl+4
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Alt>4']"
  echo Set Switch windows to Alt+Tab
  gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Control>Tab']"
  echo Set Switch input source to Ctrl+Space
  gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt>space', 'XF86Keyboard']"
  # Creating custom shortcut
  gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
  ## Open Terminal
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Terminal"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "kitty"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Control><Alt>T"
  # Others
  echo Set volume up/down step at 3
  gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 3
  echo Set workspaces to be 4
  gsettings set org.gnome.mutter dynamic-workspaces false
  gsettings set org.gnome.desktop.wm.preferences num-workspaces 4
  echo Set switch windows in current workspace only 
  gsettings set org.gnome.shell.window-switcher current-workspace-only true
}
