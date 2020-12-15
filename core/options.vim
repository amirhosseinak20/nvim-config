
" VIM Configs
set nocompatible      " disable vi compatible mode
set number        " enable line numbers
syntax enable       " enable syntax highlighting
scriptencoding utf-8      " set script encoding utf-8
set encoding=utf-8      " set encoding utf-8
set mouse=a       " enable mouse usage (all modes)
set cmdheight=1       " set command mode height 1 line

let mapleader=','     " changing mapleader to ','

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
let g:lsp_fold_enabled = 0

set splitbelow        " new horizontal splites goes bellow
set splitright        " new vertical splites goes right
set showmatch       " show matching brackets
set termbidi        " add bidirectional language support to vim
set linebreak       " Avoid wrapping a line in the middle of a word.
set backspace=indent,eol,start    " Allow backspacing over indention, line breaks and insertion start.
set confirm       " Display a confirmation dialog when closing an unsaved file.
set noswapfile        " Disable swap files.
set autoindent        " New lines inherit the indentation of previous lines

set clipboard^=unnamed,unnamedplus  " Clipboard settings, always use clipboard for all delete, yank, change, put
          " operation, see https://stackoverflow.com/q/30691466/6064933

" Set up backup directory
let g:backupdir=expand(stdpath('data') . '/backup')
if !isdirectory(g:backupdir)
   call mkdir(g:backupdir, 'p')
endif
let &backupdir=g:backupdir

set backupcopy=yes        " copy the original file to backupdir and overwrite it

" General tab settings
set expandtab
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent

set ignorecase smartcase    " Ignore case in general, but become case-sensitive when uppercase is present
set linebreak       " Break line at predefined characters
set showbreak=↪       " Character to show before the lines that have been soft-wrapped

" Ignore certain files and folders when globbing
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,*/node_modules/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz

set visualbell noerrorbells  " Do not use visual and errorbells
set history=500  " The number of command and search history to keep

set list
" set lcs=tab:>-,space:.

if (g:is_linux || g:is_mac)
  let g:ruby_host_prog = 'rvm system do neovim-ruby-host'
endif

" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

