{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ kitty ];

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = lib.mkForce "0.85";
      confirm_os_window_close = 0;
      window_padding_width = "10";
    };
    shellIntegration.enableZshIntegration = true;
  };
}
