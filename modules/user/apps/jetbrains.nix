{ ... }:
{

  imports = [
    ./idea.nix
  ];

  localModules.jetbrains = {
    idea-community.enable = true;
    rider.enable = true;
  };
}
