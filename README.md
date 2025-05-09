<h1 align="center">~/.dotfiles</h1>

***
<span align="center">Just use it for whatever. Managed by Stow.</span>
***

## Dependencies
- Stow > 2.3.0
- git
- zsh
- oh-my-zsh
- wget
- curl

## Before you install
Make sure you have oh-my-zsh installed and running as this script heavily depends on oh-my-zsh 
framework and `.zshrc` needs to be present in home folder. During the setup process `.zshrc`
will be renamed to `.zshrc.old` which will serve as backup in case something goes horibly wrong.  

## Installation
+ Clone Repo
+ Make sure all the dependencies are installed
+ Run `./setup`
+ Install NeoVim
+ Enjoy

## Handcrafted tools
### TM - Tmux Sessionizer (this one is actually stolen from nick nisi)
Tmux Sessionizer could be found in `bin/bin/tm`, upon running the script it will show you options to either
create new tmux sessions or open existing. You can name them however you want and they do persist through PC restarts.
 `tm` is there just to simplify work with tmux as command to hook up existing sessions and get their names could 
be quite exhausting if you're doing it every couple of hours

### Pogmit - Git Commit Generator
`pogmit` simplifies process of creating conventional commits. In our work we have to include issue number in the commit and also scope, type + message,
it's a lot of typing and copy pasting, so this is there just to make it more quicker


### Uses
- [Neovim](https://neovim.io/)
- [Ghostty](https://ghostty.org/)
- [TablePlus](https://tableplus.com/)
- [Nextcloud](https://nextcloud.com)
- [Zen](https://zen-browser.app/)
- [tmux](https://github.com/tmux/tmux/wiki)
- [1password](https://1password.com/)
