" vim plugins
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'kyoh86/vim-ripgrep'
Plug 'vim-scripts/TeTrIs.vim'

call plug#end()

syntax on
colorscheme gruvbox

" my defines
if system('uname -s') == "Darwin\n"
  set clipboard+=unnamed "OSX
else
  set clipboard+=unnamedplus "Linux
endif

let mapleader = " "
set background=dark
set noerrorbells
set expandtab
set laststatus=2
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set incsearch
set colorcolumn=120
set spelllang=en
hi clear Spellbad
hi SpellBad ctermfg=blue

" file name etc at the bottom
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" nerdtree on startup, and goto right pane
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1
nmap <F6> :NERDTreeToggle<CR>
au VimEnter *  NERDTree | :wincmd l

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
map <S-j> 10j
map <S-k> 10k
map <S-l> 10l
map <S-h> 10h

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" copy pasta stuff
nnoremap <C-c> "+y

" Cycle through splits.
nnoremap <S-Tab> <C-w>w

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" whitespace no more
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" cycle autocomplete suggestions
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set completeopt+=preview

" view diagnostics after one second
" autocmd CursorHold 1000 lua vim.lsp.util.show_line_diagnostics()
" autocmd BufEnter * lua vim.lsp.diagnostic.disable()

" fzf toggle
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nnoremap <silent> <C-f> :Files<CR>

" ripgrep
command! -nargs=+ -complete=file Ripgrep :call ripgrep#search(<q-args>)

" lsp-vim
nnoremap <silent> E :lbelow<CR>
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> ge <plug>(lsp-document-diagnostics)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> P <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
    let g:lsp_diagnostics_virtual_text_enabled = 0
    let g:lsp_diagnostics_highlights_enabled = 0
    let g:lsp_diagnostics_signs_error = {'text': '✗'}
    let g:lsp_diagnostics_signs_warning = {'text': '‼'}

    " autocmd! BufWritePre *.rs,*.go,*.cpp,*.h,*.py call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
set foldlevelstart=99

