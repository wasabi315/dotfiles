" ~/.config/nvim/keymap.vim

" General ----------------------------------------------------------------
" highlight the word under the cursor
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" replace all words under the cursor
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

" expand region
vmap v     <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" move line
nnoremap <C-Up>   "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp

" move paragraph
nnoremap <C-S-Up>   "zdap<Up>{"zp
nnoremap <C-S-Down> "zdap}"zp

" paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" disable hlsearch
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" change buffer
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>

" For plugins ------------------------------------------------------------
" Leader key
let mapleader = "\<Space>"

" Denite.nvim
noremap  [Denite]  <Nop>
nmap     <Leader>f [Denite]
nnoremap [Denite]f :<C-u>DeniteBufferDir file<CR>
nnoremap [Denite]l :<C-u>Denite line<CR>

" Deoplete.nvim


