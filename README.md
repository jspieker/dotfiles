# ~/.*

These are my dotfiles for a clean vim experience. [vim-plug](https://github.com/junegunn/vim-plug) is used to manage plugins and automatically installs once `.vimrc` is opened.

## Installation

* Install [chezmoi](https://github.com/twpayne/chezmoi) (`brew install chezmoi`).
* Create a new file `~/.config/chezmoi/chezmoi.toml` and enter your git data:
```
[data]
  name = "first_name last_name"
  email = "email"
```
* Run `sysup`

