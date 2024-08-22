{ pkgs, ...}:
{

  home.packages = with pkgs; [ rofimoji ];
  # Configuring it to copy straight into wl-clipboard god bless
  home.file.".config/rofimoji.rc".text = ''
    action = copy
    skin-tone = moderate
  '';

}
