map <space> <leader>
map ö [
map ä ]

" leader
nmap <silent> <leader>ev :e ~/dotfiles/nvim/<CR>
nmap <silent> <leader>er :so ~/dotfiles/nvim/init.vim<CR>
nmap <silent> <leader>7 :nohlsearch<CR>
noremap <silent> <Leader>w :w<CR>
noremap <silent> <Leader>q :q<CR>
noremap <silent> <Leader>v :vsp<CR> 
noremap <silent> <Leader>s :sp<CR> 
noremap <silent> <Leader>c :copen<CR>
noremap <silent> <Leader>z :tabnew %<CR>
noremap <Leader>b :ls<CR>:b<space>
" nnoremap <Leader>i "=strftime("# %d of %b")<CR>P

" tab navigation
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

" use w!! if you forgot sudo
cmap w!! w !sudo tee % >/dev/null

" search for selected text by double tapping /
vnoremap // y/<C-R>"<CR>

" Copy selected text to system clipboard (macos and linux)
vnoremap <silent> <leader>y "*y :let @+=@*<cr>
