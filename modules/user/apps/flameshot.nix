{ pkgs, lib, config, ...}:
let
  cfg = config.localModules.flameshot.enable;
in
{
  options = {
      localModules.flameshot.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = '' Enable Flameshot '';
    };
  };

  config = lib.mkIf cfg {
    home.packages = with pkgs; [
      flameshot
    ];
  };
}
