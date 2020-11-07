scriptencoding utf-8
" Use Utf-8 enconding
set encoding=utf-8
set clipboard=unnamed
source ~/.config/nvim/plugs.vim
set nocompatible

" ======= visuals ======= "
set guifont=FiraCode\ Nerd\ Font:h13
set number
syntax enable
set background=dark
colorscheme palenight
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
set showmatch " Show matching brackets.
set mouse=a " Enable mouse usage (all modes)

" Use 2 characters space only indentation
set expandtab
set shiftwidth=2
set softtabstop=2

set splitbelow
set splitright

set cmdheight=1

" ======= shortcuts ======= "
nmap <Leader>ec :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.config/nvim/plugs.vim<cr>
nmap <Leader>eg :tabedit ~/.config/nvim/ginit.vim<cr>

noremap <Leader>t1 1gt
noremap <Leader>t2 2gt
noremap <Leader>t3 3gt
noremap <Leader>t4 4gt
noremap <Leader>t5 5gt
noremap <Leader>t6 6gt
noremap <Leader>t7 7gt
noremap <Leader>t8 8gt
noremap <Leader>t9 9gt
noremap <Leader>t0 :tablast<cr>

" Move between splites easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" close tabs with C+w
nnoremap <C-w> :q<cr>

" save document
nnoremap <C-s> :w<cr>

" ======= autos ======= "
augroup autosourcing
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" ======== Editor ======= "
" allow undo history to persist after closing buffer
if has('persistent_undo')
  set undodir=~/.local/share/nvim/_undo
  set undofile
end

" Allow for named template literals to be highlighted
" in a different syntax than the main buffer.
" https://github.com/Quramy/vim-js-pretty-template
function EnableTemplateLiteralColors()
  " list of named template literal tags and their syntax here
  call jspretmpl#register_tag('hbs', 'handlebars')

  autocmd FileType javascript JsPreTmpl
  autocmd FileType typescript JsPreTmpl

  " compat with leafgarland/typescript-vim
  autocmd FileType typescript syn clear foldBraces
endfunction

call EnableTemplateLiteralColors()


