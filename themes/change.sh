#!/usr/bin/env bash
# script to list themes in rofi dmenu fr ong
themes=""

for t in /home/panda/nix/themes/*/; do
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
sudo sed -i "/theme =/s/\"[^\"]*\"/\"$newTheme\"/" /home/panda/nix/profiles/default/flake.nix && \
  notify-send "Setting theme to $newTheme" "Rebuilding system..." && \
  sudo nixos-rebuild switch --flake '/home/panda/nix/profiles/default#default' && \
  killall hyprpaper

