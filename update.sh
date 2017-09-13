#!/bin/bash
#################################
# Backup existing dotfiles in ~ #
#################################


cd "$(dirname "${BASH_SOURCE}")";

echo "--------------------------------------------------------------------------------"
echo "Updating git repository"
git pull -q origin master;
echo "--------------------------------------------------------------------------------"

function syncDotfiles() {
  rsync --exclude ".git/" \
        --exclude "iTerm/" \
        --exclude ".DS_Store" \
        --exclude ".osx" \
        --exclude "update.sh" \
        --exclude "README.md" \
        -avhi --no-perms . ~;
        source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
        syncDotfiles;
else
  read -p "Do you want to back up existing files in your home directory? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    dir=`pwd`
    backupdir=~/.dotfiles_backup

    rm -rf $backupdir
    mkdir -p $backupdir

    cd $dir

    echo "--------------------------------------------------------------------------------"
    echo "Copying dotfiles to be updated from ~ to $backupdir"
    echo "--------------------------------------------------------------------------------"

    for i in * .[^.]*; do
        if [ -e ~/$i ] && [ "$i" != "update.sh" ]
        then
          echo "Backing up $i"
          cp ~/$i $backupdir
        fi
    done
    echo "--------------------------------------------------------------------------------"
    echo "rsyncing dotfiles to ~"
    echo "--------------------------------------------------------------------------------"
  fi;
fi;
syncDotfiles;
unset syncDotfiles;
