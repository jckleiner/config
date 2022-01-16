set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent


""""" source the vimrc in the current dir
set exrc

""""" keeps the insert cursor a block, instead of a thin line
set guicursor=


""""" other lines are numbered relative
set relativenumber
""""" show the current line number
set nu

""""" after you are done searching, remove the highlight
set nohlsearch

""""" good, keeps everyting open
set hidden
set noerrorbells

""""" smartcase only works with ignorecase
""""" if you use a capital letter, it then become a case-sensitive search
""""" if not, then it will be a case-insensitive
""""" set smartcase
""""" set ignorecase


""""" set ignorecase
set noswapfile
set nobackup
""""" these work well with the plugin 'undotree'
set undodir=~/.vim/undodir
set undofile

""""" highlight while typing
set incsearch

set termguicolors

""""" scrolling shows the upcominglines before you hit the end
set scrolloff=8

""""" adds an extra column on the left. Useful for linting
set signcolumn=yes
set colorcolumn=160

""""" define leader key
"""""let mapleader = " "
