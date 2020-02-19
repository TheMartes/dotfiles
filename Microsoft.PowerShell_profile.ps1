Import-Module posh-git
Import-Module oh-my-posh

# Set theme
Set-Theme RobbyRussell

# Create Alias Functions
function clearShortcut {
    clear
}

function NeoVimShortcut {
    nvim $*
}

function ReloadProfile {
    & $profile
}

function GitStatus {
    git status
}

function GitNah {
    git reset --hard
    git clean -df
}

Set-Alias c clearShortcut
Set-Alias v NeoVimShortcut
Set-Alias profile_reload ReloadProfile
Set-Alias gs GitStatus
Set-Alias nah GitNah
