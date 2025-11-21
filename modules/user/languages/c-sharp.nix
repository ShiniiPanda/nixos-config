{ pkgs, ...}:
{
  home.packages = with pkgs; [
    dotnetCorePackages.dotnet_9.sdk
    omnisharp-roslyn
  ];

}
