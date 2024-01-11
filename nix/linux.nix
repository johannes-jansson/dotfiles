{ config, pkgs, ... }:

{
  imports = [
    ./i3status.nix
    ./i3.nix
  ];
  home.packages = [
    pkgs.dfu-programmer
    # GUIs
    pkgs.alacritty
    pkgs.anki
    pkgs.calibre
    pkgs.chromium
    pkgs.discord
    pkgs.emote
    pkgs.firefox
    pkgs.gnome.pomodoro
    pkgs.insomnia
    pkgs.kazam
    pkgs.kicad
    pkgs.libreoffice
    pkgs.pinta
    pkgs.rpi-imager
    pkgs.signal-desktop
    pkgs.slack
    pkgs.spotify
    pkgs.xfce.thunar-archive-plugin
    pkgs.xfce.thunar-volman
    pkgs.vlc
    pkgs.vscode
    pkgs.zathura

    # Linux specific stuff
    pkgs.baobab # Disk usage analyzer
    pkgs.brightnessctl
    pkgs.feh
    pkgs.gparted
    pkgs.haskellPackages.greenclip
    pkgs.hasklig
    pkgs.lsof
    pkgs.pciutils
    pkgs.xclip
    pkgs.xfce.tumbler
    pkgs.xorg.xev
    pkgs.xorg.xmodmap

    # Photo stuff
    pkgs.darktable
    pkgs.exiftool
    pkgs.rapid-photo-downloader
    pkgs.shotwell
  ];

  home.file.".config/alacritty/alacritty.yml".source = ~/dotfiles/alacritty.yml;
  # home.file.".xinitrc".source = ~/dotfiles/xinitrc;
}
