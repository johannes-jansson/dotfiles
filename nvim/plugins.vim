call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier'
" Plug 'sirver/UltiSnips'

" Visual
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'nanotech/jellybeans.vim'                     " Dark mode theme
Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'                         " Rainbow paranthesis
Plug 'reedes/vim-colors-pencil'                    " Color scheme
Plug 'reedes/vim-thematic'                         " Allows fast toggle between dark and light theme
Plug 'vim-airline/vim-airline'                     " Simple feature rich statusbar
Plug 'vim-airline/vim-airline-themes'

" Writing
" Plug 'rhysd/vim-grammarous'                        " Uses languagetool
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

" Plug 'auwsmit/vim-active-numbers'
" Plug 'jupyter-vim/jupyter-vim'
" Plug 'plasticboy/vim-markdown'
" Plug 'tpope/vim-projectionist'

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

" UltiSnips
" let g:UltiSnipsSnippetDirectories = ['~/dotfiles/nvim/UltiSnips']
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"

" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Ale
" let g:ale_lint_on_text_changed = 'always'
" let g:ale_linters = { 'javascript': ['eslint'], 'python': ['flake8'], 'json': ['jsonlint'], 'sql': ['sqlint']}
" let g:ale_fixers = { 'javascript': ['eslint'], 'python': ['autopep8'], 'json': ['fixjson'], 'sql': ['pgformatter'], 'haskell': ['stylish-haskell'] }
" let g:ale_sql_pgformatter_options = '--nogrouping --spaces 2 --type-case 1 --keyword-case 1'
" nnoremap <Leader>f :ALEFix<CR>
" " vim-unimpaired-style mappings for ale
" nmap <silent> [W <Plug>(ale_first)
" nmap <silent> [w <Plug>(ale_previous)
" nmap <silent> ]w <Plug>(ale_next)
" nmap <silent> ]W <Plug>(ale_last)

" Colorscheme
set rtp+=~/.config/nvim/plugged/vim-pencil
set background=dark
colorscheme pencil

" Vim-thematic
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

" Vim-pencil
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  autocmd FileType text            call pencil#init()
augroup END

" Airline
let g:airline_theme='pencil'
let g:airline_section_x='' " remove filetype
let g:airline_section_y='' " replace encoding w 

" LanguageTool
let g:languagetool_cmd='$HOME/.nix-profile/bin/languagetool-commandline'
nnoremap <Leader>lc :LanguageToolCheck<CR>
