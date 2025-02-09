{ pkgs, inputs, lib, ... }:
{

  home.packages = with pkgs; [
    rustc
    rustup
    cargo
  ];

}
