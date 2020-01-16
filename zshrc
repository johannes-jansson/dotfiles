# Path:
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Users/johannes/.pyenv/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PAGER="pspg -XF -s s"

export TODOTXT_DEFAULT_ACTION=ls

# Aliases:
alias l="ls -ghA"
alias vi=nvim
alias vim=nvim
alias naked='nvim -u ~/.essential.vim'
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

alias psq="psql -d jojnts_development"
alias pgc="pgcli -d jojnts_development"

# tmux-aliases
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias ts="tmux kill-session -t "
alias tsa="tmux kill-server"

# Todo.txt-aliases
alias t='todo.sh -d /Users/johannes/Dropbox/Backup/todo.txt_cli-2.9/todo.cfg'
alias tedit='vim /Users/johannes/Dropbox/Apps/Todotxt+/todo.txt'

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
# ls colors
LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:'

# Load git stuff
autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '(%b)'

PROMPT=$'\n''    %F{031}${PWD/#$HOME/~}%f ${vcs_info_msg_0_}'$'\n''    %F{111}>%f '

# Ruby stuff
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/johannes/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/johannes/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/johannes/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/johannes/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

zet() {
  nvim "+Zet $*"
}

# Load secrets...
# source ~/dotfiles/zshrc.secrets

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
# export NVM_DIR="/usr/local/opt/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
# # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm use default
# source /usr/local/opt/autoenv/activate.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)
