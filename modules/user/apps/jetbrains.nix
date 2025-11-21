{ ... }: {

  imports = [
    ./idea.nix
    # ./rider.nix
  ];

  localModules.jetbrains = {
    idea-community.enable = true;
    # rider.enable = true;
  };
}
