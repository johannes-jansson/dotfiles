{ config, pkgs, ... }: {
  imports = [
    ./tmux.nix
    ./git.nix
    ./zsh.nix
  ];


  nix.registry = {
    nixpkgs-master = {
      from = {
        id = "nixpkgs-master";
        type = "indirect";
      };
      to = {
        type = "github";
        owner = "NixOS";
        repo = "nixpkgs";
        ref = "master";
      };
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    pkgs.bat       # cat alternative
    pkgs.bottom    # top alternative
    pkgs.ctop
    pkgs.fd        # find alternative
    pkgs.gnupg
    pkgs.hasklig
    pkgs.jq
    pkgs.lua-language-server
    pkgs.mdcat
    pkgs.neovim
    pkgs.nix
    pkgs.nvd       # Nix/NixOS package version diff tool
    pkgs.pandoc
    pkgs.pyright
    pkgs.ripgrep
    pkgs.rnix-lsp
    pkgs.tig       # TUI Git interface
    pkgs.tldr
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
     eza = {
      enable = true;
      enableAliases = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --no-ignore --hidden --follow --glob '!.git/*'";
    };
  };

  home.file.".config/nvim" = {
    source = ../nvim;
    recursive = true;
  };
  home.file.".config/alacritty" = {
    source = ../alacritty;
  };

  # manual.manpages.enable = false;
}
