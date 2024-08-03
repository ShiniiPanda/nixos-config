{ config, lib, inputs,  userSettings, ...}:

{

  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix.enable = true;
  stylix.image = /home/${userSettings.profile}/Pictures/Wallpapers/moonman.png;
  stylix.autoEnable = false;
  stylix.targets = {
    gnome.enable = lib.mkForce false;
    kitty.enable = true;
  };
}
