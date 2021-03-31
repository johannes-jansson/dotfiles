noremap <leader>j :e <cfile>.md<cr>

noremap <leader>i ggO# <c-r>=expand('%:r')<cr><esc><c-o>

if executable('rg')
    set grepprg=rg\ --color=never\ --vimgrep
endif

command! -nargs=1 Ngrep grep! "<args>" -g "*.md" ~/Dropbox/md
nnoremap <leader>n :Ngrep <cfile><cr><cr>:copen<cr>
