set termguicolors
set visualbell
set scrolloff=5
set lazyredraw
set showmatch
set cursorline
set relativenumber
set number
set noshowmode

" Theme
set rtp+=~/.config/nvim/plugged/vim-pencil
set background=dark
colorscheme pencil

" Airline
let g:airline_theme='pencil'
let g:airline_section_x='' " remove filetype
let g:airline_section_y='' " replace encoding w 
