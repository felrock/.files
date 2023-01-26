" Toggle NERDTree, hack to fix when opening vim <dir>
nnoremap <silent> <expr> <C-f> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Toggle floating terminal
nmap <silent> <C-b> :FloatermToggle<CR>

" Telescope keybinds
nnoremap <leader>ff <cmd>Telescope find_files <CR>
nnoremap <leader>fd <cmd>Telescope find_files search_dirs={vim.fn.getreg('+')}<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fx <cmd>Telescope live_grep search_dirs={vim.fn.getreg('+')}<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
