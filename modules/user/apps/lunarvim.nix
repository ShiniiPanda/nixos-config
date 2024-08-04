{ config, lib, pkgs, ... }:
let
  cfg = config.localModules.lunarvim.enable;
in
{

  options = {
    localModules.lunarvim.enable = mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Enable LunarVim"
    };
  };

  config = mkIf cfg {
    home.packages = with pkgs; [
      lunarvim
    ];
  };
}
