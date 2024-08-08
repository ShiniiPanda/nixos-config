{ ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting = true;

    shellAliases = {
      slvim = "sudo -E lvim";
      rebuild = "sudo nixos-rebuild switch --flake '/etc/nixos#default'";
    };

    oh-my-zsh = {
      enable = true;
    };
  };

}
