# zmodload zsh/zprof

# Path:
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Users/johannes/.pyenv/bin:$PATH"

export GPG_TTY=`tty`


# Aliases:
alias l="ls -ghA"
alias vi=nvim
alias vim=nvim
alias naked='nvim -u ~/dotfiles/nvim/essential.vim'

alias srestart="brew services restart skhd"
alias yrestart="launchctl kickstart -k 'gui/${UID}/homebrew.mxcl.yabai'"
alias pgc="pgcli -d jojnts_development"
alias dost="sudo /home/johannes/.nix-profile/bin/dockerd"
alias pgst="pg_ctl -D jojnts_development -l logfile start"

alias aptible-eu="aptible db:tunnel ja-pg12 --environment jointacademy"
alias aptible-us="aptible db:tunnel ja-pg12 --environment jointacademy-us-west-1"
alias aptible-eu2="aptible db:tunnel ja-pg12 --environment jointacademy 2>&1 >/dev/null | grep 'Connect at' | xargs sed -n -e 's/^Connect at //p'"

alias hms="home-manager switch"
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tn="tmux new -s"
alias td="tmux kill-session -t "
alias tda="tmux kill-server"

alias lapse="ffmpeg -r 24 -pattern_type glob -i '*.JPG' -s hd1080 -vcodec libx264 timelapse.mp4"
alias rand='date | md5 | head -c16; echo'


# Exports:
export REVIEW_BASE=develop
export EDITOR=~/.nix-profile/bin/nvim
export VISUAL=~/.nix-profile/bin/nvim
export PGDATA="~/.pgdata"


# Markdown to pdf
mdpdf () { pandoc -f markdown $1.md -o $1.pdf; }


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

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# FZF
if [ -n "${commands[fzf-share]}" ]; then source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'


# Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.rbenv/versions/2.6.1/bin:$PATH"
eval "$(rbenv init -)"


# Python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# Perl
export PERL5LIB="/usr/local/Cellar/perl/5.30.1/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/usr/local/Cellar/perl/5.30.1/${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
export PERL_MB_OPT="--install_base \"/usr/local/Cellar/perl/5.30.1\"";
export PERL_MM_OPT="INSTALL_BASE=/usr/local/Cellar/perl/5.30.1"
export PERL5LIB="/Users/johannes/.cpan/build/TAP-Parser-SourceHandler-pgTAP-3.35-0/lib/:$PERL5LIB"


# Nix
if [ -e /Users/johannes/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/johannes/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zprof
# 1.3
