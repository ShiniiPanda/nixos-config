{ pkgs, ... }:
{
  
  home.packages = with pkgs; [
    libnotify
  ];

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 6000;
    };
  };

}
