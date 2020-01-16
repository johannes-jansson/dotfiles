set termguicolors
set visualbell
set scrolloff=5
set lazyredraw
set showmatch
set cursorline
set relativenumber
set number
set noshowmode
" set noruler

" highlight overlength
" match Error /\%81v.\+/

" Theme
set rtp+=~/.config/nvim/plugged/jellybeans.vim
set rtp+=~/.config/nvim/plugged/papercolor-theme
set background=dark
colorscheme jellybeans
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_use_term_italics = 0

" Airline
let g:airline_theme='jellybeans'
let g:airline_section_x='' " remove filetype
let g:airline_section_y='' " replace encoding w 
" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
