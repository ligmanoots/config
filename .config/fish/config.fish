if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR /usr/bin/nvim

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.scripts"

set fish_greeting


#Arch Linux OMF Plugin
function pacin -d "Install specific package(s) from the repositories"
  sudo pacman -S $argv
end

function pacmir -d "Force refresh of all package lists after updating /etc/pacman.d/mirrorlist"
  sudo pacman -Syy $argv
end

function pacre -d "Remove the specified package(s), retaining its configuration(s) and required dependencies"
  sudo pacman -R $argv
end

function pacrem -d "Remove the specified package(s), its configuration(s) and unneeded dependencies"
  sudo pacman -Rns $argv
end

function pacupg -d "Synchronize with repositories before upgrading packages that are out of date on the local system."
  sudo pacman -Syu $argv
end

function pacser -d "Search for the specified package(s) and its dependencies"
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

bind ! __history_previous_command
bind '$' __history_previous_command_arguments

#Unimatrix Functions
function matrix
    unimatrix -a -l m
end

alias n="nvim"

cat ~/.cache/wal/sequences &


# THEME PURE #
set fish_function_path /home/daryush/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/daryush/.config/fish/functions/theme-pure/conf.d/pure.fish

pfetch
