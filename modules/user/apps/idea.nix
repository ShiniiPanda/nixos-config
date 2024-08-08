{ pkgs, config, lib, ... }:
let
  cfg = config.localModules.jetbrains.idea-community.enable;
in
{
  options.localModules.jetbrains.idea-community.enable = lib.mkEnableOption "Enable Jetbrains Idea Community Edition";
  config = lib.mkIf cfg {  
    home.packages = with pkgs.jetbrains; [
      idea-community
    ];
  };
}
