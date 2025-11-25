{ pkgs, lib, ... }: {

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "shinii";
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

}
