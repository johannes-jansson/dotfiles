{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = pkgs.tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-boot 'on'
          set -g @continuum-boot-options 'iterm'
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10'
        '';
      }
    ];
    extraConfig = ''
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix
      
      # Custom binds
      bind-key v split-window -h
      bind-key s split-window -v
      bind-key ö copy-mode
      bind-key ä paste-buffer
      bind C-l send-keys 'C-l' # clear screen
      bind T choose-session
      
      unbind C-a
      bind C-a select-pane -t :.+
      
      bind-key J command-prompt -p "join pane from:"  "join-pane -s '%%'"
      bind-key S command-prompt -p "send pane to:"  "join-pane -t '%%'"
      
      
      # Tmux settings
      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on
      
      set -g mouse on
      set-window-option -g mode-keys vi
      set-option -sg escape-time 10
      
      set -g default-terminal "xterm-256color"
      set-option -ga terminal-overrides ",xterm-256color:Tc"
      
      # Smart pane switching with awareness of Vim splits.
      # See: https://github.com/christoomey/vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l

      # status bar stuff
      setw -g window-status-fg 'colour32' # orange
      setw -g window-status-bg 'colour235' # gray
      set -g status-fg 'colour248' # light gray
      set -g status-bg 'colour235'
      setw -g window-status-activity-fg 'colour154' # green as fuck
      setw -g window-status-activity-bg 'colour235'
      setw -g window-status-separator ""
      setw -g window-status-bg 'colour235'
      setw -g window-status-format ' #I #W '
      setw -g window-status-current-format '#[fg=colour255,bg=colour32]  #I #W  #[fg=colour154,bg=colour235]'
      set -g status-right ""
    '';
  };
}
