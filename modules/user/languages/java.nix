{ pkgs, ... }: {

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  home.packages = with pkgs; [ cacert ];

  home.sessionVariables = {
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

}
