map <space> <leader>
map ö [
map ä ]

" leader
nmap <silent> <leader>ev :e ~/dotfiles/nvim/<CR>
nmap <silent> <leader>ep :e ~/dotfiles/nvim/plugins.vim<CR>
nmap <silent> <leader>7 :nohlsearch<CR>
noremap <silent> <Leader>w :w<CR>
noremap <silent> <Leader>q :q<CR>
noremap <silent> <Leader>v :vsp<CR> 
noremap <silent> <Leader>s :sp<CR> 
noremap <silent> <Leader>c :Copen<CR>
noremap <silent> <Leader>z :tabnew %<CR>
noremap <Leader>b :ls<CR>:b<space>
noremap <silent> <Leader>x :Dispatch!<CR>
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
nnoremap <Leader>ö :Grepper<CR>
nnoremap <Leader>i "=strftime("# %d of %b")<CR>P

" folding 
noremap <silent> z0 :set foldlevel=0<CR>
noremap <silent> z1 :set foldlevel=1<CR>
noremap <silent> z2 :set foldlevel=2<CR>
noremap <silent> z3 :set foldlevel=3<CR>
noremap <silent> z4 :set foldlevel=4<CR>
noremap <silent> z5 :set foldlevel=5<CR>

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
