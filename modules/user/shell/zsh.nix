{ ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      snvim = "sudo -E nvim";
      slgit = "sudo -E lazygit";
      nixos = "cd /home/panda/nix";
      rebuild =
        "sudo nixos-rebuild switch --flake '/home/panda/nix/profiles/default#default'";
      repos = "cd ~/Documents/Programming/Repos/";
      learning = "cd ~/Documents/Programming/Learning/";
      lf = "lfcd";
      lgit = "lazygit";
      ldock = "lazydocker";
      develop = "nix develop -c zsh";
      cdir = "cd $(wl-paste)";
      cpdir = "pwd | wl-copy";
    };

    initContent = ''
      lfcd () {
      # `command` is needed in case `lfcd` is aliased to `lf`
        cd "$(command lf -print-last-dir "$@")"
      }
    '';

    oh-my-zsh = { enable = true; };
  };

}
