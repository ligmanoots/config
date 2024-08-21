if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PS1 '[\u@\h \W]\$ '
set -gx EDITOR /usr/bin/nvim
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.local/bin/"
export npm_config_prefix="$HOME/.local"

set fish_greeting


#Arch Linux OMF Plugin
function pacin -d "Install specific package(s) from the repositories"
  doas pacman -S $argv
end

function pacsync -d "Force refresh of all package lists after updating /etc/pacman.d/mirrorlist"
  doas pacman -Syy $argv
end

function pacre -d "Remove the specified package(s), retaining its configuration(s) and required dependencies"
  doas pacman -R $argv
end

function pacrem -d "Remove the specified package(s), its configuration(s) and unneeded dependencies"
  doas pacman -Rns $argv
end

function pacupg -d "Synchronize with repositories before upgrading packages that are out of date on the local system."
  doas pacman -Syu $argv
end

function pacfind -d "Search for the specified package(s) and its dependencies"
  pacman -Qi $argv
end

function yayin -d "Install specific package(s) form the AUR repositories"
  yay -S $argv
end

function yayre -d "Remove the specified AUR package(s), retaining its configuration(s) and required dependencies"
  yay -R $argv
end

function yayrem -d "Remove the specified package(s), its configuration(s) and unneeded dependencies"
  yay -Rns $argv
end

function pacser -d "Fuzzy search through all available packages, with package info shown in a preview window, and then install selected packages"
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro doas pacman -S
end

function pacsrem -d "List all your installed packages, and then remove selected packages"
    pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro doas pacman -Rns
end


#Bang Bang OMF Plugin
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

#distrobox
function fish_command_not_found
    # "In a container" check
    if test -e /run/.containerenv -o -e /.dockerenv
        distrobox-host-exec $argv
    else
        __fish_default_command_not_found_handler $argv
    end
end

#fish fzf key bindings    
function fish_user_key_bindings
	fzf_key_bindings
end

bind ! __history_previous_command
bind '$' __history_previous_command_arguments

#Unimatrix Functions
function matrix
    unimatrix -a -l m
end


function pfetch_if_installed
    if which pfetch > /dev/null
        pfetch
    else
        echo "pfetch is not installed on this system"
    end
end

alias ls="lsd"
function "ls -a" 
    lsd -a
end

alias n="nvim"

alias kubectl="minikube kubectl --"
kubectl completion fish | source

cat ~/.cache/wal/sequences &


# THEME Starship #
starship init fish | source

nitch
#pfetch_if_installed
