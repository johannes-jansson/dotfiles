{ config, pkgs, ... }:

{
  imports = [
    ./tmux.nix
  ];

  home.packages = [
    # Basic cli stuff
    pkgs.ctop
    pkgs.curl
    # pkgs.docker
    # pkgs.docker-compose
    pkgs.fzf
    pkgs.git
    pkgs.git-lfs
    pkgs.gitAndTools.bfg-repo-cleaner
    pkgs.gitAndTools.gh
    pkgs.htop
    pkgs.httpie
    pkgs.jq
    pkgs.neofetch
    pkgs.neovim
    pkgs.pandoc
    pkgs.ranger
    pkgs.ripgrep
    pkgs.rsync
    pkgs.shellcheck
    pkgs.tig
    pkgs.wget
    pkgs.wireguard
    pkgs.zsh
    pkgs.zsh-syntax-highlighting

    # Posgres
    pkgs.pgcli
    pkgs.pgformatter
    pkgs.pgtap
    pkgs.postgresql_12
    # pkgs.postgresql_11
    pkgs.pspg
    pkgs.sqitchPg

    # Graphical
    # pkgs.kitty # not working, using manual install for now
    pkgs.hasklig
    # pkgs.slack

    # Misc
    pkgs.ghc
    pkgs.hugo
    pkgs.imagemagick
    pkgs.nodejs
  ];

  # Dotfiles
  home.file.".zshrc".source = ~/dotfiles/zshrc;
  home.file.".gitconfig".source = ~/dotfiles/gitconfig;
  home.file.".config/kitty/kitty.conf".source = ~/dotfiles/kitty.conf;
  home.file.".config/pgcli/config".source = ~/dotfiles/pgcli_conf;
  home.file.".config/nvim" = {
    source = ~/dotfiles/nvim;
    recursive = true;
  };
}
