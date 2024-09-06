#!/usr/bin/env bash
# script to list themes in rofi dmenu fr ong
themes=""

for t in /etc/nixos/themes/*/; do
  noTrail=${t%/} # Remove trailing /
  pure=${noTrail##*/} # Extract pure directory name
  if [[ -z $themes ]]; then
    themes+=$pure
  else
    themes+="\n$pure" 
  fi
done

newTheme=$(echo -e $themes | rofi -dmenu)
if [[ -z $newTheme ]]; then
  echo "Returned early!"
  exit
fi
sudo sed -i "/theme =/s/\"[^\"]*\"/\"$newTheme\"/" /etc/nixos/flake.nix && \
  notify-send "Setting theme to $newTheme" "Rebuilding system..." && \
  sudo nixos-rebuild switch --flake '/etc/nixos#default' && \
  killall hyprpaper

