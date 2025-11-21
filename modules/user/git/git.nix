{ config, lib, ...}:

{

  imports = [
    ./lazygit.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        Name = "Shinii";
        Email = "celisiagaming@gmail.com";
      };
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

}

