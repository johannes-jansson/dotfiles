{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.anki
    pkgs.awscli
    pkgs.chromium
    pkgs.firefox
    pkgs.gparted
    pkgs.insomnia
    pkgs.kitty
    pkgs.pg_top
    pkgs.spectacle
    pkgs.texlive.combined.scheme-medium
    pkgs.unzip
    pkgs.vlc
    pkgs.xorg.xev
    pkgs.xorg.xmodmap
    pkgs.zip

    # for generating gem nix
    pkgs.bundix
  ];

  home.file.".config/i3/config".source = ~/dotfiles/i3;
  home.file.".config/i3status/config".source = ~/dotfiles/i3status;
  home.file.".xinitrc".source = ~/dotfiles/xinitrc;
}
