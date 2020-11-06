" ~/.config/nvim/keymap.vim

" General ----------------------------------------------------------------

nnoremap U <C-r>

inoremap jj <Esc>

noremap <PageUp>   <Nop>
noremap <PageDown> <Nop>
noremap <Up>       <Nop>
noremap <Left>     <Nop>
noremap <Down>     <Nop>
noremap <Right>    <Nop>

let mapleader = "\<Space>"

nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

if has("nvim")
    autocmd TermOpen * tnoremap <Esc> <C-\><C-N>
endif

" coc.nvim --------------------------------------------------------------------

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-n>" : "\<C-p>"

function! s:check_back_space() abort
    let col=col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

autocmd CursorHold * silent call CocActionAsync('highlight')

" lightline-bufferline --------------------------------------------------------

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <BS>1 <Plug>lightline#bufferline#delete(1)
nmap <BS>2 <Plug>lightline#bufferline#delete(2)
nmap <BS>3 <Plug>lightline#bufferline#delete(3)
nmap <BS>4 <Plug>lightline#bufferline#delete(4)
nmap <BS>5 <Plug>lightline#bufferline#delete(5)
nmap <BS>6 <Plug>lightline#bufferline#delete(6)
nmap <BS>7 <Plug>lightline#bufferline#delete(7)
nmap <BS>8 <Plug>lightline#bufferline#delete(8)
nmap <BS>9 <Plug>lightline#bufferline#delete(9)
nmap <BS>0 <Plug>lightline#bufferline#delete(10)

