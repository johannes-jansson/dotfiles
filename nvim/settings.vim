set nocompatible

set undolevels=1000
set hidden
set foldlevel=999
set foldmethod=expr
" set foldmethod=indent
set foldexpr=nvim_treesitter#foldexpr()
set mouse=a
set directory^=$HOME/.config/nvim/swap//
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

" Spelling section
set spelllang=sv,en
au BufRead,BufNewFile *.txt setlocal spell wrap nolist
au BufRead,BufNewFile *.tex setlocal spell wrap nolist
au BufRead,BufNewFile *.md setlocal spell wrap nolist
au BufRead,BufNewFile *.markdown setlocal spell wrap nolist

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

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
