#!/bin/bash
##################
# Create symlinks from homedir to any desired dotfiles
##################

dir=~/Documents/config/dotfiles
backupdir=~/.dotfiles_backup
files="bash_profile vimrc zshrc oh-my-zsh vim atom"

echo "Creating $backupdir etc for backup of any existing dotfiles in ~"
mkdir -p $backupdir
mkdir -p $backupdir .oh-my-zsh
mkdir -p $backupdir .vim
mkdir -p $backupdir .atom

echo "Changing to the $dir directory"
cd $dir

echo "Moving any existing dotfiles from ~ to $backupdir"
for file in $files; do
  mv ~/.$file $backupdir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
