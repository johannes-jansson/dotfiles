{ config, pkgs, ... }:

{
  imports = [
    ./tmux.nix
  ];

  home.packages = [
    # Basic cli stuff
    pkgs.bat
    pkgs.circleci-cli
    pkgs.ctop
    pkgs.curl
    # pkgs.docker
    # pkgs.docker-compose
    pkgs.fzf
    pkgs.redoc-cli
    pkgs.git
    pkgs.git-lfs
    pkgs.gitAndTools.bfg-repo-cleaner
    pkgs.gitAndTools.gh
    pkgs.gnupg
    pkgs.htop
    pkgs.httpie
    pkgs.jq
    pkgs.kubectl
    pkgs.k9s
    pkgs.languagetool
    pkgs.mdcat
    pkgs.moreutils
    pkgs.mosh
    pkgs.neofetch
    pkgs.heroku
    pkgs.neovim
    pkgs.nodePackages.prettier
    pkgs.openvpn
    pkgs.pandoc
    pkgs.ranger
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.rsync
    pkgs.shellcheck
    pkgs.tealdeer
    pkgs.tig
    pkgs.wget
    # pkgs.wireguard-tools
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
    pkgs.alacritty
    pkgs.hasklig
    # pkgs.slack

    # Security
    # pkgs.gobuster
    # pkgs.hashcat
    # pkgs.john
    # pkgs.samba
    # pkgs.sqlmap

    # Misc
    pkgs.ghc
    pkgs.stylish-haskell
    pkgs.hugo
    pkgs.imagemagick
    pkgs.nodejs
    pkgs.languagetool
    pkgs.elmPackages.elm-language-server
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-test
    pkgs.elmPackages.elm-format
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
