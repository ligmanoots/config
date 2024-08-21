#
# ~/.bashrc
#


export LIBVIRT_DEFAULT_URI="qemu:///system"
export WINIT_X11_SCALE_FACTOR=1.00 alacritty

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export VISUAL=nvim

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi

eval "$(starship init bash)"

if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
	exec fish
fi

alias ls="lsd -la"

alias n="nvim"





# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
