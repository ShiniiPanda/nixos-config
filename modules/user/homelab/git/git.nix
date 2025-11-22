{ config, lib, ... }:

{

  imports = [ ../../common/git/lazygit.nix ];

  programs.git = {
    enable = true;
    userName = "Shinii-Homelab";
    userEmail = "celisiagaming@gmail.com";
    init.defaultBranch = "main";
    safe.directory = "/etc/nixos";
  };

  lazygit.enable = true;
}
