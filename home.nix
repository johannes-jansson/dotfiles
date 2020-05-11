{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "20.03";

  home.packages = [
    # Basic cli stuff
    pkgs.ctop
    pkgs.curl
    pkgs.docker
    pkgs.fzf
    pkgs.git
    pkgs.tig
    pkgs.htop
    pkgs.jq
    pkgs.ripgrep
    pkgs.wget
    pkgs.httpie
    pkgs.zsh

    # Graphical stuff
    # pkgs.kitty # not working, using manual install for now
    pkgs.firefox
    pkgs.hasklig
    pkgs.vlc
    pkgs.dropbox

    # Posgres stuff
    # pkgs.postgres-12.2
    pkgs.pg_top
    pkgs.pgcli
    pkgs.pgtap
    pkgs.pspg

    pkgs.hugo

    pkgs.imagemagick
  ];

  programs.neovim = {
    enable = true;
    withPython3 = true;
  };

  programs.tmux = {
    enable = true;
    plugins = [ pkgs.tmuxPlugins.continuum pkgs.tmuxPlugins.resurrect ];
  };

  # Dotfile stuff
  home.file.".zshrc".source = ~/dotfiles/zshrc;
  home.file.".tmux.conf".source = ~/dotfiles/tmux.conf;
  home.file.".gitconfig".source = ~/dotfiles/gitconfig;
  home.file.".config/kitty/kitty.conf".source = ~/dotfiles/kitty.conf;
  home.file.".config/nvim" = {
    source = ~/dotfiles/nvim;
    recursive = true;
  };
}
