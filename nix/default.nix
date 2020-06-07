{ config, pkgs, ... }:

{
  imports = [
    ./tmux.nix
  ];

  home.packages = [
    # Basic cli stuff
    pkgs.ctop
    pkgs.curl
    pkgs.docker
    pkgs.docker-compose
    pkgs.fzf
    pkgs.git
    pkgs.gitAndTools.hub
    pkgs.git-lfs
    pkgs.tig
    pkgs.htop
    pkgs.jq
    pkgs.ripgrep
    pkgs.wget
    pkgs.httpie
    pkgs.pgformatter
    pkgs.rsync
    pkgs.todo-txt-cli
    pkgs.ranger
    pkgs.zsh
    pkgs.zsh-syntax-highlighting

    # Graphical stuff
    # pkgs.kitty # not working, using manual install for now
    pkgs.hasklig
    # pkgs.slack

    # clojure stuff
    pkgs.clojure
    pkgs.leiningen

    # Posgres stuff
    pkgs.postgresql_12
    # pkgs.postgresql_11
    pkgs.pgcli
    pkgs.pgtap
    pkgs.sqitchPg
    pkgs.pspg

    pkgs.hugo

    pkgs.imagemagick
  ];

  programs.neovim = {
    enable = true;
    withPython3 = true;
  };

  # Dotfile stuff
  home.file.".zshrc".source = ~/dotfiles/zshrc;
  home.file.".gitconfig".source = ~/dotfiles/gitconfig;
  home.file.".config/kitty/kitty.conf".source = ~/dotfiles/kitty.conf;
  home.file.".config/nvim" = {
    source = ~/dotfiles/nvim;
    recursive = true;
  };
}
