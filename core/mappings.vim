
inoremap jk <Esc>                                               " Quicker <Esc> in insert mode
nnoremap <silent> <leader>w :<C-U>update<CR>                    " Shortcut for faster save and quit
nnoremap <silent> <leader>q :<C-U>x<CR>                         " Saves the file if modified and quit
nnoremap <silent> <leader>Q :<C-U>qa<CR>                        " Quit all opened buffers

nnoremap <expr> oo printf('m`%so<ESC>``', v:count1)             " Insert a blank line below or above current line (do not move the cursor),
nnoremap <expr> OO printf('m`%sO<ESC>``', v:count1)             " see https://stackoverflow.com/a/16136133/6064933
nnoremap Y y$                                                   " Yank from current cursor position to the end of the line (make it
                                                                " consistent with the behavior of D, C)

" Move the cursor based on physical lines, not the actual lines.
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap ^ g^
nnoremap 0 g0

nnoremap <Tab> %                                                " Jump to matching pairs easily in normal mode
nnoremap H ^                                                    " Go to start or end of line easier
xnoremap H ^
nnoremap L g_
xnoremap L g_

" Tab-complete, see https://vi.stackexchange.com/q/19675/15292.
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Edit and reload init.vim quickly
nnoremap <silent> <leader>ev :<C-U>tabnew $MYVIMRC <bar> tcd %:h<cr>
nnoremap <silent> <leader>sv :<C-U>silent update $MYVIMRC <bar> source $MYVIMRC <bar>
      \ echomsg "Nvim config successfully reloaded!"<cr>

" Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
nnoremap <expr> <leader>v printf('`[%s`]', getregtype()[0])

" Search in selected region
vnoremap / :<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>

" Find and replace (like Sublime Text 3)
nnoremap <C-H> :%s/
xnoremap <C-H> :s/

" Change current working directory locally and print cwd after that,
" see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
nnoremap <silent> <leader>cd :<C-U>lcd %:p:h<CR>:pwd<CR>

" Use Esc to quit builtin terminal
tnoremap <ESC>   <C-\><C-n>

" mapping for switching between splits
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

" mapping for saving file with ctrl+s
nnoremap <silent> <C-s> :w<cr>
