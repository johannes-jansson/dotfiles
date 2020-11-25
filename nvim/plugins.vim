call plug#begin()

Plug 'airblade/vim-gitgutter'
" Plug 'AndrewRadev/deleft.vim'
" Plug 'andymass/vim-matchup'
" Plug 'auwsmit/vim-active-numbers'
Plug 'chaoren/vim-wordmotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'                           " Distraction free writing mode
Plug 'luochen1990/rainbow'                         " Rainbow paranthesis
Plug 'mhinz/vim-grepper'
Plug 'nanotech/jellybeans.vim'                     " Dark mode theme
Plug 'NLKNguyen/papercolor-theme'                  " Light mode theme
Plug 'reedes/vim-pencil'                           " Markdown tools
Plug 'reedes/vim-thematic'                         " Allows fast toggle between dark and light theme
Plug 'sirver/UltiSnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'                     " Simple feature rich statusbar
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'                                    " Linting
Plug 'wakatime/vim-wakatime'                       " Timetracking

" Plug 'SevereOverfl0w/clojure-check', {'do': './install'}
" Plug 'auwsmit/vim-active-numbers'
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
" Plug 'plasticboy/vim-markdown'
" Plug 'poetic/vim-textobj-javascript'
" Plug 'rbong/vim-flog'
" Plug 'tpope/vim-projectionist'
" Plug 'vim-latex/vim-latex'
" Plug 'yssl/QFEnter'

call plug#end()

" Finding (mostly fzf)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
nnoremap <silent> <Leader>ö :Find<CR>
nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>* :Find <C-R><C-W><CR>

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

" UltiSnips
" let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsSnippetDirectories = ['~/dotfiles/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsEditSplit="vertical"

" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Ale
let g:ale_linters = { 'javascript': ['eslint'], 'python': ['flake8'], 'json': ['jsonlint'], 'sql': ['sqlint']}
let g:ale_lint_on_text_changed = 'always'
let g:ale_fixers = { 'javascript': ['eslint'], 'python': ['autopep8'], 'json': ['fixjson'], 'sql': ['pgformatter'] }
let g:ale_sql_pgformatter_options = '--nogrouping --spaces 2 --type-case 1 --keyword-case 1'
nnoremap <Leader>f :ALEFix<CR>
" vim-unimpaired-style mappings for ale
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'grep']
let g:grepper.searchreg = 1
let g:grepper.highlight = 1
" let g:grepper.prompt = '$t> '
" let g:grepper.side = 0
" nnoremap <Leader>ö :Grepper<cr>
" let g:grepper.prompt_mapping_tool = '<Leader>ö'

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
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#bracket_spacing = 'false'
" let g:prettier#config#trailing_comma = 'all'
" nmap <Leader>f <Plug>(Prettier)

" Vim-pencil
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  autocmd FileType text            call pencil#init()
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
