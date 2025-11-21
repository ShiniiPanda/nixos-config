{ pkgs, lib, config, ...}:
let
  inherit (config.lib.formats.rasi) mkLiteral;
  inherit (config.lib.stylix.colors.withHashtag) base00 base05 base01;
in
{

  imports = [ ./rofimoji.nix ];
  programs.rofi = {
    enable = true;
    cycle = false;
    package = pkgs.rofi;
    terminal = "kitty";
    theme = lib.mkForce {
      "*" = {
        font = "MesloLGM Nerd Font Mono 12";
        background-color = mkLiteral "transparent";
        foreground = mkLiteral "${base05}";
        text-color = mkLiteral "${base05}";
        padding = mkLiteral "0px";
        margin = mkLiteral "0px";
      };

      window = {
        full-screen = false;
        location = mkLiteral "center";
        width = mkLiteral "640px";
        border-radius = mkLiteral "8px";
      };

      inputbar = {
        font = "MesloLGM Nerd Font Mono 20";
        padding = mkLiteral "12px";
        spacing = mkLiteral "12px";
        children = map mkLiteral [
          "icon-search"
          "entry"
        ];
      };

      icon-search = {
        expand = false;
        filename = "search";
        size = mkLiteral "28px";
      };

      "icon-search, entry, element-icon, element-text" = {
        vertical-align = mkLiteral "0.5";
      };

      entry = {
        font = mkLiteral "inherit";
        placeholder = "Search";
        placeholder-color = mkLiteral "${base05}20";
      };

      message = {
        border = mkLiteral "2px 0 0";
        border-color = mkLiteral "${base00}";
        background-color = mkLiteral "${base00}";
      };

      textbox = {
        padding = mkLiteral "8px 24px";
      };

      listview = {
        lines = mkLiteral "10";
        columns = mkLiteral "1";

        fixed-height = false;
        border = mkLiteral "1px 0 0";
        border-color = mkLiteral "${base00}";
      };

      element = {
        padding = mkLiteral "8px 16px";
        spacing = mkLiteral "16px";
        background-color = mkLiteral "transparent";
      };

      "element normal active" = {
        text-color = mkLiteral "${base00}40";
      };

      "element alternative active" = {
        text-color = mkLiteral "${base00}40";
      };

      "element selected normal, element selected active" = {
        background-color = mkLiteral "${base01}40";
      };

      element-icon = {
        size = mkLiteral "1em";
      };

      element-text = {
        text-color = mkLiteral "inherit";
      };
    };
  };

}
