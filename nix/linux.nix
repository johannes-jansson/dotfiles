{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.awscli
    pkgs.baobab # Disk usage analyzer
    pkgs.chromium
    pkgs.discord
    pkgs.feh
    pkgs.firefox
    pkgs.gcc # Needed for neovim, for some reason
    pkgs.gparted
    pkgs.insomnia
    pkgs.kitty
    pkgs.nitrogen
    pkgs.nmap
    pkgs.pg_top
    pkgs.qmk
    pkgs.spectacle
    pkgs.st
    pkgs.texlive.combined.scheme-medium
    pkgs.unzip
    pkgs.vlc
    pkgs.xorg.xev
    pkgs.xorg.xmodmap
    pkgs.zip

    # Photo stuff
    pkgs.exiftool
    pkgs.darktable
    pkgs.shotwell
    pkgs.rapid-photo-downloader
  ];

  home.file.".config/i3/config".source = ~/dotfiles/i3;
  home.file.".config/i3status/config".source = ~/dotfiles/i3status;
  home.file.".xinitrc".source = ~/dotfiles/xinitrc;
}
