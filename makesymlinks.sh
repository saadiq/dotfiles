#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc bash_profile vimrc vim zshrc"    # list of files/folders to symlink in homedir
# also zsh theme manually handled below

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "  ...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "  ...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo $file
  if [ -f ~/.$file ]
  then
    echo "  Moving from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
  fi
  if [ -f $dir/$file ]
  then
    echo "  Creating symlink in home directory."
    ln -s $dir/$file ~/.$file
  fi
done

# zsh theme
file="saadiq.zsh-theme"
echo $file
if [ -f ~/.oh-my-zsh/themes/$file ]
then
  echo "  Moving from ~ to $olddir"
  mv ~/.oh-my-zsh/themes/$file ~/dotfiles_old/
fi
if [ -f $dir/$file ]
then
  echo "  Creating symlink in home directory."
  ln -s $dir/$file ~/.oh-my-zsh/themes/$file
fi
