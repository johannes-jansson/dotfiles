{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.firefox
    pkgs.vlc
    pkgs.dropbox
    pkgs.pg_top
  ];
}
