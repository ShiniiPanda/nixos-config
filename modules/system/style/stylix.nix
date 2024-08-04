{ userSettings, pkgs, ...}:
let
  themePath = ./themes/${userSettings.theme}.nix;
  themeExists = builtins.path themePath;
in
{
  imports = [] ++ (if themeExists then [themePath] else [./themes/default.nix]);
  stylix.enable = true;
  stylix.image = /home/${userSettings.profile}/Pictures/Wallpapers/moonman.png;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
}
