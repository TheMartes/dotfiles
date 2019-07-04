<h1 align="center">~/.files</h1>

![dotfiles](https://i.imgur.com/wlOwIWI.png)

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
$ yay rofimoji-git
```
Make sure `yay` is installed, otherwise replace it with any other AUR helper.

***
## Apps
### Development
+ **Editor:** NeoVIM. Really loving it. [Here you have number of reasons why you should use NeoVIM instead of VIM](https://www.youtube.com/watch?v=LRQGAnPtNdM)
+ **Terminal:** [iTerm2](https://iterm2.com/) + tmux [with my config files](https://github.com/TheMartes/dotfiles/blob/master/.tmux.conf).
+ **Database Client:** [SequelPro](https://sequelpro.com/), probably most awesome MySQL Client for mac. For redis i'm using [Medis](http://getmedis.com/)
+ **API Testing** is delivered by [Postman](https://www.getpostman.com/)
+ **Containers** are managed by [Docker](https://www.docker.com/), and [Valet](https://laravel.com/docs/5.5/valet) for localhost
+ **GIT:** CLI driven :)

### Other tools
+ For music i'm using [Spotify](https://www.spotify.com/)
+ Email client is [Spark](https://sparkmailapp.com/)
+ Browser of choice is [Google Chrome](https://www.google.com/chrome/index.html)
+ For communication i'm using [Discord](https://discordapp.com/), [Slack](https://slack.com/) & [Telegram](https://telegram.org/)
+ Note taking app of choice is [Simplenote](https://simplenote.com/)
+ [Google Keep](https://keep.google.com/) for staying organized.
+ For Office i used to use [Google Docs](docs.google.com), since it's free and awesome, but for more complex work with documents i'm using [MS Office](https://products.office.com/)
+ Speaking of documents, for markdown is best [MacDown](http://macdown.uranusjr.com/)
+ My files are safe in [Dropbox](https://www.dropbox.com/)
+ [Transmit](https://panic.com/transmit/) as my primary FTP Client
+ To be more productive on mac, i can't stand out Spotlight and Default App Switcher (Alt + Tab), So i investigated a quick research, and i'm pretty happy with [Alfred](https://www.alfredapp.com/) and [Contexts](https://contexts.co/)


