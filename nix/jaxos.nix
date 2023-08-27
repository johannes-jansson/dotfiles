{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;
  home.stateVersion = "20.03";
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./common.nix
    ./linux.nix
    ./git.nix
    ./zsh.nix
  ];

  programs.git.signing.key = "9DD2F0A9EF0957D5";
}
