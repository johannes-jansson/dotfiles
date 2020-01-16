call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'AndrewRadev/deleft.vim'
" Plug 'andymass/vim-matchup'
" Plug 'auwsmit/vim-active-numbers'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'freitass/todo.txt-vim'
" Plug 'ervandew/supertab'
" Plug 'gmarik/vundle'
" Plug 'google/vim-searchindex'
" Plug 'guns/vim-clojure-static'
" Plug 'guns/vim-sexp'
Plug 'hashivim/vim-terraform'
" Plug 'janko-m/vim-test'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
" Plug 'jungomi/vim-mdnquery'
" Plug 'jupyter-vim/jupyter-vim'
" Plug 'kana/vim-textobj-entire'
" Plug 'kana/vim-textobj-user'
" Plug 'kien/ctrlp.vim'
" Plug 'lervag/vimtex'
Plug 'luochen1990/rainbow'
" Plug 'maksimr/vim-jsbeautify'
" Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-grepper'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'nvie/vim-flake8'
" Plug 'plasticboy/vim-markdown'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" Plug 'poetic/vim-textobj-javascript'
" Plug 'qpkorr/vim-bufkill'
" Plug 'rbong/vim-flog'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-thematic'
" Plug 'sirver/UltiSnips'
" Plug 'honza/vim-snippets'
" Plug 'SevereOverfl0w/clojure-check', {'do': './install'}
" Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-latex/vim-latex'
" Plug 'vim-scripts/indentpython.vim'
Plug 'wakatime/vim-wakatime'
Plug 'w0rp/ale'
" Plug 'yggdroot/indentline'
" Plug 'yssl/QFEnter'

call plug#end()


" CtrlP section

" nmap <leader>p :CtrlP<cr>
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" 
" " Setup some default ignores
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
"   \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
" \}
" 
" " Use the nearest .git directory as the cwd
" let g:ctrlp_working_path_mode = 'r'
" 
" " Easy bindings for its various modes
" nmap <leader>bb :CtrlPBuffer<cr>
" nmap <leader>bm :CtrlPMixed<cr>
" nmap <leader>bs :CtrlPMRU<cr>


" Ag/Ack section
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" let g:ctrlp_use_caching = 0
" nnoremap <Leader>/ :Ack 


" FZF
nnoremap <Leader>p :Files<CR>


" Fugitive
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



" UltiSnips
" let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsSnippetDirectories = ['~/.vim/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"

let g:UltiSnipsEditSplit="vertical"


" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Deleft
let g:deleft_remove_strategy="comment"

" Ale
let g:ale_linters = { 'javascript': ['eslint'], 'python': ['flake8'], 'json': ['jsonlint']}
let g:ale_lint_on_text_changed = 'always'
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_filetype_changed = 1
let g:ale_fixers = { 'javascript': ['eslint'], 'python': ['autopep8'], 'json': ['fixjson'] }

nnoremap <Leader>f :ALEFix<CR>

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)


" Grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'ag']
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" nmap <Leader>gs <plug>(GrepperOperator)
" xmap <Leader>gs <plug>(GrepperOperator)

" vim test
let test#strategy = "dispatch"
autocmd FileType sql let b:dispatch = 'psql -d jojnts_development -P pager=off -f %'

" matchit
" let b:match_words = '\<if\>:\<else[ ]if\>:\<else\>'
" let s:notelse = '\%(\<else\s\+\)\@<!'
" let b:match_words = s:notelse . '\<if\>:\<else\s\+if\>:\<else\>,'
"       \ . '\<while\>:\<continue\>:\<break\>:\<endwhile\>'
let b:match_words = '\<while\>:\<continue\>:\<break\>:\<endwhile\>'

let b:match_words .= ',`\%(if\|ifdef\|ifndef\)\>:`els\%(if\|e\)\>:`endif\>'

" Mdn_query
nnoremap <Leader>m :MdnQueryFirstMatch 

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Prettier
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#trailing_comma = 'all'
" nmap <Leader>f <Plug>(Prettier)

" Vim-pencil
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" vim-thematic
let g:thematic#themes = {
\ 'light' :{'colorscheme': 'PaperColor',
\           'background': 'light',
\           'airline-theme': 'papercolor',
\          },
\ 'dark' :{'colorscheme': 'jellybeans',
\          'background': 'dark',
\          'airline-theme': 'jellybeans',
\         },
\ }
nnoremap <Leader>d :ThematicPrevious<CR>
