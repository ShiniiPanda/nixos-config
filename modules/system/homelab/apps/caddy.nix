{ lib, pkgs, ... }:
{

  services.caddy = {
    enable = true;
    virtualHosts."boss.shinii.space".extraConfig = ``
      root * /srv/www/static
      file_server
    ``;
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];

}
