{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.awscli
    pkgs.chromium
    pkgs.dropbox
    pkgs.firefox
    pkgs.gparted
    pkgs.kitty
    pkgs.pg_top
    pkgs.spectacle
    pkgs.vlc

    # for generating gem nix
    pkgs.bundix
  ];
}
