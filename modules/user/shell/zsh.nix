{ ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      slvim = "sudo -E lvim";
      nixos = "cd /etc/nixos";
      rebuild = "sudo nixos-rebuild switch --flake '/etc/nixos#default'";
      repos = "cd ~/Documents/Programming/Repos/";
      learning = "cd ~/Documents/Programming/Learning/";
    };

    oh-my-zsh = {
      enable = true;
    };
  };

}
