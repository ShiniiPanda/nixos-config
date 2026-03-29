{ ... }: {

  programs = {
    ssh = { enable = true; };
    keychain = {
      enable = true;
      keys = [ "id_rsa" ];
      agents = [ "ssh" ];
    };
  };

  services.ssh-agent = {
    enable = true;
    enableZshIntegration = true;
  };

}
