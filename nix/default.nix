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
    pkgs.gitAndTools.bfg-repo-cleaner
    pkgs.gitAndTools.gh
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
    pkgs.shellcheck
    pkgs.tig
    pkgs.todo-txt-cli
    pkgs.wget
    pkgs.wireguard
    pkgs.zsh
    pkgs.zsh-syntax-highlighting

    # Graphical stuff
    # pkgs.kitty # not working, using manual install for now
    pkgs.hasklig
    pkgs.insomnia
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
  home.file.".config/pgcli/config".source = ~/dotfiles/pgcli_conf;
  home.file.".config/nvim" = {
    source = ~/dotfiles/nvim;
    recursive = true;
  };
}
