{ config, lib, ... }:

{

  imports = [ ../common/git/lazygit.nix ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        Name = lib.mkDefault "Shinii";
        Email = "celisiagaming@gmail.com";
      };
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  services.ssh-agent = {
    enable = true;
    enableZshIntegration = true;
  };

  lazygit.enable = true;
}
