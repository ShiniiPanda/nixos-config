{ lib, config, ... }:
let
  cfg = config.localModules.lf.enable;
in
{
  
  options.localModules.lf.enable = lib.mkEnableOption "Enables LF terminal file manager";

  config = lib.mkIf cfg {

    programs.lf = {
      enable = true;
    };

  };

}
