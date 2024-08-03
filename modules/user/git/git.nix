{ config, lib, ...}:

{

  programs.git = {
    enable = true;
    userName = "Shinii";
    userEmail = "celisiagaming@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

}

