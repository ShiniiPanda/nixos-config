{ config, lib, ... }:
let
  modules = config.localModules;
in
{

  imports = [ ./flameshot.nix ./btop.nix ./lf.nix ./jq.nix ./fastfetch.nix ];

  # All utilites are enabled by default. To selectively disable some just do modules.[name].enable = false;
  config.localModules.flameshot.enable = lib.mkDefault false;
  config.localModules.btop.enable = lib.mkDefault true;
  config.localModules.lf.enable = lib.mkDefault true;
  config.localModules.jq.enable = lib.mkDefault true;
  config.localModules.fastfetch.enable = lib.mkDefault true;
}
