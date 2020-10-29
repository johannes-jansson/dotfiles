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
    pkgs.git-lfs
    pkgs.gitAndTools.hub
    pkgs.htop
    pkgs.httpie
    pkgs.jq
    pkgs.neofetch
    pkgs.pandoc
    pkgs.pandoc
    pkgs.pgformatter
    pkgs.ranger
    pkgs.ripgrep
    pkgs.rsync
    pkgs.tig
    pkgs.todo-txt-cli
    pkgs.wget
    pkgs.zsh
    pkgs.zsh-syntax-highlighting

    # Graphical stuff
    # pkgs.kitty # not working, using manual install for now
    pkgs.hasklig
    # pkgs.slack

    # haskell stuff
    pkgs.ghc

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

    # Node stuff
    pkgs.nodejs

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
