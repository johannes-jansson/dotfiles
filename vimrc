set nocompatible



" Vundle section

" To install, run `:PluginInstall`
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'AndrewRadev/deleft.vim'
Plugin 'AndrewRadev/splitjoin.vim'
" Plugin 'andymass/vim-matchup'
" Plugin 'Chiel92/vim-autoformat'
Plugin 'auwsmit/vim-active-numbers'
" Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'freitass/todo.txt-vim'
Plugin 'ervandew/supertab'
Plugin 'gmarik/vundle'
" Plugin 'hienvd/vim-stackoverflow'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'luochen1990/rainbow'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mileszs/ack.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'poetic/vim-textobj-javascript'
Plugin 'qpkorr/vim-bufkill'
Plugin 'sirver/UltiSnips'
Plugin 'honza/vim-snippets'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'scrooloose/nerdtree.git'
  " Plugin 'tclem/vim-arduino'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
" Plugin 'vimwiki/vimwiki'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'vim-latex/vim-latex'
" " Plugin 'vim-scripts/YankRing.vim'
" " Plugin 'wincent/terminus'
Plugin 'w0rp/ale'
" Plugin 'wikitopian/hardmode'
" Plugin 'yggdroot/indentline'
Plugin 'yssl/QFEnter'



if has('python3')
  silent! python3 1
endif


" Basic settings section

" let mapleader="\"
map <space> <leader>
map ö [
map ä ]

set undolevels=1000
set nohidden
set nobackup
set foldmethod=indent
set foldlevel=999
set path+=**
set mouse=a
set ttymouse=xterm2
let $LANG = 'en_US'



" Tabs vs spaces section

set shiftwidth=2    " Autoindent tab length
set tabstop=2       " Tab length
set softtabstop=2
set expandtab       " Tab = spaces
set smartindent     " Automatic indentation
set shiftround      " When at 1 space, and I hit > ... go to 2, not 3



" Eyecandy section

set termguicolors
set background=dark               " Choose colors for a dark background
" set background=light               " Choose colors for a dark background
colorscheme jellybeans
" colorscheme solarized
set visualbell                    " visual errors
set showmode
set scrolloff=5
set showtabline=1
set lazyredraw
set showmatch                     " brackets matching
set cursorline
set relativenumber
set number
set colorcolumn=80

" highlight overlength
highlight OverLength ctermbg=131 ctermfg=white
match OverLength /\%81v.\+/




" Wrapping section

set nowrap

function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    "s setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

noremap <silent> <Leader>tw :call ToggleWrap()<CR>




" Search section

set ignorecase  " Ignore case when searching
set smartcase   " If there are any caps, go case-sensitive
set hlsearch



" Spelling section

set spelllang=sv,en
" removed linebreak from these
au BufRead,BufNewFile *.txt setlocal spell wrap nolist
au BufRead,BufNewFile *.tex setlocal spell wrap nolist
au BufRead,BufNewFile *.odt setlocal spell wrap nolist
au BufRead,BufNewFile *.md setlocal spell wrap nolist

" Toggle spellchecking
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction
nnoremap <silent> <Leader>ts :call ToggleSpellCheck()<CR>



" Config section

nmap <silent> <leader>ev :e ~/.dotfiles/vimrc<CR>
nmap <silent> <leader>sv :so ~/.dotfiles/vimrc<CR>
" nnoremap <Leader>pi :PluginInstall<CR>



" Mappings section

nmap <silent> <leader>7 :nohlsearch<CR>
" nnoremap <leader>n :NERDTreeToggle<CR>  
" noremap <leader>f :Autoformat<CR>
noremap <leader>f :call JsBeautify()<cr>
noremap <silent> <Leader>w :w<CR>
noremap <silent> <Leader>wq :wq<CR>
noremap <silent> <Leader>w! :w!<CR>
noremap <silent> <Leader>q :q<CR>
noremap <Leader>e :e 
noremap <Leader>v :vsp<CR> 
noremap <Leader>s :sp<CR> 
noremap <silent> <Leader>bn :bn<CR>
noremap <silent> <Leader>bp :bp<CR>
noremap <silent> <Leader>bd :bd<CR>
noremap <silent> z0 :set foldlevel=0<CR>
noremap <silent> z1 :set foldlevel=1<CR>
noremap <silent> z2 :set foldlevel=2<CR>
noremap <silent> z3 :set foldlevel=3<CR>
noremap <silent> z4 :set foldlevel=4<CR>
noremap <silent> z5 :set foldlevel=5<CR>
noremap <silent> <Leader>aa :A<CR>
noremap <silent> <Leader>av :AV<CR>
noremap <silent> <Leader>em :Emodel _
noremap <silent> <Leader>ec :Econtroller _
noremap <silent> <Leader>z :tabnew %<CR>


" tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tn  :tabnew<CR>
nnoremap tc  :tabclose<CR>


" use w!! if you forgot sudo
cmap w!! w !sudo tee % >/dev/null

nnoremap <Leader><Leader> <C-^>



" Airline section

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
let g:airline#extensions#tabline#enabled = 1
set noshowmode



" CtrlP section
" nmap <leader>p :CtrlP<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>



" Ag/Ack section

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
nnoremap <Leader>/ :Ack 



" FZF section
nnoremap <Leader>p :Files<CR>



" Fugitive section

" can be used to see old revs
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>ga :Gcommit -a<CR>
nnoremap <Leader>gbl :Gblame<CR>
" open in web browser
nnoremap <Leader>gbr :Gbrowse<CR>
nnoremap <Leader>gpl :Gpull<CR>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>

autocmd BufReadPost fugitive://* set bufhidden=delete
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P



" Snippets!
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" Misc section

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" http://janneinosaka.blogspot.com/2014/10/automatically-resize-vim-splits.html
" Resize the current split to at least (90,25) but no more than (140,60)
" or 2/3 of the available space otherwise.
function Splitresize()
    let hmax = max([winwidth(0), float2nr(&columns*0.66), 82])
    let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
    exe "vertical resize" . (min([hmax, 140]))
    exe "resize" . (min([vmax, 60]))
endfunction

" move between splits without the ctrl-w prefix
nnoremap <silent> <C-J> <C-W><C-J>:call Splitresize()<CR>
nnoremap <silent> <C-K> <C-W><C-K>:call Splitresize()<CR>
nnoremap <silent> <C-L> <C-W><C-L>:call Splitresize()<CR>
nnoremap <silent> <C-H> <C-W><C-H>:call Splitresize()<CR>


" search for selected text
vnoremap // y/<C-R>"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Filetype for arduino files
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" Pretty header level 1 and 2 for markdown as default macros
let @1 = 'yypv$r='
let @2 = 'yypv$r-'

" To make autoformatting python work
let g:formatter_yapf_style = 'pep8'

" automatically close netrw when a file has been opened
autocmd FileType netrw setl bufhidden=delete

" Deleft
let g:deleft_remove_strategy="comment"

" commenting octace files
autocmd FileType octave setlocal commentstring=\%\ %s

" autoenable hardmode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

let g:ale_linters = { 'javascript': ['eslint'] }

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction
" inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
" inoremap <S-Tab> <C-n>

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " au FileType markdown set tw=79

augroup END
