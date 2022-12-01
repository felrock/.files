syntax on

if system('uname -s') == "Darwin\n"
  set clipboard+=unnamed " OSX
else
  set clipboard+=unnamedplus " Linux
endif

let mapleader = " "
set background=dark
set noerrorbells
set expandtab
set laststatus=2
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set incsearch
set colorcolumn=100
set spelllang=en
hi clear Spellbad
hi SpellBad ctermfg=blue

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

