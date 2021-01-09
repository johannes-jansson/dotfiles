set termguicolors
set visualbell
set scrolloff=5
set lazyredraw
set showmatch
set cursorline
set relativenumber
set number
set noshowmode

" Themes
set rtp+=~/.config/nvim/plugged/jellybeans.vim
set rtp+=~/.config/nvim/plugged/papercolor-theme
set background=dark
colorscheme jellybeans
let g:jellybeans_use_gui_italics = 1
let g:jellybeans_use_term_italics = 1

" Airline
let g:airline_theme='jellybeans'
let g:airline_section_x='' " remove filetype
let g:airline_section_y='' " replace encoding w 
