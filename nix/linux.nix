{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.awscli
    pkgs.chromium
    pkgs.dropbox
    pkgs.firefox
    pkgs.gparted
    pkgs.insomnia
    pkgs.kitty
    pkgs.pg_top
    pkgs.pinentry
    pkgs.spectacle
    pkgs.vlc

    # for generating gem nix
    pkgs.bundix
  ];
}
