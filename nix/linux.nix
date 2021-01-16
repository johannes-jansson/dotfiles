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
    pkgs.xorg.xev
    pkgs.xorg.xmodmap

    # for generating gem nix
    pkgs.bundix
  ];

  home.file.".config/i3/config".source = ~/dotfiles/i3config;
}
