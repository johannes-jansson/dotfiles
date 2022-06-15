{ config, pkgs, ... }:
# For each machine, copy this file to home.nix and use relevant imports

{
  programs.home-manager.enable = true;
  home.stateVersion = "20.03";
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./nix/default.nix
  ];
}
