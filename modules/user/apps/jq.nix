{ lib, config, ... }:
let
  cfg = config.localModules.jq.enable;
in
{

  options.localModules.jq.enable = lib.mkEnableOption "Enable JQ Json Parser";

  config = lib.mkIf cfg {
    programs.jq = {
      enable = true;
  };

  };
}
