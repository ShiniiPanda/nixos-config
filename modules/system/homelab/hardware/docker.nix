{ pkgs, userSettings, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  users.users.${userSettings.profile}.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [ docker docker-compose lazydocker ];
}
