# Dotfiles for Development

My custom dotfiles for vim and common editors.

## Recommended
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for easy zsh plugin 
  management i.e. the [agnoster](https://github.com/agnoster/agnoster-zsh-theme) 
  theme.
* [Menlo for Powerline](https://github.com/abertsch/Menlo-for-Powerline) because 
  the agnoster theme requires a patched font to properly display some elements.

## Installation

Run `sh installdotfiles.sh` to both backup your existing dotfiles to 
`~/dotfiles_backup` and place the dotfiles from this repository in your `~`.  
You probably need to edit installdotfiles.sh first in order to match your folder 
structure. Furthermore, add `iTerm/com.googlecode.iterm2.plist` to your iTerm 
preferences.

## Full list of dotfiles in this repository

* .bash_profile
* .vimrc
* .zshrc
* .oh-my-zsh
* .vim

