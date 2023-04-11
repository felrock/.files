## MySimpleCheatSheet For Vim

A Document for quick ways around vim and the changes that I've added to my personal vim-config.

### Exit & Entering

Run vim in the current folder, opens up a NERDTree instance.
```
vim .
```

Opens vim with the specified file, opens up a NERDTree instance.
```
vim <file-name>
```

If you want to exit vim really quickly to run a command, do ctrl-z to suspend and run `fg` to enter
again. Alternatively press ctrl-b to get a floating terminal window, spawned in the current file
location.

### Movement

Make big steps with shift letters(H,J,K,L)

### Search & Replace


This replaces all __old__ with all __new__ in the current file.
```
:%s/<old>/<new>/g
```

Press \<space\>fg to do a live grep in the current directory.
Press \<space\>ff to do a find file in the current directory.
Press \<space\>fx to do a live grep with path in copy buffer.
Press \<space\>fd to do a find file with path in copy buffer.

Use NERDTree to get paths to directories.

ctrl-f opens NERDTree in the current working file directory.

### Create & Delete

Hover item in NERDTree, press m for menu, follow instructions there.

### Windows & Panes

Open files with __i__ in NERDTree splits a pane into two(vertical split).
Close pane/file/window with :q.

### Spelling & LSP

To enable spelling run `set spell`, to get a spelling suggestion press z=. Press zg to add current
word as an correct spelling.

Run `LspStop` to remove errors LSP is producing in the current file.

### GDB

add Termdebug to your session:
```
:packadd termdebug
```

Launch Debugger:
```
:Termdebug
```

Select binary to run, set brakepoints etc.
See https://www.dannyadam.com/blog/2019/05/debugging-in-vim/

### Misc

Emacs sux.
