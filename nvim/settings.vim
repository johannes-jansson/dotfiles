set nocompatible

set undolevels=1000
set hidden
set foldmethod=indent
set foldlevel=999
set mouse=a
set directory^=$HOME/.config/nvim/swap// " for swap files...
set undofile
set undodir=$HOME/.config/nvim/undodir
set nowrap

" Tabs vs spaces section
set shiftwidth=2    " Autoindent tab length
set tabstop=2       " Tab length
set softtabstop=2
set expandtab       " Tab = spaces
set smartindent     " Automatic indentation
set shiftround      " When at 1 space, and I hit > ... go to 2, not 3

" Search section
set ignorecase
set smartcase
set hlsearch
set incsearch
set inccommand=nosplit

" Spelling section
set spelllang=sv,en
au BufRead,BufNewFile *.txt setlocal spell wrap nolist
au BufRead,BufNewFile *.tex setlocal spell wrap nolist
au BufRead,BufNewFile *.md setlocal spell wrap nolist

" Appearance section
set termguicolors
set visualbell
set scrolloff=5
set lazyredraw
set showmatch
set cursorline
set relativenumber
set number
set noshowmode

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Filetype for arduino files
au BufRead,BufNewFile *.ino set filetype=arduino

let g:markdown_folding = 1

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
