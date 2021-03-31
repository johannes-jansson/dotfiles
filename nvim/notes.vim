" notes section - things related to my note taking system

" jump to file under cursor
noremap <leader>j :e <cfile>.md<cr>

" grep for [[]] links in my note folder
command! -nargs=1 Ngrep grep! "\[\[<args>\]\]" -g "*.md" ~/Dropbox/md

" Grep for mentions of the link under cursor
nnoremap <leader>n :Ngrep <cfile><cr><cr>:copen<cr>

" Grep for mentions of current fil
nnoremap <leader>m :Ngrep %:r<cr><cr>:bcopen<cr>
