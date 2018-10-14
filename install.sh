#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

sudo apt-get update
echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET

packagelist=(
    git
    libnss3-tools
    jq
    xsel
    php
    php-cli
    php-common
    php-curl
    php-json
    php-opcache
    php-readline
    php-xml
    php-zip
    mysql-server
    python3
    mysql-workbench
)

snappackagelist=(
    spotify
    discord
    redis-desktop-manager
    gitkraken
    chromium
    postman
)

snapclassicpackagelist=(
    go
    slack
)

# Clone dotfiles
git clone https://github.com/TheMartes/dotfiles .files

# Install Packages
sudo apt-get install --ignore-missing -y ${packagelist[@]}

# Install snap packages
sudo snap install ${snappackagelist[@]}

# Install Snap package with --classic argument
sudo snap install --classic ${snapclassicpackagelist[@]}

echo -e $TEXT_YELLOW
echo 'Package installation finished...'
echo -e $TEXT_RESET

mkdir $HOME/.fonts
mkdir $HOME/.themes
mkdir $HOME/.icons

# Setup tmux config
sudo apt install -y tmux
rm $HOME/.tmux.conf
ln -s $HOME/.files/.tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf

echo -e $TEXT_YELLOW
echo 'Tmux Installed'
echo -e $TEXT_RESET

# Setup neoVIM
sudo apt install -y neovim
git submodule update --init --recursive
rm -rf $HOME/.config/nvim
ln -s $HOME/.files/nvim/ $HOME/.config/nvim

echo -e $TEXT_YELLOW
echo 'Neovim ready'
echo -e $TEXT_RESET

# Patch vimproc plugin
sudo apt -y install gcc && make
cd $HOME/.files/nvim/bundle/vimproc.vim && make
cd

echo -e $TEXT_YELLOW
echo 'Vimproc finished'
echo -e $TEXT_RESET

# Symlink aliases.sh
ln -s $HOME/.files/.aliases.sh $HOME/.aliases.sh

echo -e $TEXT_YELLOW
echo 'Aliases initialized'
echo -e $TEXT_RESET

# Install Docker
sudo apt -y remove docker docker-engine docker.io
sudo apt -y install apt-transport-https \
        	ca-certificates \
            curl \
            software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      					$(lsb_release -cs) \
         				stable"
sudo apt update
sudo apt -y install docker-ce

echo -e $TEXT_YELLOW
echo 'Docker is ready'
echo -e $TEXT_RESET

# Install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified';  } else { echo 'Installer corrupt'; unlink('composer-setup.php');  } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

echo -e $TEXT_YELLOW
echo 'Composer installation finished.'
echo -e $TEXT_RESET

# Install Laravel Valet for localhost
composer global require cpriego/valet-linux
valet install
mkdir $HOME/Code
valet park $HOME/Code
valet start

echo -e $TEXT_YELLOW
echo 'Serving localhost'
echo -e $TEXT_RESET

# Install laravel
composer global require "laravel/installer"

echo -e $TEXT_YELLOW
echo 'Laravel installation is now globally available'
echo -e $TEXT_RESET

# Install NodeJS & Dependencies
sudo apt install -y nodejs && npm

echo -e $TEXT_YELLOW
echo 'NodeJS and NPM are here for you'
echo -e $TEXT_RESET

# Setup Oh My Z-Shell
sudo apt install -y zsh curl wget
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed '/\s*env\s\s*zsh\s*/d')"
rm $HOME/.zshrc
ln -s $HOME/.files/.zshrc-linux $HOME/.zshrc

echo -e $TEXT_YELLOW
echo 'ZSH is up and running'
echo -e $TEXT_RESET

echo '########################################################'
echo '########################################################'
echo '####                                                ####'
echo '####    ALL PACKAGES WERE SUCCESSFULLY INSTALLED    ####'
echo '####                                                ####'
echo '########################################################'
echo '########################################################'
