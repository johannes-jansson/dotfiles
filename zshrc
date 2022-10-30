# zmodload zsh/zprof

# Path:
export PATH=$HOME/bin:/usr/local/bin:$PATH
export GPG_TTY=`tty`


# Exports:
export REVIEW_BASE=develop
export EDITOR=~/.nix-profile/bin/nvim
export VISUAL=~/.nix-profile/bin/nvim
export PGDATA="/Users/johannes/.pgdata"
export NOTESDIR="/Users/johannes/Dropbox/md"


# Aliases:
alias l="ls -ghA"
alias vi=nvim
alias vim=nvim
alias naked='nvim -u ~/dotfiles/nvim/essential.vim'
alias notes="nvim $NOTESDIR/$(date +'%Y-%m-%d').md --cmd 'cd %:p:h'"
alias pedit="pbpaste | vipe | pbcopy"
alias fu="vim . '+:G'"

alias srestart="brew services restart skhd"
alias yrestart="launchctl kickstart -k 'gui/${UID}/homebrew.mxcl.yabai'"
alias pgc="pgcli -d jojnts_development"
alias pgb="pgcli -h localhost -p 5435 -d bi -u etl"
alias pgu="pgcli -h localhost -p 5434 -d db -u aptible"
alias pge="pgcli -h localhost -p 5433 -d db -u aptible"
alias dost="sudo /home/johannes/.nix-profile/bin/dockerd"
alias pgst="pg_ctl -D jojnts_development -l logfile start"
alias wttr="curl wttr.in/hässleholm"
alias hms="home-manager switch"

alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tn="tmux new -s"
alias td="tmux kill-session -t "
alias tda="tmux kill-server"

alias lapse="ffmpeg -r 24 -pattern_type glob -i '*.JPG' -s hd1080 -vcodec libx264 timelapse.mp4"
alias rand='date | md5 | head -c16; echo'


# ZSH
export LANG=en_US.UTF-8
HISTFILE=~/.histfile HISTSIZE=100000
SAVEHIST=100000
bindkey -v
unsetopt beep
setopt appendhistory autocd nomatch notify

# Enable completion
autoload -Uz compinit
compinit
fpath=('/usr/local/share/zsh/site-functions' $fpath)

# Load zsh git info
autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '(%b)'
PROMPT=$'\n''    %F{031}${PWD/#$HOME/~}%f'$'\n''    %F{111}>%f '
RPROMPT='${vcs_info_msg_0_} [%D{%L:%M}]'

# Autoload tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# FZF
if [ -n "${commands[fzf-share]}" ]; then source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Nix on macOS
if [ -e /Users/johannes/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/johannes/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

# Direnv
eval "$(direnv hook zsh)"

# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zprof
# 1.3
