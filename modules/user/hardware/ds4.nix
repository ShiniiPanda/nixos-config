{ pkgs, lib, ... }: { home.packages = with pkgs; [ python314Packages.ds4drv ]; }
