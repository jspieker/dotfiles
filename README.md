# Dotfiles for Development

My custom dotfiles for vim and common editors.

![terminal preview](http://imgur.com/tvq3SkV.jpg)

## Requirements
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for easy zsh plugin 
  management i.e. the [agnoster](https://github.com/agnoster/agnoster-zsh-theme) 
  theme.
  * Install zsh-syntax-highlighting with `cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git`
  * Install z (for faster terminal navigation) with homebrew using `brew install z`
* [Menlo for Powerline](https://github.com/abertsch/Menlo-for-Powerline) because 
  the agnoster theme requires a patched font to properly display some elements.
* [NERDTree](https://github.com/scrooloose/nerdtree) to display your file system 
  in vim.

## Installation (**experimental**)

Run `sh installdotfiles.sh` to both backup your existing dotfiles to 
`~/dotfiles_backup` and place the dotfiles from this repository in your `~`. You 
probably need to edit installdotfiles.sh first in order to match your folder 
structure. Furthermore, add `iTerm/com.googlecode.iterm2.plist` to your iTerm 
preferences.

## More previews

![vim preview](http://imgur.com/o3HKh4f.jpg)
