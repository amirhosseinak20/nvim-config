" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes

  " ======= visuals ======= "
  Plug 'airblade/vim-gitgutter'
  Plug 'powerline/powerline-fonts'

  " ====== Finding
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
    
  " ===== Linting
  
  " ======= code manipulate ======= "
  Plug 'mattn/emmet-vim'
  Plug 'kevinoid/vim-jsonc'

  " ======= file navigation ======= "
  Plug 'tpope/vim-fugitive'

  " ======= autos ======= "
  Plug 'romainl/vim-cool'
  Plug 'cohama/lexima.vim'
  Plug 'alvan/vim-closetag'

  " Working with code
  Plug 'editorconfig/editorconfig-vim'
  Plug 'scrooloose/nerdcommenter'
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  Plug 'tpope/vim-rvm'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  " define shortcuts for replacements
  lnoremap <leader>r cs
  lnoremap <leader>d ysiw

  """"""""""""""""""""
  " Language Servers
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-bundler'

  try
    let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-solargraph', 
      \ 'coc-ember', 
      \ 'coc-tsserver', 
      \ 'coc-yaml', 
      \ 'coc-svg', 
      \ 'coc-spell-checker', 
      \ 'coc-python', 
      \ 'coc-html', 
      \ 'coc-css',
      \ 'coc-vimlsp',
      \ 'coc-highlight'
    \ ]
    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()
    " use <c-space>for trigger completion
    inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)
    "" Close preview window when completion is done.
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
    
  catch
    echo 'Please install coc.nvim'
  endtry

  """"""""""""""""""""
  " Linters
  Plug 'w0rp/ale'
  try
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = '⚠'
    let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'typescript': ['eslint'],
    \   'typescript.tsx': ['eslint'],
    \}

    let g:ale_fixers = {
    \   'javascript': ['eslint'],
    \   'typescript': ['eslint'],
    \   'typescript.tsx': ['eslint'],
    \}
    let g:ale_sign_column_always = 1
  catch
    echo 'Please install ale'
  endtry

  """"""""""""""""""""
  " File Navigation
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  try
    nnoremap <C-b> :NERDTreeToggle<cr>
    let NERDTreeShowHidden=1 " This also ignores .gitignore
    let NERDTreeIgnore=['.git$[[dir]]', '.swp', 'dist', 'tmp', 'node_modules', 'bower_components', '.pnp']
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
  catch
    echo 'Please install NERDTree'
  endtry

  """"""""""""""""""""
  " Syntax Support

  " Syntax not needed, because provided by polyglot
  "
  " toml: cespare/vim-toml
  " json5: GutenYe/json5.vim
  " josn: elzr/vim-json
  " nginx: chr4/nginx.vim
  Plug 'sheerun/vim-polyglot'
  try
    " handled below
    " let g:polyglot_disabled = ['css', 'ts', 'typescript', 'js', 'javascript', 'hbs', 'json']
    let g:polyglot_disabled = ['css', 'js', 'javascript', 'hbs', 'json']
    set re=0
    " Polyglot Markdown provided by: https://github.com/plasticboy/vim-markdown
    let g:vim_markdown_fenced_languages = ['js=javascript', 'ts=typescript', 'hbs=html.handlebars', 'bash=sh']
  catch
    echo 'Please install vim-polyglot'
  endtry

  " CSS
  " Plug 'amadeus/vim-css'
  " Plug 'stephenway/postcss.vim'
  Plug 'alexlafroscia/postcss-syntax.vim'


  " Typescript syntax
  " Plug 'leafgarland/typescript-vim'

  " JavaScript Syntax
  Plug 'pangloss/vim-javascript'
  try
    let g:javascript_plugin_jsdoc = 1
  catch
    echo 'Please install vim-javascript'
  endtry

  " Plug 'HerringtonDarkholme/yats.vim'
  " Ember template highlighting
  Plug 'joukevandermaas/vim-ember-hbs'

  " Additional jsx highlighting
  " Plug 'maxmellon/vim-jsx-pretty'
  " let g:vim_jsx_pretty_colorful_config = 1

  " Nested syntax highlighting
  " needed for js/ts named template literals
  " and markdown.
  Plug 'Quramy/vim-js-pretty-template'

  """""""""""""""""""""""
  " UI
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'

  try
    let g:airline_theme = "palenight"
    " Enable extensions
    let g:airline_extensions = ['branch', 'hunks', 'coc']
    " Update section z to just have line number
    " let g:airline_section_z = airline#section#create(['linenr'])
    " Do not draw separators for empty sections (only for the active window) >
    let g:airline_skip_empty_sections = 1
    " Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    " Custom setup that removes filetype/whitespace from default vim airline bar
    let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
    " Customize vim airline per filetype
    " 'nerdtree'  - Hide nerdtree status line
    " 'list'      - Only show file type plus current line number out of total
    let g:airline_filetype_overrides = {
      \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
      \ 'list': [ '%y', '%l/%L'],
      \ }
    " Enable powerline fonts
    let g:airline_powerline_fonts = 1
    " Enable caching of syntax highlighting groups

    let g:airline_highlighting_cache = 1
    " Define custom airline symbols
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    " Don't show git changes to current file in airline
    let g:airline#extensions#hunks#enabled=0
  catch
    echo 'Please install vim-polyglot'
  endtry

call plug#end()
