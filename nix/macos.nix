{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.texlive.combined.scheme-medium
    pkgs.pinentry_mac
  ];
  home.file.".config/alacritty/alacritty.toml".source = ~/dotfiles/alacritty.toml;
}
