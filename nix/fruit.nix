{ config, pkgs, ... }: {
  imports = [ ./common.nix ];

  home = {
    username = "johannes";
    homeDirectory = "/Users/johannes";
    stateVersion = "21.11";
  };


  fonts.fontconfig.enable = true;
  programs.git.signing = { key = "9FDF82C55FE31C41"; };
  programs.git.userEmail = "johannes_jansson@apple.com";

  # home.file.".config/alacritty/alacritty.toml".source = ~/dotfiles/alacritty.toml;

  home.packages = [
    pkgs.metals
    (pkgs.nerdfonts.override { fonts = [ "Hasklig" ]; })
    pkgs.pinentry_mac
  ];

  home.file.".gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
  '';
}
