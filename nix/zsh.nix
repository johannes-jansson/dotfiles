{ pkgs, config, lib, ... }: {

  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    # enableAutosuggestions = true;
    enableCompletion = true;
    history = {
      save = 10000;
      size = 10000;
    };
    syntaxHighlighting.enable = true;

    sessionVariables = {
      # TERM = "alacritty";
      TERM = "xterm-256color";
      EDITOR = "${pkgs.neovim}/bin/nvim";
      GPG_TTY = "$(tty)";
      KEYTIMEOUT = 1;
      NOTESDIR = "${config.home.homeDirectory}/Dropbox/md";
      VISUAL = "${pkgs.neovim}/bin/nvim";
      JABBA_VERSION = "0.11.2";
      JABBA_HOME = "$HOME/.jabba";
    };

    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      naked = "nvim -u ${config.home.homeDirectory}/dotfiles/nvim/essential.vim";
      notes = "nvim $NOTESDIR/$(date +'%Y-%m-%d').md --cmd 'cd %:p:h'";
      fu = "vim . '+:G'";
      l = "eza -ghA";
      c = "clear";
      coin = "echo $((RANDOM%2))";
      wttr = "curl wttr.in/hässleholm";
      bbic = "brew update &&\
          brew bundle install --cleanup --file=~/.config/Brewfile --no-lock &&\
          brew upgrade";

      # tmux
      tls = "tmux list-sessions";
      ta = "tmux attach -t";
      ts = "tmux switch -t";
      tn = "tmux new -s";
      td = "tmux kill-session -t ";
      tda = "tmux kill-server";
    };

    initExtra = ''
      if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
          tmux attach -t default || tmux new -s default
      fi
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      [[ -d /opt/homebrew/share/zsh/site-functions ]] && fpath+=(/opt/homebrew/share/zsh/site-functions)
      [ -s "$JABBA_HOME/jabba.sh" ] && source "$JABBA_HOME/jabba.sh"
    '';

    profileExtra = ''
      setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
      setopt ALWAYS_TO_END        # Move cursor to the end of a completed word.
      setopt AUTO_MENU            # Show completion menu on a successive tab press.
      setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
      setopt AUTO_PARAM_SLASH     # If completed parameter is a directory, add a trailing slash.
      unsetopt MENU_COMPLETE      # Do not autoselect the first completion entry.
      unsetopt BEEP
    '';

    plugins = [
      {
        name = "powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}";
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ../p10k;
        file = "p10k.zsh";
      }
    ];

  };
}
