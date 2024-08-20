{  config, lib, pkgs, userSettings, inputs, ... }:
let
  super = "SUPER"; 
  terminal = "kitty";
  browser = userSettings.browser;
  launcher = userSettings.launcher;
  fileManager = userSettings.fileManager;
  hyprland-plugins = inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
  screenshotsPath = /home/${userSettings.profile}/Pictures/Screenshots;
in
{

  imports = [
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    hyprpaper
  ];

  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
    size = 32;
  };
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    plugins = [
      hyprland-plugins.hyprexpo
    ];

    settings = {

      env = [
        "XCURSOR_SIZE,32"
        "HYPRCURSOR_SIZE,32"
      ];

      general = {
        
        gaps_in = 5;
        gaps_out = 20;

        border_size = 2;

    # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false; 

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      monitor = [
        ",preferred,auto,1"
        "eDP-1,1920x1080@144,0x0,1,bitdepth,10"
        "HDMI-A-1,1920x1080@60,1920x250,1,bitdepth,10"
      ];

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;

        # Hyprland wiki blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      # Hyprland wiki misc
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us,eg";
        kb_variant = "";
        kb_model = "";
        kb_options = "grp:alt_shift_toggle";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0; # From -1.0 to 1.0.
        touchpad = {
          natural_scroll = false;
        };
      };

      #Hyprland wiki gestures
      gestures = {
        workspace_swipe = false;
      };

      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
      ];

      bind = [
        "${super}, Q, exec, ${terminal}"
        "${super}, C, killactive,"
        "${super}, M, exit,"
        "${super}, E, exec, ${fileManager}"
        "${super}, V, togglefloating,"
        "${super}, P, pseudo,"
        "${super}, J, togglesplit," 
        "${super}, S, exec, killall rofi || rofi -show drun -show-icons"
        "${super}, B, exec, ${browser}"

        # Hypr Expo
        "${super}, tab, hyprexpo:expo, toggle"

        # Move focus with mainMod + arrow keys
        "${super}, left, movefocus, l"
        "${super}, right, movefocus, r"
        "${super}, up, movefocus, u"
        "${super}, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "${super}, 1, workspace, 1"
        "${super}, 2, workspace, 2"
        "${super}, 3, workspace, 3"
        "${super}, 4, workspace, 4"
        "${super}, 5, workspace, 5"
        "${super}, 6, workspace, 6"
        "${super}, 7, workspace, 7"
        "${super}, 8, workspace, 8"
        "${super}, 9, workspace, 9"
        "${super}, 0, workspace, 10"
        
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "${super}_SHIFT, 1, movetoworkspace, 1"
        "${super}_SHIFT, 2, movetoworkspace, 2"
        "${super}_SHIFT, 3, movetoworkspace, 3"
        "${super}_SHIFT, 4, movetoworkspace, 4"
        "${super}_SHIFT, 5, movetoworkspace, 5"
        "${super}_SHIFT, 6, movetoworkspace, 6"
        "${super}_SHIFT, 7, movetoworkspace, 7"
        "${super}_SHIFT, 8, movetoworkspace, 8"
        "${super}_SHIFT, 9, movetoworkspace, 9"
        "${super}_SHIFT, 0, movetoworkspace, 10"
        "${super}_SHIFT, A, exec, pavucontrol"
        "${super}_SHIFT, M, exec, spotify"
        "${super}_SHIFT, D, exec, vesktop"
        "${super}_SHIFT, S, exec, flameshot gui -c -p ${screenshotsPath}"

        # Example special workspace (scratchpad)
        "${super}, F, togglespecialworkspace, magic"
        "${super}_SHIFT, F, movetoworkspace, special:magic"
        
        # Scroll through existing workspaces with mainMod + scroll
        "${super}, mouse_down, workspace, e+1"
        "${super}, mouse_up, workspace, e-1"
      ];

      bindm = [
        "${super}, mouse:272, movewindow"
        "${super}, mouse:273, resizewindow"
      ];

      exec-once = [ 
        "hyprpaper"
        "mako"
        "nm-applet"
        "blueman-applet"
        "waybar"
        "flameshot"
      ];  
    };

    extraConfig = ''
      windowrulev2 = suppressevent maximize, class:.* 
    '';
  };
}
