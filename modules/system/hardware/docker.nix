{ pkgs, userSettings, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  users.users.${userSettings.profile}.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    lazydocker
  ];
}
