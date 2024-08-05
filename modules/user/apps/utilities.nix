{ config, lib, ... }:
let
  modules = config.localModules;
in
{

  imports = [ ./flameshot.nix ];

  # All utilites are enabled by default. To selectively disable some just do modules.[name].enable = false;
}
