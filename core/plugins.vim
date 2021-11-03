scriptencoding utf-8
""""""""""""""""""""""""""""""""""""
" My Neovim Plugins    "
"   Author: @amirhosseinak20       "
""""""""""""""""""""""""""""""""""""
" The root directory to install all plugins.
let g:plugin_home=expand(stdpath('data') . '/plugged')

call plug#begin(g:plugin_home)
  " Make sure you use single quotes
  " Auto-completion plugins
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'codota/tabnine-vim'

  " Language-Specific Plugins
  " Plug 'mattn/emmet-vim'                                          " HTML
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-ruby/vim-ruby'
  " Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'
  " Plug 'mxw/vim-jsx'
  " Plug 'pangloss/vim-javascript'
  " Plug 'ianks/vim-tsx'
  " Plug 'leafgarland/typescript-vim'
  " Plug 'alvan/vim-closetag'

  " Search related Plugins
  Plug 'justinmk/vim-sneak'                                       " Super fast movement with vim-sneak
  Plug 'romainl/vim-cool'                                         " Show current search term in different color
  Plug 'haya14busa/vim-asterisk'                                  " Stay after pressing * and search selected text

  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
  Plug 'mileszs/ack.vim'

  " File editting plugin
  " Snippet engine and snippet template
  " Plug 'jiangmiao/auto-pairs'                                     " Automatic insertion and deletion of a pair of characters
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-commentary'                                     " Comment plugin
  Plug 'mg979/vim-visual-multi'                                   " Multiple cursor plugin like Sublime Text?
  Plug 'simnalamburt/vim-mundo'                                   " Show undo history visually
  Plug 'tpope/vim-eunuch'                                         " Handy unix command inside Vim (Rename, Move etc.)
  Plug 'tpope/vim-repeat'                                         " Repeat vim motions
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'

  " Git related plugins
  Plug 'airblade/vim-gitgutter'                                   " git diff in sign column
  Plug 'tpope/vim-fugitive'

  " Misc plugins
  Plug 'andymass/vim-matchup'                                     " Modern matchit implementation
  Plug 'psliwka/vim-smoothie'                                     " Smoothie motions

  " Others
  Plug 'itchyny/vim-highlighturl'                                 " Highlight URLs inside vim

  Plug 'majutsushi/tagbar'
  Plug 'universal-ctags/ctags'
  Plug 'ludovicchabant/vim-gutentags'

  Plug 'wakatime/vim-wakatime'                                    " Timer
  Plug 'editorconfig/editorconfig-vim'                            " support for editorconfig

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

"""""""""""""""""""""Language Specific Plugins Configs"""""""""""""""""""""""""""""
" Coc-nvim
let g:coc_global_extensions = [
\ 'coc-actions',
\ 'coc-json',
\ 'coc-git',
\ 'coc-solargraph', 
\ 'coc-tsserver', 
\ 'coc-yaml', 
\ 'coc-svg', 
\ 'coc-spell-checker', 
\ 'coc-cspell-dicts',
\ 'coc-python', 
\ 'coc-html', 
\ 'coc-css',
\ 'coc-vimlsp',
\ 'coc-highlight',
\ 'coc-emmet',
\ 'coc-yank',
\ 'https://github.com/rodrigore/coc-tailwind-intellisense',
\ 'coc-prettier',
\ 'coc-eslint',
\ 'coc-highlight',
\ 'coc-markdownlint',
\ 'coc-stylelint',
\ 'coc-cssmodules',
\ 'coc-graphql'
\ ]
" \ 'coc-ember', 
" \ 'coc-tabnine'
" \ ]
" " Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Setup keymap to open yank list like:
nnoremap <silent> <space>y  :<C-u>CocList -A yank<cr>

" add Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>pa  <Plug>(coc-format)
nmap <leader>pa  <Plug>(coc-format)
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)

"""""""""""""""""""""Navigation Plugins Config""""""""""""""""""""""""""""
" NERDTree
"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>nt :NERDTreeToggle<CR>
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0

"""""""""""""""""""""""""""""""""Others"""""""""""""""""""""""""""""""""""""
                                                            " gutentags
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 1
nmap <F8> :TagbarToggle<CR>
map <C-m> :TagbarToggle<CR>
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

""""""""""""""""""""""""Ack.vim""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""editorconfig""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let gutentags_ctags_tagfile = '.vim/tags'
