{ config, lib, ... }:
let
  modules = config.localModules;
in
{

  imports = [ ./flameshot.nix ./btop.nix ];

  # All utilites are enabled by default. To selectively disable some just do modules.[name].enable = false;
  config.localModules.flameshot.enable = true;
  config.localModules.btop.enable = true;
}
