{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
    extensions = with pkgs.vscode-extensions; [ 
      ms-dotnettools.csharp
      ms-dotnettools.csdevkit
      ziglang.vscode-zig
      bradlc.vscode-tailwindcss
      ecmel.vscode-html-css
      ms-python.python
      gencer.html-slim-scss-css-class-completion
      vscodevim.vim
    ];
    userSettings = {
      "editor.fontFamily" = "MesloLGM Nerd Font Mono";
      "terminal.integrated.fontSize" = 16;
      "editor.colorDecoratorsActivatedOn" = "click";
      "editor.fontSize" = 18;
      "window.newWindowDimensions" = "fullscreen";
      "vim.smartRelativeLine" = true;
    };
  };
}
