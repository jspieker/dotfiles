# ~/.*

These are my dotfiles for a clean vim experience. [vim-plug](https://github.com/junegunn/vim-plug) is used to manage plugins and automatically installs once you open the `.vimrc`.

Run `sh update.sh` (or `./update.sh` on linux) to install above dotfiles to your home directory. During this step you can choose to back up your existing dotfiles that are to be updated to `~./dotfiles_backup`, this prompt can however be skipped with `-f`.

# Screenshot
![Screenshot](https://i.imgur.com/8MYAR1u.jpg)

# Dependencies for macos

* Install [homebrew](https://brew.sh)
* Install [neovim](http://neovim.io) with `brew install neovim`

### [Deoplete autocompletion](https://github.com/Shougo/deoplete.nvim)
* Install Apple command line tools with `xcode-select --install`
* Install pip3 with `brew install python3`
* Install python-neovim support with `pip3 install neovim`
* You might have to run `:UpgradeRemotePlugins` after `:PlugInstall` from your `.vimrc` afterwards.

# Dependencies for linux

* Install [neovim](http://neovim.io) with `sudo apt-get install neovim`

### [Deoplete autocompletion](https://github.com/Shougo/deoplete.nvim)
* Install python3 tools with `sudo apt-get install python-dev python-pip python3-dev python3-pip`
  * If it came preinstalled you might need to run `pip3 install --upgrade pip`
* Install setuptools with `sudo pip3 install setuptools`
* Install python-neovim support with `sudo pip3 install neovim`
* You might have to run `:UpgradeRemotePlugins` after `:PlugInstall` from your `.vimrc` afterwards.



# Other
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for easy zsh plugin
  management i.e. the [agnoster](https://github.com/agnoster/agnoster-zsh-theme)
  theme.
  * Install zsh-syntax-highlighting with `cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git`
  * Install z (for faster terminal navigation) with homebrew using `brew install z`
* [Menlo for Powerline](https://github.com/abertsch/Menlo-for-Powerline) because the agnoster theme requires a patched font to properly display some elements.
