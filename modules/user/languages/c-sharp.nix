{ pkgs, ...}:
{

  home.packages = with pkgs; [
    dotnetCorePackages.sdk_8_0_1xx
    omnisharp-roslyn
  ];

}
