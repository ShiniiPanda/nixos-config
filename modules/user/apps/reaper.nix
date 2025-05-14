{ pkgs, ...}:
{

  home.packages = with pkgs; [ reaper reaper-sws-extension reaper-reapack-extension ];

}
