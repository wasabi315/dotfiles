" ~/.config/nvim/plugins.vim

" denite.nvim ------------------------------------------------------------

call denite#custom#option('default', {
    \ 'prompt': '>',
    \ })


" deoplete.nvim ----------------------------------------------------------

let g:deoplete#enable_at_startup = 1


" vim-airline ------------------------------------------------------------

let g:airline#extensions#tabline#buffer_idx_format = {
    \ '0' : '0: ',
    \ '1' : '1: ',
    \ '2' : '2: ',
    \ '3' : '3: ',
    \ '4' : '4: ',
    \ '5' : '5: ',
    \ '6' : '6: ',
    \ '7' : '7: ',
    \ '8' : '8: ',
    \ '9' : '9: '
    \ }
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'base16_default'
let g:airline_powerline_fonts = 1


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


" tabbar -----------------------------------------------------------------

let g:tagbar_width = 40
let g:tagbar_autoclose = 0
