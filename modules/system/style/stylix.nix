{ config, lib, inputs,  userSettings, ...}:

{
  stylix.enable = true;
  stylix.image = /home/${userSettings.profile}/Pictures/Wallpapers/moonman.png;
  stylix.autoEnable = false;
  stylix.targets = {
    kitty.enable = true;
  };

}
