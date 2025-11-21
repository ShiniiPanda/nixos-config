{ pkgs, inputs, lib, ...}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      keyboardShortcut
    ];
    # Handled by stylix lmfao..
    # theme = spicePkgs.themes.catppuccin;
    # colorScheme = "macchiatto";
  };
}
