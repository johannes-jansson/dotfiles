{ config, pkgs, ... }:

{
  imports = [
    ./tmux.nix
  ];

  home.packages = [
    # Basic cli stuff
    pkgs.bandwhich
    pkgs.bat
    pkgs.ctop
    pkgs.curl
    # pkgs.docker
    # pkgs.docker-compose
    pkgs.fzf
    pkgs.git
    pkgs.git-lfs
    pkgs.gitAndTools.bfg-repo-cleaner
    pkgs.gitAndTools.gh
    pkgs.gnupg
    pkgs.htop
    pkgs.httpie
    pkgs.jq
    pkgs.mdcat
    pkgs.neofetch
    pkgs.neovim
    pkgs.nodePackages.prettier
    pkgs.pandoc
    pkgs.ranger
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.rsync
    pkgs.shellcheck
    pkgs.tig
    pkgs.tealdeer
    pkgs.wget
    pkgs.wireguard
    pkgs.zsh
    pkgs.zsh-syntax-highlighting
    pkgs.languagetool

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
    pkgs.alacritty
    pkgs.hasklig
    # pkgs.slack

    # Misc
    pkgs.ghc
    pkgs.stylish-haskell
    pkgs.hugo
    pkgs.imagemagick
    pkgs.nodejs
    pkgs.languagetool
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

  manual.manpages.enable = false;
}
