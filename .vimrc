" vim plugins
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'

call plug#end()

colorscheme gruvbox

" my defines
let mapleader = " "
set background=dark
set clipboard=unnamedplus
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undo
set undofile
set incsearch
set colorcolumn=120

" create undo if needed
let undo_res = system("!test -e ~/.vim/undo && mkdir ~/.vim/undo")

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
nnoremap <slient> <Leader>gd :YcmCompleter GoTo
nnoremap <slient> <Leader>gf :YcmCompleter FixIt

" fzf
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" NERDTree
let NERDTreeShowHidden=1

