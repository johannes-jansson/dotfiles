{ config, pkgs, ... }:

{
  home.packages = [
    # GUIs
    pkgs.baobab # Disk usage analyzer
    pkgs.chromium
    pkgs.discord
    pkgs.firefox
    pkgs.gparted
    pkgs.insomnia
    pkgs.slack
    pkgs.spotify
    pkgs.vlc

    # Linux stuff
    pkgs.feh
    pkgs.nitrogen
    pkgs.xorg.xev
    pkgs.xorg.xmodmap

    # CLI tools
    pkgs.awscli
    pkgs.gcc # Needed for neovim, for some reason
    pkgs.nmap
    pkgs.pg_top
    pkgs.python3
    pkgs.qmk
    pkgs.st
    pkgs.texlive.combined.scheme-medium
    pkgs.unzip
    pkgs.zip

    # Photo stuff
    pkgs.darktable
    pkgs.exiftool
    pkgs.rapid-photo-downloader
    pkgs.shotwell
  ];

  home.file.".config/i3/config".source = ~/dotfiles/i3;
  home.file.".config/i3status/config".source = ~/dotfiles/i3status;
  home.file.".xinitrc".source = ~/dotfiles/xinitrc;
}
