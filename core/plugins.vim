scriptencoding utf-8
""""""""""""""""""""""""""""""""""""
" My Neovim Plugins    "
"   Author: @amirhosseinak20       "
""""""""""""""""""""""""""""""""""""
" The root directory to install all plugins.
let g:plugin_home=expand(stdpath('data') . '/plugged')

call plug#begin(g:plugin_home)
  " Make sure you use single quotes
  " UI Plugins
  Plug 'ajh17/spacegray.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'tomasr/molokai'
  Plug 'joshdick/onedark.vim'
  if !exists('g:started_by_firenvim')
    " colorful status line and theme
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
  endif
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/vim-easy-align'

  " Auto-completion plugins
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Language-Specific Plugins
  Plug 'mattn/emmet-vim'                                          " HTML
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'

  " Search related Plugins
  Plug 'justinmk/vim-sneak'                                       " Super fast movement with vim-sneak
  Plug 'romainl/vim-cool'                                         " Show current search term in different color
  Plug 'haya14busa/vim-asterisk'                                  " Stay after pressing * and search selected text

  " Navigation and tags plugin
  " Only install these plugins if ctags are installed on the system
  if executable('ctags')
    " plugin to manage your tags
    Plug 'ludovicchabant/vim-gutentags'
  endif
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ctrlpvim/ctrlp.vim'                                       " full path fuzzy file, buffer, mru, tag, ...finder for vim
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

  " File editting plugin
  " Snippet engine and snippet template
  Plug 'jiangmiao/auto-pairs'                                     " Automatic insertion and deletion of a pair of characters
  Plug 'tpope/vim-commentary'                                     " Comment plugin
  Plug 'mg979/vim-visual-multi'                                   " Multiple cursor plugin like Sublime Text?
  Plug 'simnalamburt/vim-mundo'                                   " Show undo history visually
  Plug 'tpope/vim-eunuch'                                         " Handy unix command inside Vim (Rename, Move etc.)
  Plug 'tpope/vim-repeat'                                         " Repeat vim motions
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'

  " Linting, formating
  Plug 'dense-analysis/ale'                                       " Syntax check and make

  " Git related plugins
  Plug 'airblade/vim-gitgutter'                                   " git diff in sign column

  " Misc plugins
  Plug 'andymass/vim-matchup'                                     " Modern matchit implementation
  Plug 'psliwka/vim-smoothie'                                     " Smoothie motions

  " Others
  Plug 'itchyny/vim-highlighturl'                                 " Highlight URLs inside vim
  Plug 'preservim/tagbar'

call plug#end()

" Plugins configs
  " vim-sneak
  let g:sneak#label = 1                                             " Use sneak label mode

  nmap f <Plug>Sneak_s
  xmap f <Plug>Sneak_s
  onoremap <silent> f :call sneak#wrap(v:operator, 2, 0, 1, 1)<CR>
  nmap F <Plug>Sneak_S
  xmap F <Plug>Sneak_S
  onoremap <silent> F :call sneak#wrap(v:operator, 2, 1, 1, 1)<CR>

  " Immediately after entering sneak mode, you can press f and F to go to next
  " or previous match
  let  g:sneak#s_next = 1
  "
  " vim-asterisk
  nmap *  <Plug>(asterisk-z*)
  nmap #  <Plug>(asterisk-z#)
  xmap *  <Plug>(asterisk-z*)
  xmap #  <Plug>(asterisk-z#)

                                                              " gutentags
  let g:gutentags_ctags_exclude = ['*.md', '*.html', '*.json', '*.toml', '*.css', '*.js',]
  let g:gutentags_cache_dir     = stdpath('cache') . '/ctags' " The path to store tags files, instead of in the project root.

  " mundo
  let g:mundo_verbose_graph = 0
  let g:mundo_width = 80

  nnoremap <silent> <Space>u :MundoToggle<CR>

  " vim-signify
  " The VCS to use
  let g:signify_vcs_list = [ 'git' ]

  " Change the sign for certain operations
  let g:signify_sign_change = '~'

  " airline
  " Set airline theme to a random one if it exists
  let g:airline_theme='onedark'

  " Tabline settings
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

  " Show buffer number for easier switching between buffer,
  " see https://github.com/vim-airline/vim-airline/issues/1149
  let g:airline#extensions#tabline#buffer_nr_show = 1

  " Buffer number display format
  let g:airline#extensions#tabline#buffer_nr_format = '%s. '

  " Whether to show function or other tags on status line
  let g:airline#extensions#vista#enabled = 1
  let g:airline#extensions#gutentags#enabled = 1

  " Enable vim-airline extension for vim-lsp
  let g:airline#extensions#lsp#enabled = 1

  " Skip empty sections if there are nothing to show,
  " extracted from https://vi.stackexchange.com/a/9637/15292
  let g:airline_skip_empty_sections = 1

  " Whether to use powerline symbols, see https://vi.stackexchange.com/q/3359/15292
  let g:airline_powerline_fonts = 1

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " Only show git hunks which are non-zero
  let g:airline#extensions#hunks#non_zero_only = 1

  " Speed up airline
  let g:airline_highlighting_cache = 1

  " vim-matchup
  " Improve performance
  let g:matchup_matchparen_deferred = 1
  let g:matchup_matchparen_timeout = 100
  let g:matchup_matchparen_insert_timeout = 30

  " Enhanced matching with matchup plugin
  let g:matchup_override_vimtex = 1

  " Whether to enable matching inside comment or string
  let g:matchup_delim_noskips = 0

  " Show offscreen match pair in popup window
  let g:matchup_matchparen_offscreen = {'method': 'popup'}

  " Change highlight color of matching bracket for better visual effects
  augroup matchup_matchparen_highlight
    autocmd!
    autocmd ColorScheme * highlight MatchParen cterm=underline gui=underline
  augroup END

  " Show matching keyword as underlined text to reduce color clutter
  augroup matchup_matchword_highlight
    autocmd!
    autocmd ColorScheme * hi MatchWord cterm=underline gui=underline
  augroup END

""""""""""""""""""""""""""""""""""""Linters""""""""""""""""""""""""""""""""""""""""
" ale
" Only run linters in the g:ale_linters dictionary
let g:ale_linters_explicit = 1

let g:ale_linters = {
  \ 'vim': ['vint'],
  \ 'cpp': ['clang'],
  \ 'c': ['clang'],
  \ 'ruby': ['rubocop']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop']
\}
let g:ale_sign_column_always = 1
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
" If you configure g:ale_pattern_options outside of vimrc, you need this.
let g:ale_pattern_options_enabled = 1

"""""""""""""""""""""Language Specific Plugins Configs"""""""""""""""""""""""""""""
" Coc-nvim
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

""""""""""""""""""""""Navigation Plugins Config""""""""""""""""""""""""""""
" NERDTree
"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>nt :NERDTreeToggle<CR>
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

"""""""""""""""""""""""""""""""""Others"""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""CtrlP""""""""""""""""""""""""""""""
nnoremap <leader>b :CtrlPBuffer<cr>

""""""""""""""""""""""""""""LeaderF""""""""""""""""""""""""""""
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

