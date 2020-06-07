{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "20.03";

  imports = [
    ./nix/default.nix
    ./nix/linux.nix
  ];
}
