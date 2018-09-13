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
    \ 'colorscheme': 'nord',
    \ }


" LanguageClient-neovim --------------------------------------------------

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper']
    \ }

" indentLine -------------------------------------------------------------

let g:indentLine_char = '·'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_concealcursor = ''

" haskell-vim ------------------------------------------------------------

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1

