{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.texlive.combined.scheme-medium
    pkgs.pinentry_mac
    pkgs.watchman
  ];
}
