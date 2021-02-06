export PATH="$HOME/bin:$HOME/go/bin:$PATH";

if [[ "$OSTYPE" == "linux-gnu" ]]; then 
    export PATH="$HOME/.config/composer/vendor/bin:$PATH";
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="$HOME/.composer/vendor/bin:$PATH";
    export PATH="$HOME/.cargo/bin:$PATH";
    export PATH="$HOME/bin:/usr/local/bin:$PATH";
    export NVM_DIR="$HOME/.nvm";
fi

# Prompt Init
source $HOME/.bash_prompt

# Aliases
source $HOME/.aliases.sh
