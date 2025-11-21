{ pkgs, inputs, lib, ... }:
{

  home.packages = with pkgs; [
    rustup
    gcc
  ];

}
