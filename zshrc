# zmodload zsh/zprof
# Path:
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Users/johannes/.pyenv/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export REVIEW_BASE=develop

# Aliases:
alias l="ls -ghA"
alias vi=nvim
alias vim=nvim
alias naked='nvim -u ~/dotfiles/essential.vim'
alias pcp='particle compile photon'
alias pce='particle compile electron'
alias pfu='particle flash --usb'
alias rand='date | md5 | head -c16; echo'
alias gbutt="gcloud"
alias csgocfg="vim /Users/johannes/Library/Application\ Support/Steam/steamapps/common/Counter-Strike\ Global\ Offensive/csgo/cfg/autoexec.cfg"
alias lapse="ffmpeg -r 24 -pattern_type glob -i '*.JPG' -s hd1080 -vcodec libx264 timelapse.mp4"
alias sstop="brew services stop skhd"
alias sstart="brew services start skhd"
alias srestart="brew services restart skhd"
alias ystop="brew services stop yabai"
alias ystart="brew services start yabai"
alias yrestart="launchctl kickstart -k 'gui/${UID}/homebrew.mxcl.yabai'"
alias ven="source venv/bin/activate"
alias venn="source ../venv/bin/activate"
alias startup="/usr/bin/automator ~/startup.workflow"
alias psq="psql -d jojnts_development"
alias pgc="pgcli -d jojnts_development"
alias aptible-eu="aptible db:tunnel ja-pg12 --environment jointacademy"
alias aptible-stage="aptible db:tunnel ja-stage-pg12 --environment jointacademy-stage"
alias aptible-us="aptible db:tunnel ja-pg12 --environment jointacademy-us-west-1"
alias hms="home-manager switch"
alias dost="sudo /home/johannes/.nix-profile/bin/dockerd"

# tmux-aliases
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tn="tmux new -s"
alias td="tmux kill-session -t "
alias tda="tmux kill-server"

# Todo.txt-aliases
alias t='todo.sh -d /Users/johannes/Dropbox/Backup/todo.txt_cli-2.9/todo.cfg'
alias tedit='vim /Users/johannes/Dropbox/Apps/Todotxt+/todo.txt'
export TODOTXT_DEFAULT_ACTION=ls

# Markdown conversions
pdfmd () {
  pandoc -f markdown+tex_math_dollars+pipe_tables $1.md -o $1.tex
  pandoc $1.tex -o $1.pdf
  rm $1.tex
}
mdpdf () { pandoc -f markdown $1.md -o $1.pdf; }


# ZSH settings:
export LANG=en_US.UTF-8
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
export EDITOR=/home/johannes/.nix-profile/bin/nvim
bindkey -v # vi mode
unsetopt beep # no beep
setopt appendhistory autocd nomatch notify

# Enable completion
autoload -Uz compinit
compinit
fpath=('/usr/local/share/zsh/site-functions' $fpath)
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
# Append autocomplete scripts installed by brew

# Show currently selected completion in menu
zstyle ':completion:*:*:*:*:*' menu select
# Show colors in completion list
zstyle ':completion:*' list-colors ''
# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Load git stuff
autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '(%b)'

PROMPT=$'\n''    %F{031}${PWD/#$HOME/~}%f ${vcs_info_msg_0_} [%D{%L:%M}]'$'\n''    %F{111}>%f '
# TMOUT=1

# TRAPALRM() {
#     zle reset-prompt
# }

# Ruby stuff
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
export PATH="$HOME/.rbenv/versions/2.6.1/bin:$PATH"
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/johannes/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/johannes/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/johannes/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/johannes/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

zet() {
  nvim "+Zet $*"
}

preview() {
  $* | enscript -q -p - -f Hasklig-Light10 -F Hasklig-Semibold10 -b "$*|%W|Page $%" | open -f -a /Applications/Preview.app
}

# Load secrets...
source ~/dotfiles/zshrc.secrets

# Python function for running venv stuff in X enviroment
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python3 "$@"
    else
        /usr/local/bin/python3 "$@"
    fi
}

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# NVM stuff
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nvm use default
# source /usr/local/opt/autoenv/activate.sh

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'


# export PERL5LIB="/Users/simonwarg/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"

export PERL5LIB="/usr/local/Cellar/perl/5.30.1/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/usr/local/Cellar/perl/5.30.1/${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
export PERL_MB_OPT="--install_base \"/usr/local/Cellar/perl/5.30.1\"";
export PERL_MM_OPT="INSTALL_BASE=/usr/local/Cellar/perl/5.30.1"

export PERL5LIB="/Users/johannes/.cpan/build/TAP-Parser-SourceHandler-pgTAP-3.35-0/lib/:$PERL5LIB"

# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# export PERL5LIB="/Users/johannes/.ctan/build${PERL5LIB:+:${PERL5LIB}}"
# export PERL_LOCAL_LIB_ROOT="/Users/johannes/.ctan/build/${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
# export PERL_MB_OPT="--install_base \"/Users/johannes/.ctan/build\"";
# export PERL_MM_OPT="INSTALL_BASE=/Users/johannes/.ctan/build"
#
if [ -e /Users/johannes/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/johannes/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zprof
# 1.3
