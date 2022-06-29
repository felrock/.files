" vim plugins
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'
" Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'

call plug#end()

syntax on
colorscheme gruvbox

" my defines
let mapleader = " "
set background=dark
set clipboard=unnamedplus
set noerrorbells
set expandtab
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
set undodir=~/.vim/undo
set undofile
set incsearch
set colorcolumn=120

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

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

" YCM
noremap <C-d> :YcmCompleter GoTo<CR>

" fzf
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" COC.vim
" Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
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
nnoremap <silent> K :call ShowDocumentation()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" syntastic
"
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'

" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" whitespace no more
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1
