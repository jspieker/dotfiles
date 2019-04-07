# ~/.*

These are my dotfiles for a clean vim experience. [vim-plug](https://github.com/junegunn/vim-plug) is used to manage plugins and automatically installs once `.vimrc` is opened.

## Installation

* Install [chezmoi](https://github.com/twpayne/chezmoi) (`brew install chezmoi`).
* Run `chezmoi init https://github.com/jspieker/dotfiles.git`

All in one:
`brew install neovim git htop noti the_silver_searcher tig tmux vim yarn z zsh zsh-syntax-highlighting twpayne/taps/chezmoi && brew cask install alacritty brave-browser google-chrome iterm2 visual-studio-code && chezmoi init https://github.com/jspieker/dotfiles.git`

## Other
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for easy zsh plugin
  management i.e. the [agnoster](https://github.com/agnoster/agnoster-zsh-theme)
  theme.
* [Patched Font (SFMono)](https://github.com/2players/sfmono-nerd-font) because the 
  agnoster theme requires a patched font to properly display some elements.
