" Finding (mostly fzf)
if executable('rg')
    set grepprg=rg\ --color=never\ --vimgrep
endif
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.direnv/*" --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
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

" Colors
set background=dark
colorscheme pencil
let g:pencil_terminal_italics = 1
let g:pencil_gutter_color = 1      " 0=mono (def), 1=color
let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high
" highlight Search ctermbg=8 guibg=#424242
highlight Search ctermbg=240

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

" " Fern
" " let g:fern#renderer = "nerdfont"
" noremap <silent> <Leader>d :Fern . -drawer -width=35 -toggle<CR><C-w>=
" " noremap <silent> <Leader>f :Fern . -drawer -reveal=% -width=35<CR><C-w>=
" 
" function! FernInit() abort
"   set nonu
"   nmap <buffer><expr>
"         \ <Plug>(fern-my-open-expand-collapse)
"         \ fern#smart#leaf(
"         \   "\<Plug>(fern-action-open:select)",
"         \   "\<Plug>(fern-action-expand)",
"         \   "\<Plug>(fern-action-collapse)",
"         \ )
"   nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
"   nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
"   nmap <buffer> m <Plug>(fern-action-mark-toggle)j
"   nmap <buffer> N <Plug>(fern-action-new-file)
"   nmap <buffer> K <Plug>(fern-action-new-dir)
"   nmap <buffer> D <Plug>(fern-action-remove)
"   nmap <buffer> R <Plug>(fern-action-move)
"   nmap <buffer> s <Plug>(fern-action-open:split)
"   nmap <buffer> v <Plug>(fern-action-open:vsplit)
"   nmap <buffer> r <Plug>(fern-action-reload)
"   nmap <buffer> q :q<CR>
"   nmap <buffer> <nowait> d <Plug>(fern-action-hidden-toggle)j
"   nmap <buffer> <nowait> < <Plug>(fern-action-leave)
"   nmap <buffer> <nowait> > <Plug>(fern-action-enter)
" endfunction
" 
" augroup FernGroup
"   autocmd!
"   autocmd FileType fern call FernInit()
"   autocmd FileType fern call glyph_palette#apply()
" augroup END


