" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.nvim/plugged')
" Make sure you use single quotes


" ======= visuals ======= "
Plug 'drewtempelmeyer/palenight.vim'

" ======= code manipulate ======= "
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'kevinoid/vim-jsonc'

" ======= file navigation ======= "
Plug 'preservim/nerdtree'

" ======= file navigation ======= "
Plug 'tpope/vim-fugitive'

" ======= autos ======= "
Plug 'romainl/vim-cool'
Plug 'cohama/lexima.vim'
Plug 'alvan/vim-closetag'

" ======= file navigation ======= "
call plug#end()
