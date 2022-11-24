set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.config/nvim/init/general.vim

lua require("felrock.lsp")
