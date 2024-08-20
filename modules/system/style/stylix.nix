{ userSettings, pkgs, lib, ...}:
let
  inherit (pkgs) fetchurl;
  theme = ../../../themes/${userSettings.theme}/theme.yaml;
  polarity = lib.removeSuffix "\n" (builtins.readFile ../../../themes/${userSettings.theme}/polarity.txt);
  background = builtins.readFile ../../../themes/${userSettings.theme}/background.txt;
  background256 = builtins.readFile ../../../themes/${userSettings.theme}/backgroundsha256.txt;
in
{
  # Credit goes to librephoenix aka Emmet for helping me tons with organizing my styles!
  stylix.enable = true;
  stylix.image = fetchurl {
    url = background;
    sha256 = background256; 
  }; 
#  stylix.base16Scheme = theme;
  stylix.polarity = polarity;
}
