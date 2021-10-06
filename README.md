# config
config for neovim and other stuff


Steps
1. sudo apt install neovim
2. mkdir ~/.config/nvim
3. touch ~/.config/nvim/init.vim
4. curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
5. mkdir ~/.config/nvim/vim-plug
6. touch ~/.config/nvim/vim-plug/plugins.vim
7.  auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
call plug#end()

8. source $HOME/.config/nvim/vim-plug/plugins.vim


