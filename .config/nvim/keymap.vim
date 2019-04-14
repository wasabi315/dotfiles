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

" LanguageClient-neovim
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nmap <Leader>l [LC]
nnoremap [LC]k :call LanguageClient#textDocument_hover()<CR>
nnoremap [LC]g :call LanguageClient#textDocument_definition()<CR>
nnoremap [LC]r :call LanguageClient#textDocument_rename()<CR>
nnoremap [LC]f :call LanguageClient#textDocument_formatting()<CR>
nnoremap [LC]b :call LanguageClient#textDocument_references()<CR>
nnoremap [LC]a :call LanguageClient#textDocument_codeAction()<CR>
nnoremap [LC]s :call LanguageClient#textDocument_documentSymbol()<CR>

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

