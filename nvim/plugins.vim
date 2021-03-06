call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'NLKNguyen/papercolor-theme'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dpelle/vim-LanguageTool'
Plug 'junegunn/fzf'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'                           " Distraction free writing mode
Plug 'luochen1990/rainbow'                         " Rainbow paranthesis
Plug 'nanotech/jellybeans.vim'                     " Dark mode theme
Plug 'nbouscal/vim-stylish-haskell'
Plug 'prettier/vim-prettier'
Plug 'reedes/vim-colors-pencil'                    " Color scheme
Plug 'reedes/vim-pencil'                           " Markdown tools
Plug 'reedes/vim-thematic'                         " Allows fast toggle between dark and light theme
Plug 'rhysd/vim-grammarous'
Plug 'sirver/UltiSnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'                     " Simple feature rich statusbar
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'                                    " Linting

" Plug 'SevereOverfl0w/clojure-check', {'do': './install'}
" Plug 'auwsmit/vim-active-numbers'
" Plug 'auwsmit/vim-active-numbers'
" Plug 'chaoren/vim-wordmotion'
" Plug 'ervandew/supertab'
" Plug 'google/vim-searchindex'
" Plug 'guns/vim-clojure-static'
" Plug 'guns/vim-sexp'
" Plug 'hashivim/vim-terraform'
" Plug 'honza/vim-snippets'
" Plug 'janko-m/vim-test'
" Plug 'jupyter-vim/jupyter-vim'
" Plug 'kana/vim-textobj-entire'
" Plug 'kana/vim-textobj-user'
" Plug 'lervag/vimtex'
" Plug 'mhinz/vim-grepper'
" Plug 'plasticboy/vim-markdown'
" Plug 'poetic/vim-textobj-javascript'
" Plug 'rbong/vim-flog'
" Plug 'tpope/vim-projectionist'
" Plug 'vim-latex/vim-latex'
" Plug 'yssl/QFEnter'

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
" can be used to see old revs
nnoremap <Leader>gl :0Glog<CR>
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

" UltiSnips
let g:UltiSnipsSnippetDirectories = ['~/dotfiles/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Ale
let g:ale_lint_on_text_changed = 'always'
let g:ale_linters = { 'javascript': ['eslint'], 'python': ['flake8'], 'json': ['jsonlint'], 'sql': ['sqlint']}
let g:ale_fixers = { 'javascript': ['eslint'], 'python': ['autopep8'], 'json': ['fixjson'], 'sql': ['pgformatter'], 'haskell': ['stylish-haskell'] }
let g:ale_sql_pgformatter_options = '--nogrouping --spaces 2 --type-case 1 --keyword-case 1'
nnoremap <Leader>f :ALEFix<CR>
" vim-unimpaired-style mappings for ale
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Vim-pencil
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  autocmd FileType text            call pencil#init()
augroup END

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

" Airline
let g:airline_theme='pencil'
let g:airline_section_x='' " remove filetype
let g:airline_section_y='' " replace encoding w 

" LanguageTool
" let g:languagetool_jar='$HOME/.nix-profile/bin/languagetool-commandline'
" let g:grammarous#languagetool_cmd = 'languagetool'
let g:languagetool_cmd='$HOME/.nix-profile/bin/languagetool-commandline'
let g:languagetool_lang='en-US'
