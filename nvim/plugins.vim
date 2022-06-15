call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'prettier/vim-prettier'

" TS/LS stuff
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'nanotee/sqls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Visual
Plug 'lewis6991/gitsigns.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'reedes/vim-colors-pencil'                    " Color scheme
Plug 'reedes/vim-thematic'                         " Allows fast toggle between dark and light theme
Plug 'vim-airline/vim-airline'                     " Simple feature rich statusbar
Plug 'vim-airline/vim-airline-themes'

" Writing
Plug 'dpelle/vim-LanguageTool'                     " Spelling
Plug 'junegunn/goyo.vim'                           " Distraction free writing mode
Plug 'reedes/vim-pencil'                           " Markdown tools

" All hail tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'                           " GitHub
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'                       " <C-A> <C-X> for dates
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'                        " [] mappings
Plug 'tpope/vim-vinegar'                           " Enhance netrw

call plug#end()

" Finding (mostly fzf)
if executable('rg')
    set grepprg=rg\ --color=never\ --vimgrep
endif
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
nnoremap <silent> <Leader>ö :Find<CR>
nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>* :Find <C-R><C-W><CR>

" Fugitive
nnoremap <Leader>gl :0Gclog<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gbl :Git blame<CR>
nnoremap <Leader>gbr :GBrowse<CR>
nnoremap <Leader>gpl :Git pull<CR>
nnoremap <Leader>gps :Git push<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" Vim-pencil
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  autocmd FileType text            call pencil#init()
augroup END

" LanguageTool
let g:languagetool_cmd='$HOME/.nix-profile/bin/languagetool-commandline'
nnoremap <Leader>lc :LanguageToolCheck<CR>

" Colors
set background=dark
colorscheme pencil

let g:thematic#themes = {
\ 'light' :{'colorscheme': 'pencil',
\           'background': 'light',
\           'airline-theme': 'pencil',
\          },
\ 'dark' :{'colorscheme': 'pencil',
\          'background': 'dark',
\          'airline-theme': 'pencil',
\         },
\ }
nnoremap <Leader>td :ThematicPrevious<CR>

" Airline
let g:airline_theme='pencil'
let g:airline_section_x='' " remove filetype
let g:airline_section_y='' " replace encoding w 

set completeopt=menu,menuone,noselect " used in nvim-cmp

lua require('gitsigns').setup()
