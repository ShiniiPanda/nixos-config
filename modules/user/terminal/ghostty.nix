{ userSettings, inputs, lib, pkgs, ...  }:
{

  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.stdEnv.hostPlatform.system}.default;
    enableZshIntegration = true;
    settings = {
      background-opacity = lib.mkForce 0.85;
      window-padding-x = 2;
      window-padding-y = 2;
    };
  };

}
