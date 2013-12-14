## Create symlinks:

ln -s dotfiles/.vim/ ~/.vim    
ln -s dotfiles/.vimrc ~/.vimrc    
ln -s dotfiles/.bash_zack ~/.bash_zack
ln -s dotfiles/.gitconfig ~/.gitconfig    
ln -s dotfiles/.gitignore_global ~/.gitignore_global

## Fetch submodules:

git submodule update --init
