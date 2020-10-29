{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.texlive.combined.scheme-medium
  ];
}
