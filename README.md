<h1 align="center">~/.files</h1>

![dotfiles](https://i.imgur.com/A7M1jLl.png)

## Clone Repo
```shell-script
$ cd && git clone https://github.com/TheMartes/dotfiles .files
```

## Script Installation
`./install_script`

## Manual Installation
### To Symlink all files run
Be careful. This will work only if folder is located `$HOME` like so `~/.files/`
```shell-script
$ cd ~/.files && ./symlink
```

This will also do update all submodules from repository

### Reload Tmux with new config file
```
tmux source-file $HOME/.tmux.conf
```

And you're done. Also i recommend to install all of these dependencies to make it work properly. (Again this is supposed to work only on arch & swaywm)
```
$ sudo pacman -S swaylock grim rofi slurp xclip waybar arc-gtk-theme neovim tmux bat termite
$ yay rofimoji-git mako-git
```
Make sure `yay` is installed, otherwise replace it with any other AUR helper.

***
## Apps
### Development
+ **Editor:** NeoVIM. Really loving it. [Here you have number of reasons why you should use NeoVIM instead of VIM](https://www.youtube.com/watch?v=LRQGAnPtNdM)
+ **Terminal:** [Termite](https://wiki.archlinux.org/index.php/Termite) + tmux [with my config files](https://github.com/TheMartes/dotfiles/blob/master/.tmux.conf).
+ **Database Client:** CLI + [MySQL Workbench](https://www.mysql.com/products/workbench/).
+ **API Testing** is provided by [Insomnia](https://insomnia.rest/)
+ **Dev Environmet** are managed by [Docker](https://www.docker.com/)
+ **GIT:** CLI driven :)

### Other tools
+ For music i'm using [Spotify](https://www.spotify.com/)
+ Email client is [MailSpring](https://getmailspring.com/)
+ Browser of choice is [Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/)
+ For communication i'm using [Discord](https://discordapp.com/) & [Slack](https://slack.com/)
+ Note taking app of choice is [Simplenote](https://simplenote.com/)
+ [Microsoft To-Do](https://to-do.microsoft.com/en-us) for staying organized.
+ For Office i used to use [Google Docs](docs.google.com), since it's free and awesome.
+ Markdown is done in [VSCode](https://code.visualstudio.com/), which i'm using as my secondary editor.
And at the end, I'm keeping most of my files in [Google Drive](https://drive.google.com).



