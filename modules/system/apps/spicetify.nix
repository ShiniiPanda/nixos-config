{ pkgs, inputs, lib, ...}:
let
  spicetifyPkgs = inputs.spicetify-nix.leggacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      keyboardSHortcut
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "macchiatto";
  };
}
