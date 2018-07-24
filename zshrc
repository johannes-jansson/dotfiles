# Path:
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export TODOTXT_DEFAULT_ACTION=ls

# Aliases:

# Git
alias gitignore='cat ~/Dropbox/Backup/.gitignore >> .gitignore'
alias g=git
alias gitsum='~/code/git-summary/git-summary -l ~/code'
gi () { git "$@" | lolcat; }

# tmux
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias tn="tmux new -s"

# Todo.txt
alias t='todo.sh -d /Users/johannes/Dropbox/Backup/todo.txt_cli-2.9/todo.cfg'
alias tedit='vim /Users/johannes/Dropbox/txt/GTD/todo.txt'

# Markdown
pdfmd () {
  pandoc -f markdown+tex_math_dollars+pipe_tables $1.md -o $1.tex
  pandoc $1.tex -o $1.pdf
  rm $1.tex
}
mdpdf () { pandoc -f markdown $1.md -o $1.pdf; }

alias v=vim
alias pcp='particle compile photon'
alias pce='particle compile electron'

alias dockercleanup="docker rmi -f $(docker images | grep none | awk '{print $3}')"
alias csgocfg="vim /Users/johannes/Library/Application\ Support/Steam/steamapps/common/Counter-Strike\ Global\ Offensive/csgo/cfg/autoexec.cfg"
alias lapse="ffmpeg -r 24 -pattern_type glob -i '*.JPG' -s hd1080 -vcodec libx264 timelapse.mp4"

alias ven="source venv/bin/activate"



# ZSH settings:
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export EDITOR=/usr/local/bin/vim
bindkey -v # vi mode
unsetopt beep # no beep
setopt appendhistory autocd nomatch notify

# Enable completion
autoload -Uz compinit
compinit

# Append autocomplete scripts installed by brew
fpath=('/usr/local/share/zsh/site-functions' $fpath)

# Show currently selected completion in menu
zstyle ':completion:*:*:*:*:*' menu select

# Show colors in completion list
zstyle ':completion:*' list-colors ''

# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# prompt
autoload -Uz promptinit
promptinit
prompt redhat



# NVM stuff
export NVM_DIR="/usr/local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Python function for running venv stuff in X enviroment
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python3 "$@"
    else
        /usr/local/bin/python3 "$@"
    fi
}

# source /usr/local/opt/autoenv/activate.sh
