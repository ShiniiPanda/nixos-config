{ pkgs, config, lib, userSettings, ... }:
let
  inherit (config.lib.stylix.colors.withHashtag) base00 base02 base05 base10 base0D;
in
{

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        margin = "4 4 2 4";
        spacing = 10;

        modules-left = ["tray" "network" "hyprland/window"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["clock" "backlight" "pulseaudio/slider" "temperature" "group/memory" "group/cpu" "group/battery"];

       battery = {
          "states" = {
            "good" = 75;
            "warning" = 30;
            "critical" = 15;
          };
          "fullat" = 80;
          "format" = "{icon}";
          "format-charging" = "󰂄";
          "format-plugged" = "󰂄";
          "format-full" = "󰁹";
          "format-icons" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          "interval" = 10;
        };
        "battery#text" = {
          "states" = {
            "good" = 75;
            "warning" = 30;
            "critical" = 15;
          };
          "fullat" = 80;
          "format" = "{capacity}%";
        };
        "group/battery" = {
          "orientation" = "horizontal";
          "drawer" = {
            "transition-duration" = 500;
            "transition-left-to-right" = true;
          };
          "modules" = [ "battery" "battery#text" ];
        };

        "hyprland/workspaces" = {
          "format" = "{id}";
          #"format-icons" = {
           # "1" = "󱚌";
           # "2" = "󰖟";
           # "3" = "";
           # "4" = "󰎄";
          #};
          "on-click" = "activate";
          "all-outputs" = false;
          "active-only" = false;
          "ignore-workspaces" = ["scratch" "-"];
          "show-special" = false;
        };

        "hyprland/window" = {
          "format" = "{title}";
          "separate-outputs" = true;
          "icon" = true;
          "icon-size" = 20;
        };

        "group/cpu" = {
          "orientation" = "horizontal";
          "modules" = [ "cpu" ];
          "drawer" = {
            "transition-duration" = 500;
            "transition-left-to-right" = true;
          };
        };

        "cpu" = {
          "interval" = 20;
          "format" = "CPU {usage}%";
          "states" = {
            "critical" = 90;
            "average" = 40;
            "chill" = 20;
            "bingchilling" = 0;
          };
          #"format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          "on-middle-click" = "btop -p 1";
        };

        "cpu#text" = {
          "interval" = 20;
          "states" = {
            "critical" = 90;
            "average" = 40;
            "chill" = 20;
            "bingchilling" = 0;
          };
          "format" = "{usage}%";
        };

        "pulseaudio/slider" = {
          "min" = 0;
          "max" = 100;
          "orientation" = "horizontal";
          "on-middle-click" = "pavucontrol";
        };

        "clock" = {
          "interval" = 60;
          "format" = "{:%H:%M}";
          "format-alt" = "{:%A, %B %d, %Y (%R)}  ";
          "timezone" = "Africa/Cairo";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "format" = {
              "months" =     "<span color='#ffead3'><b>{}</b></span>";
              "days" =       "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" =      "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" =   "<span color='#ffcc66'><b>{}</b></span>";
              "today" =      "<span color='#ff6699'><b><u>{}</u></b></span>";            
            };
          };

          "actions"=  {
            "on-click-right"= "mode";
            "on-click-forward"= "tz_up";
            "on-click-backward"= "tz_down";
            "on-scroll-up"= "shift_up";
            "on-scroll-down"= "shift_down";
          };
        };
        
        "group/memory" = {
          "orientation" = "horizontal";
          "modules" = [ "memory" "memory#text" ];
          "drawer" = {
            "transition-duration" = 500;
            "transition-left-to-right" = true;
          };
        };

        "memory" = {
          "interval" = 60;
          "format" = "MEM {percentage}%";
        };

        "memory#text" = {
          "interval" = 120;
          "format" = "{used}/{total}";
        };

        "backlight" = {
          "interval" = 2;
          "scroll-step" = 2;
          "format" = "{percent}% {icon}";
          "format-icons" = [ "" "" ];
        };
        
        "temperature" = {
          "thermal-zone" = 0;
          "critical-threshold" = 90;
          "interval" = 10;
          "format" = "{temperatureC}°C";
          "format-critical" = " {temperatureC}°C";
        };
        
        "network" = {
          "interval" = 60;
          "format-ethernet" = "󰈁";
          "format-wifi" = "{essid} 󰖩";
          "format-disconnected" = "";
        };
        
        "tray" = {
          "icon-size" = 20;
          "spacing" = 10;
        };
      };
    };
    style = ''
      * {
          font-family: "MesloLGM Nerd Font Mono";
          font-size: 12pt;
      }
      
      window#waybar, tooltip {
          background: alpha(${base00}, 0.0);
          color: ${base05};
      }
      
      tooltip {
          border-color: ${base0D};
      }
      #wireplumber,
      #pulseaudio,
      #sndio {
          padding: 0 5px;
      }
      #wireplumber.muted,
      #pulseaudio.muted,
      #sndio.muted {
          padding: 0 5px;
      }
      #upower,
      #battery {
          padding: 0 5px;
      }
      #upower.charging,
      #battery.Charging {
          padding: 0 5px;
      }
      #network {
          padding: 0 5px;
      }
      #network.disconnected {
          padding: 0 5px;
      }
      #user {
          padding: 0 5px;
      }
      #clock {
          padding: 0 5px;
      }
      #backlight {
          padding: 0 5px;
      }
      #cpu {
          padding: 0 5px;
      }
      #disk {
          padding: 0 5px;
      }
      #idle_inhibitor {
          padding: 0 5px;
      }
      #temperature {
          padding: 0 5px;
      }
      #mpd {
          padding: 0 5px;
      }
      #language {
          padding: 0 5px;
      }
      #keyboard-state {
          padding: 0 5px;
      }
      #memory {
          padding: 0 5px;
      }
      #window {
          padding: 0 5px;
      }
      #tray {
        padding: 0 5px 0 10px;
      }
      .modules-left #workspaces button {
          border-bottom: 3px solid transparent;
      }
      .modules-left #workspaces button.focused,
      .modules-left #workspaces button.active {
          border-bottom: 3px solid ${base05};
      }
      .modules-center #workspaces button {
          border-bottom: 3px solid transparent;
      }
      .modules-center #workspaces button.focused,
      .modules-center #workspaces button.active {
          border-bottom: 3px solid ${base05};
      }
      .modules-right #workspaces button {
          border-bottom: 3px solid transparent;
      }
      .modules-right #workspaces button.focused,
      .modules-right #workspaces button.active {
          border-bottom: 3px solid ${base05};
      }

      .modules-right #pulseaudio-slider {
        min-width: 240px;
        min-height: 20px;
      }
    '';
  };

}
