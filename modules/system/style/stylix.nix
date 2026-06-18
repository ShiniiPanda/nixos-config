{ userSettings, pkgs, lib, ... }:
let
  inherit (pkgs) fetchurl;

  imageRegex = "^${userSettings.theme}\\.[^[:space:]]+$";
  image = builtins.toString
    (builtins.filter (f: builtins.match imageRegex f != null)
      (builtins.attrNames
        (builtins.readDir ../../../themes/${userSettings.theme})));
  imageExists = if file == "" then false else true;

  themeYAML = ../../../themes/${userSettings.theme}/theme.yaml;
  themeJSON = ../../../themes/${userSettings.theme}/theme.json;
  theme = if builtins.pathExists themeYAML then
    themeYAML
  else if builtins.pathExists themeJSON then
    themeJSON
  else
    null;

  polarity = lib.removeSuffix "\n"
    (builtins.readFile ../../../themes/${userSettings.theme}/polarity.txt);

  background = if !fileExists then
    builtins.readFile ../../../themes/${userSettings.theme}/background.txt
  else
    "";

  background256 = if !fileExists then
    builtins.readFile ../../../themes/${userSettings.theme}/backgroundsha256.txt
  else
    "";

in {
  # Credit goes to librephoenix aka Emmet for helping me with organizing my styles!
  stylix.enable = true;
  stylix.image = if fileExists then
    ../../../themes/${userSettings.theme}/${file}
  else
    fetchurl {
      url = background;
      sha256 = background256;
    };
  stylix.base16Scheme = lib.mkIf (theme != null) theme;
  stylix.polarity = polarity;
}
