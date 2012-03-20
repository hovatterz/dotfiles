## Installation:

git clone git@github.com:hovatterz/dotfiles.git ~/dotfiles

## Create symlinks:

ln -s dotfiles/.vim/ ~/.vim
ln -s dotfiles/.vimrc ~/.vimrc
ln -s dotfiles/.bashrc ~/.bashrc
ln -s dotfiles/.gitconfig ~/.gitconfig
ln -s dotfiles/.gitignore_global ~/.gitignore_global

## Fetch submodules:

git submodule update --init
