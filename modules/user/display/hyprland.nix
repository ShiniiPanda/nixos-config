{ lib, config, pkgs, ... }:

{

  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
    size = 36;
  };

  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    plugins = with pkgs.hyperlandPlugins; [
      hyprspace
      hyprtrails
      hyprbars
    ];
  };
}
