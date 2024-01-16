{ config, pkgs, ... }: {
  imports = [ ./common.nix ];

  # programs.git.signing = { key = "381AE25298A4EFF6"; };
  programs.git.userEmail = "johannes.e.jansson@gmail.com";

  home.packages = [
    pkgs.kubie
  ];

}
