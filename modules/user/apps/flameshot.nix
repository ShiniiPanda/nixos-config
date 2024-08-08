{ pkgs, lib, config, ...}:
let
  cfg = config.localModules.flameshot.enable;
in
{
  options.localModules.flameshot.enable = lib.mkEnableOption "Enable Flameshot";

  config = lib.mkIf cfg {
    home.packages = with pkgs; [
      flameshot
    ];
  };
}
