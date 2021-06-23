" notes section - things related to my note taking system

" Show autocomplete menu to current dir files when typing [[
inoremap [[ [[<c-x><c-f><c-p>

" jump to file under cursor
noremap <leader>j :e <cfile>.md<cr>

" grep for [[]] links in my note folder
command! -nargs=1 Ngrep grep! "\[\[<args>\]\]" -g "*.md" $NOTESDIR

" Grep for mentions of the link under cursor
nnoremap <leader>n :Ngrep <cfile><cr><cr>:copen<cr>

" Grep for mentions of current file
nnoremap <leader>m :Ngrep %:r<cr><cr>:copen<cr>

" Create todo
nnoremap <leader>it I- [ ] <esc>

" Toggle todo
nnoremap <leader>et :s/^\(\s*\)\(- \[ \]\\|- \[x\]\)/\=submatch(1) . (submatch(2) == '- [ ]' ? "- \[x\]" : "- \[ \]")<cr>

" Create a link to today's date page
nnoremap <leader>id "=strftime("[[%Y-%m-%d]]")<cr>p

" Edit today's date page
nnoremap <leader>ed :exe 'e '.strftime("%Y-%m-%d.md")<cr>:cd %:p:h<cr>
