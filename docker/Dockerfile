# C++ development docker image with vim
FROM gcc:latest

# install deps
RUN apt update && apt install -y cmake python3-dev clang build-essential vim-gtk git neovim

WORKDIR /root

# install vim-plug
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# get .vimrc
RUN git clone https://github.com/felrock/.files && mv .files/.vimrc . && rm -rf .files

# install vim plugins
RUN vim +PlugInstall +qall

# build YouCompleteMe
RUN cd .vim/plugged/YouCompleteMe/ && python3 install.py

LABEL Name=cpp_dev_docker Version=0.0.1