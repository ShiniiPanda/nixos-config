{ userSettings, inputs, lib, pkgs, ...  }:
{

  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enableZshIntegration = true;
    settings = {
      background-opacity = lib.mkForce 0.85;
      window-padding-x = 10;
      window-padding-y = 10;
    };
  };

}
