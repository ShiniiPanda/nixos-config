{ pkgs, config, lib, ... }:
let
  cfg = config.localModules.btop.enable;
in
{

  options.localModules.btop.enable = lib.mkEnableOption "Enable Btop++";
  config = lib.mkIf cfg {
    programs.btop = {
      enable = true;
    };
  };

}
