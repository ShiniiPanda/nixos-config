{ config, lib, ... }:
let
  modules = config.localModules;
in
{

  imports = [ ./flameshot.nix ./btop.nix ./lf.nix ./jq.nix ];

  # All utilites are enabled by default. To selectively disable some just do modules.[name].enable = false;
  config.localModules.flameshot.enable = true;
  config.localModules.btop.enable = true;
  config.localModules.lf.enable = true;
  config.localModules.jq.enable = true;
}
