{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.firefox
    pkgs.chromium
    pkgs.kitty
    pkgs.vlc
    pkgs.awscli
    pkgs.dropbox
    pkgs.pg_top
    pkgs.gparted

    # for generating gem nix
    pkgs.bundix
  ];
}
