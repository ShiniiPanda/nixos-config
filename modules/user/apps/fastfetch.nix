{ config, lib, ... }:
let
  cfg = config.localModules.fastfetch.enable;
in
{

  options.localModules.fastfetch.enable = lib.mkEnableOption "Enable Fastfetch";

  config = lib.mkIf cfg {
    programs.fastfetch = {
      enable = true;
    };
  };
}
