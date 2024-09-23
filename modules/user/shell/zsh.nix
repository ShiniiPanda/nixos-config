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
      slgit = "sudo -E lazygit";
      nixos = "cd /etc/nixos";
      rebuild = "sudo nixos-rebuild switch --flake '/etc/nixos#default'";
      repos = "cd ~/Documents/Programming/Repos/";
      learning = "cd ~/Documents/Programming/Learning/";
      lf = "lfcd";
      modules = "cd /etc/nixos/modules";
      lgit = "lazygit";
      ldock = "lazydocker";
      develop = "nix develop -c zsh";
      cdir = "cd $(wl-paste)";
    };

    initExtra = ''
      lfcd () {
      # `command` is needed in case `lfcd` is aliased to `lf`
        cd "$(command lf -print-last-dir "$@")"
      }
    '';

    oh-my-zsh = {
      enable = true;
    };
  };

}
