" ~/.config/nvim/plugins.vim

" denite.nvim ------------------------------------------------------------

call denite#custom#option('default', {
    \ 'prompt': '>',
    \ })


" deoplete.nvim ----------------------------------------------------------

let g:deoplete#enable_at_startup = 1


" vim-better-whitespace --------------------------------------------------

let g:better_whitespace_enabled = 1
let g:better_whitespace_filetypes_blacklist=['diff', 'help', 'markdown']
let g:strip_whitespace_on_save = 1


" vim-multiple-cursor ----------------------------------------------------

function! Multiple_cursors_before()
    call deoplete#disable()
endfunction

function! Multiple_cursors_after()
    call deoplete#enable()
endfunction


" tagbar -----------------------------------------------------------------

let g:tagbar_width = 40
let g:tagbar_autoclose = 0


" lightline.vim ----------------------------------------------------------

let g:lightline = {
    \ 'colorscheme': 'iceberg',
    \ }


" LanguageClient-neovim --------------------------------------------------

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper']
    \ }

