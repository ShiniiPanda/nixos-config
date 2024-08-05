{ pkgs, lib, ... }:

{

  home.packages = with pkgs; [ kitty ];
  programs.kitty.enable = true;
  programs.kitty.settings = {
    background_opacity = lib.mkFOrce "0.85";
  };

}
