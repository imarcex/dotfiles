" Enable mouse support
set mouse=a

" Enable syntax
syntax on

" Enable line numbers
set number
set relativenumber
filetype plugin on

" Enable highlight search pattern
set hlsearch

" Enable smartcase search
set ignorecase
set smartcase

" Identation using spaces
set tabstop     =4
set softtabstop =4
set shiftwidth	=4
set expandtab
set autoindent

" Show the pair bracket
set showmatch

" No swap files
set noswapfile

" Adjust highlighting of matching parenthesis
hi MatchParen cterm=underline guibg=none guifg=none ctermbg=none ctermfg=none

" Remove trailing whitespace from Python files
autocmd BufWritePre *.py :%s/\s\+$//e

" Enable color themes
if !has('gui_running')
    set t_Co=256
endif

" Enable true colors
set termguicolors

call plug#begin()

Plug 'blazkowolf/gruber-darker.nvim'

Plug 'nvim-lualine/lualine.nvim'

Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

" Nvim Colorscheme
colorscheme gruber-darker

" Config Lualine
lua << EOF
require('lualine-config')
EOF
