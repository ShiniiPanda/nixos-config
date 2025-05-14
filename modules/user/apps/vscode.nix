{ pkgs, lib, ... }:
let
inherit (lib) mkForce;
in
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; [ 
        ms-dotnettools.csharp
        ms-dotnettools.csdevkit
        ms-dotnettools.vscode-dotnet-runtime
        ms-dotnettools.vscodeintellicode-csharp
        ziglang.vscode-zig
        bradlc.vscode-tailwindcss
        ecmel.vscode-html-css
        ms-python.python
        gencer.html-slim-scss-css-class-completion
        vscodevim.vim
      ];
      userSettings = {
        "editor.fontFamily" = mkForce "MesloLGM Nerd Font Mono";
        "terminal.integrated.fontFamily" = mkForce "MesloLGM Nerd Font Mono";
        "editor.colorDecoratorsActivatedOn" = "click";
        "window.newWindowDimensions" = "fullscreen";
        "vim.smartRelativeLine" = true;
      };
    };
  };
}
