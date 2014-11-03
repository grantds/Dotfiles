#!/bin/bash
####################
# install.sh
# creates symlinks from home directoy to dotfiles in ~/dotfiles (on git)
####################

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc bashrc_gpi bash_aliases vimrc emacs"

echo -e "Creating $olddir for backups of existing dotfiles in ~ ... \n"
mkdir -p $olddir

for file in $files; do
    echo -e "Moving existing dotfiles from ~ to $olddir \n"
    mv ~/.$file ~/dotfiles_old/
    echo -e "Creating symlink to $file in home directory. \n"
    ln -s $dir/$file ~/.$file
done

mv ~/.ssh/config ~/dotfiles_old/ssh-config
ln -s $dir/ssh-config ~/.ssh/config

echo -e "Done! \n"
