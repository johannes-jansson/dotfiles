{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.firefox
    pkgs.kitty
    pkgs.vlc
    pkgs.dropbox
    pkgs.pg_top
    pkgs.gparted
  ];
}
