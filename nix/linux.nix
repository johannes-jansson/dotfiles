{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.firefox
    pkgs.kitty
    pkgs.vlc
    pkgs.awscli
    pkgs.dropbox
    pkgs.pg_top
    pkgs.gparted
  ];
}
