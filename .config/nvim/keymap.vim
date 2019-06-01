" ~/.config/nvim/keymap.vim

" General ----------------------------------------------------------------

nnoremap U <C-r>

nnoremap J ^
nnoremap K $

inoremap jj <Esc>

noremap <PageUp>   <Nop>
noremap <PageDown> <Nop>
noremap <Up>       <Nop>
noremap <Left>     <Nop>
noremap <Down>     <Nop>
noremap <Right>    <Nop>

nnoremap ]<Space> o<Esc>'[k
nnoremap [<Space> O<Esc>j

" Leader key
let mapleader = "\<Space>"

" highlight the word under the cursor
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" replace all words under the cursor
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

" expand region
vmap v     <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" disable hlsearch
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" For plugins ------------------------------------------------------------

" Goyo.vim
nnoremap <silent> <Leader>g :Goyo<CR>

" fzf.vim
nmap <Leader>f [FZF]
nnoremap [FZF]f :Files<CR>
nnoremap [FZF]g :GFiles<CR>
nnoremap [FZF]G :GFiles?<CR>
nnoremap [FZF]c :Commits<CR>
nnoremap [FZF]C :BCommits<CR>
nnoremap [FZF]b :Buffers<CR>
nnoremap [FZF]h :History<CR>
nnoremap [FZF]l :BLines<CR>
nnoremap [FZF]L :Lines<CR>

" coc.nvim
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-n>" : "\<C-p>"

function! s:check_back_space() abort
    let col=col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

