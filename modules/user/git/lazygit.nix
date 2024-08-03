{ config, lib, ... }:

let
  cfg = config.lazygit.enable;
in
{
  options = {
    lazygit.enable = lib.mkEnableOption "enable lazygit module";
  };

  config = lib.mkIf cfg {
    programs.lazygit.enable = true;
  };
}
