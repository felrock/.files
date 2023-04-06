# *DOT* *DOT* *DOT*

## Dox
My .vimrc needs the following: neovim, vim-gtk, python3-dev, cmake, clang, build-essential, and vim-plug

For markdown preview to work, download node and yarn

## vim-plug

### Unix install:

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### CoC config for C++ dev:

https://codevion.github.io/index.html#!vim/coc.md

```
{
"languageserver": {
  "ccls": {
    "command": "ccls",
    "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"],
    "rootPatterns": [".ccls", "compile_commands.json", ".git/", ".hg/"],
    "initializationOptions": {
        "cache": {
          "directory": "/tmp/ccls"
        }
      }
  }
}
}
```

and Add a _.ccls_ file into the root directory:

_.ccls_
```
%compile_commands.json
```

### Programs to make it chill to use the terminal
```
fd-find
ripgrep
fzf
zoxide(z)
ranger
nnn
```
