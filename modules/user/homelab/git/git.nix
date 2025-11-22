{ config, lib, ... }:

{

  imports = [ ../../common/git/lazygit.nix ];

  programs.git = {
    enable = true;
    userName = "Shinii-Homelab";
    userEmail = "celisiagaming@gmail.com";
    extraConfig = { init.defaultBranch = "main"; };
  };

  lazygit.enable = true;
}
