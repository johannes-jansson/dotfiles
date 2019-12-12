set termguicolors
set visualbell
set showmode
set scrolloff=5
set showtabline=1
set lazyredraw
set showmatch
set cursorline
set relativenumber
set number

" Theme
set rtp+=~/.config/nvim/plugged/jellybeans.vim
set rtp+=~/.config/nvim/plugged/papercolor-theme
set background=dark               " Choose colors for a dark background
colorscheme jellybeans
let g:airline_theme='jellybeans'
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_use_term_italics = 0

function ToggleTheme()
  if &background == 'dark'
    echo 'Starting light mode'
    set background=light
    colorscheme PaperColor
    let g:airline_theme='papercolor'
  else
    echo 'Starting dark mode'
    set background=dark
    colorscheme jellybeans
    let g:jellybeans_use_gui_italics = 0
    let g:jellybeans_use_term_italics = 0
    let g:airline_theme='jellybeans'
  endif
endfunction

" highlight overlength
highlight OverLength ctermbg=131 ctermfg=white
match OverLength /\%81v.\+/

" Airline
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
let g:airline#extensions#tabline#enabled = 1
set noshowmode
