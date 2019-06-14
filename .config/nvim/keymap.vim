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
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

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

