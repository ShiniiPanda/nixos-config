{ pkgs, config, lib, ... }:
let
  cfg = config.localModules.jetbrains.rider.enable;
in
{
  options.localModules.jetbrains.rider.enable = lib.mkEnableOption "Enable Rider IDE";
  config = lib.mkIf cfg {  
    home.packages = with pkgs.jetbrains; [
      rider
    ];
  };
}
