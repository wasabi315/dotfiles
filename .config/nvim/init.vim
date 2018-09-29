"
" File       : init.vim (https://github.com/wasabi315/dotfiles)
" Maintainer : wasabi315
" License    : MIT
"

" dein scripts -----------------------------------------------------------

if &compatible
    set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#add('autozimu/LanguageClient-neovim', {
        \ 'rev': 'next',
        \ 'build': 'bash install.sh',
        \ })

    let s:toml_dir = expand('~/.config/nvim')

    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif


" load scripts --------------------------------------------------------------
" plugin settings
source ~/.config/nvim/plugins.vim

" key mappings
source ~/.config/nvim/keymap.vim


" General --------------------------------------------------------------------
set autoread
set encoding=utf-8
set fileencoding=utf-8
set hidden
set mouse=
set noswapfile
set nobackup
set ttimeoutlen=0


" Colors ---------------------------------------------------------------------
set termguicolors
let g:two_firewatch_italics=1
colorscheme two-firewatch
highlight MatchParen guibg=#B6AD9A
highlight StatusLine guibg=#E5DDCB

" UI -------------------------------------------------------------------------
set cursorline
set history=1000
set laststatus=2
set number
set noshowmode
set ruler
set showmatch
set wildmenu

let g:currentmode={
    \ 'n' : 'NORMAL',
    \ 'no' : 'NORMAL',
    \ 'v' : 'VISUAL',
    \ 'V' : 'V-LINE',
    \ 'x22' : 'V-BLOCK',
    \ 's' : 'SELECT',
    \ 'S' : 'S-LINE',
    \ 'x19' : 'S-BLOCK',
    \ 'i' : 'INSERT',
    \ 'R' : 'REPLACE',
    \ 'Rv' : 'REPLACE',
    \ 'c' : 'COMMAND',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r' : 'PROMPT',
    \ 'rm' : 'MORE',
    \ 'r?' : 'COMFIRM',
    \ '!' : 'SHELL',
    \ 't' : 'TERMINAL',
    \ }

set statusline=[%{g:currentmode[mode()]}]\ %f%m%r%h%=%y\ [%{&fileencoding}]\ [%l/%L]

" Indent and Spacing ----------------------------------------------------------
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4

" Searching -------------------------------------------------------------------
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan
