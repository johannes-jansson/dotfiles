{ config, pkgs, ... }:

{
  imports = [
    ./tmux.nix
  ];

  home.packages = [
    pkgs.envsubst
    pkgs.watch
    # pkgs.nerdfonts
    # CLI tools
    pkgs.awscli
    pkgs.gcc # Needed for neovim, for some reason
    pkgs.nmap
    pkgs.httpie
    pkgs.pg_top
    pkgs.pgtop
    pkgs.python38Full
    pkgs.python38Packages.tkinter
    pkgs.qmk
    pkgs.st
    pkgs.texlive.combined.scheme-medium
    pkgs.unzip
    pkgs.zip

    # Basic cli stuff
    pkgs.bat
    pkgs.black
    pkgs.circleci-cli
    pkgs.csvkit
    pkgs.ctop
    pkgs.curl
    pkgs.gnupg
    pkgs.gotop
    pkgs.graphviz
    pkgs.jq
    pkgs.k9s
    pkgs.kubectl
    pkgs.kubectx
    pkgs.mdcat
    pkgs.moreutils
    pkgs.mosh
    pkgs.neofetch
    pkgs.ngrok
    pkgs.nodePackages.diagnostic-languageserver
    pkgs.nodePackages.prettier
    pkgs.nodePackages.pyright
    pkgs.openvpn
    pkgs.pandoc
    pkgs.plantuml
    pkgs.python39Packages.flake8
    pkgs.ranger
    pkgs.rclone
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.rnix-lsp
    pkgs.rsync
    pkgs.shellcheck
    pkgs.tealdeer
    pkgs.tig
    pkgs.wget

    pkgs.zsh-powerlevel10k
    pkgs.zsh-you-should-use
    pkgs.thefuck

    # Posgres
    pkgs.pgcli
    pkgs.pgformatter
    pkgs.postgresql_12
    pkgs.pspg

    # Security
    # pkgs.gobuster
    # pkgs.hashcat
    # pkgs.john
    # pkgs.samba
    # pkgs.sqlmap
    # pkgs.wireguard-tools

    # Misc
    pkgs.imagemagick
    pkgs.languagetool
  ];

  programs.neovim = {
    enable = true;
    withPython3 = true;
    extraConfig = ''
        source ${config.home.homeDirectory}/dotfiles/nvim/essential.vim
        source ${config.home.homeDirectory}/dotfiles/nvim/settings.vim
        source ${config.home.homeDirectory}/dotfiles/nvim/plugins.vim
        source ${config.home.homeDirectory}/dotfiles/nvim/mappings.vim
        source ${config.home.homeDirectory}/dotfiles/nvim/notes.vim
      '';
    extraPackages = with pkgs; [
      (python3.withPackages (ps: with ps; [
        black
        flake8
      ]))
    ];
    extraPython3Packages = (ps: with ps; [
      pynvim
    ]);
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "rg --files --no-ignore --hidden --follow --glob '!.git/*'";
  };

  programs.sqls = {
    enable = true;
    settings = {
      lowercaseKeywords = true;
      connections = [{
        alias = "bi";
        driver = "postgres";
        user = "etl";
        passwd = "password";
        host = "127.0.0.1";
        port = "5435";
        dbName = "bi";
      }];
    };
  };
  programs.rofi = {
    enable = true;
    /* font = "Hasklig"; */
  };

  services.redshift = {
    enable = true;
    longitude = "55.3621";
    latitude = "13.02";
  };

  # Dotfiles
  # home.file.".gitconfig".source = ~/dotfiles/gitconfig;
  home.file.".config/pgcli/config".source = ~/dotfiles/pgcli_conf;
  home.file.".config/nvim" = {
    source = ~/dotfiles/nvim;
    recursive = true;
  };

  manual.manpages.enable = false;
}
