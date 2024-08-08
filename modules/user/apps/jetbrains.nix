{ config , ... }:
let
  jetbrains = config.localModules.jetbrains;
in
{

  imports = [
    ./idea.nix
  ];

  ${jetbrains} = {
    idea-community.enable = true;
  };
}
