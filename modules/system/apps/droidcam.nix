{ pkgs, ... }:
{

  programs.droidcam = {
    enable = true;
  };
  
  environment.systemPackages = with pkgs; [ v4l-utils ];
  security.polkit.enable = true;
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=2 video_nr=1,2 card_label="Droidcam,OBS Virtual Cam" exclusive_caps=1,1 
  '';

}
