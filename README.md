<h1 align="center">~/.dotfiles</h1>

***
<span align="center">Manjaro Settings. Put it in `$HOME/.dotfiles`. Managed by Stow.</span>
***

## Dependencies
- Stow > 2.3.0
- git
- zsh
- oh-my-zsh
- wget
- curl
- wl-clipboard / pbcopy
- golang / go
- vim
- neovim

## Before you install
Make sure you have oh-my-zsh installed and running as this script heavily depends on oh-my-zsh 
framework and `.zshrc` needs to be present in home folder. During the setup process `.zshrc`
will be renamed to `.zshrc.old` which will serve as backup in case something goes horibly wrong.  

## Installation
+ Clone Repo
+ Make sure all the dependencies are installed
+ Run `./setup`
+ Enjoy

## Post installation
- There's a safe file for exported api keys in shell `touch $HOME/.shell_secrets.sh && chmod +x $HOME/.shell_secrets.sh`
- Install [`fnm`](https://github.com/Schniz/fnm) - then use command `fnm use 22`
- Install [`rust-up`](https://rustup.rs/)
- Neovim needs `fnm` and `rust` to install packages and language servers
- Additionally install `docker`, [`lazydocker`](https://github.com/jesseduffield/lazydocker)

## Handcrafted tools
### TM - Tmux Sessionizer (this one is actually stolen from nick nisi)
Tmux Sessionizer could be found in `bin/bin/tm`, upon running the script it will show you options to either
create new tmux sessions or open existing. You can name them however you want and they do persist through PC restarts.
 `tm` is there just to simplify work with tmux as command to hook up existing sessions and get their names could 
be quite exhausting if you're doing it every couple of hours

### Pogmit - Git Commit Generator
`pogmit` simplifies process of creating conventional commits. In our work we have to include issue number in the commit and also scope, type + message,
it's a lot of typing and copy pasting, so this is there just to make it more quicker

## Hardware
- [HHKB](https://hhkeyboard.us/hhkb/pro-classic/white-stamped?srsltid=AfmBOor98X0ekDJ6733BKSGDynDelnOfb6R1LgVEjocxUmltiO3QFTDd)
- [Pulsar X3](https://www.pulsar.gg/collections/x3-series/products/x3-rhd-gaming-mouse?variant=45985355694334)
- [Nothing Headphone (1)](https://nothing.tech/products/headphone-1?Colour=White)

## Software
- [VSCode](https://code.visualstudio.com/)
- [Konsole](https://apps.kde.org/en-gb/konsole/)
- [1password](https://1password.com/)
- [TablePlus](https://tableplus.com/)
- [Font](https://www.jetbrains.com/lp/mono/)

### Plasma settings
- [theme](https://aur.archlinux.org/packages/plasma6-themes-vapor-steamos)
- [sddm](https://github.com/JiayuanWen/holoiso-sddm-steamos-theme)

### Linux specific settings
#### Connect to BT devices on startup
Bluetooth doesn't connect to trusted devices on the startup. So [this script](https://github.com/TheMartes/dotfiles/tree/master/configs/.config/autostart/bluetooth-autoconnect.desktop) fixes it. Package [`bluetooth-autoconnect`](https://aur.archlinux.org/packages/bluetooth-autoconnect) is required. 

#### Xbox Controller doesn't work via bluetooth.
So first things first. Reboot to windows or use VM to boot windows. With the same bluetooth adapter connect to windows computer so the adapter can exchange pairing keys with the controller. Next update firmware via Xbox Services. Then boot next back to linux, and pair the device. You will need `xpadneo-dkms` from your package manager and also `linux-kernel-headers` and `bluez` and `bluez-utils`. Reboot your computer and it should pair & connect automagically.

#### Nvidia doesn't resume monitors after wake up from sleep/hibernate
Driver 575-XX from nvidia works fine. 570 is stil bugged. Use with Kernel 6.12

#### Elgato Wave:3 doesn't work
Plug into USB directly. This Microphone uses shit amount of power it overwhelmes the USB Hub. Also set input to mono in Plasma Settings. Otherwise it thinks it's a headphones.
