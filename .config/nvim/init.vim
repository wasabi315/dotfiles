"                    _  _             _
"                   | \| |___ _____ _(_)_ __
"                   | .` / -_) _ \ V / | '  \
"                   |_|\_\___\___/\_/|_|_|_|_|
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
set clipboard+=unnamedplus
set updatetime=300

" Colors ---------------------------------------------------------------------
set termguicolors

" UI -------------------------------------------------------------------------
set cursorline
set history=1000
set laststatus=2
set number
set relativenumber
set noshowmode
set ruler
set showmatch
set wildmenu
set signcolumn=yes
set foldmethod=marker
set showtabline=2

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

" AutoCmds -------------------------------------------------------------------
augroup templateGroup
    autocmd!
    autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skelton.html
    autocmd BufNewFile *.hs 0r ~/.config/nvim/templates/skelton.hs
augroup END

