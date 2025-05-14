{ userSettings, pkgs, lib, ...}:
let
  inherit (pkgs) fetchurl;
  regex = ''^${userSettings.theme}\.[^\s]+$'';
  file = builtins.toString (builtins.filter (f: builtins.match regex f != null)
    (builtins.attrNames (builtins.readDir ../../../themes/${userSettings.theme})));
  fileExists = if file == "" then false else true;
  # theme = ../../../themes/${userSettings.theme}/theme.yaml;
  polarity = lib.removeSuffix "\n" (builtins.readFile ../../../themes/${userSettings.theme}/polarity.txt);
  background = if !fileExists then builtins.readFile ../../../themes/${userSettings.theme}/background.txt else "";
  background256 = if !fileExists then builtins.readFile ../../../themes/${userSettings.theme}/backgroundsha256.txt else "";
in
{
  # Credit goes to librephoenix aka Emmet for helping me with organizing my styles!
  stylix.enable = true;
  stylix.image = if fileExists then ../../../themes/${userSettings.theme}/${file}
    else fetchurl {
      url = background;
      sha256 = background256; 
  }; 
#  stylix.base16Scheme = theme;
  stylix.polarity = polarity;
}
