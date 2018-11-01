#!/bin/bash
echo "This installation script overwrites all your current settings

You have 3 seconds before the installation script starts

Starting in..."

for i in {3..1}; do
    echo $i
    sleep 1
done

dir=$(echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")") # Finds the current absolute path of file

echo Installing Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # Installs Homebrew

echo Installing all necessary programs
brew install gpg2 neovim pinentry-mac tmux python3
brew cask install homebrew/cask-fonts/font-inconsolata-nerd-font iterm2 # Installs font and iTerm for powerline

echo Installing plugins for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Installs Vim-plug

# Temporary init.vim to prevent vim from complaining that space-vim-dark does not exist
mkdir -p ~/.config/nvim
echo "call plug#begin()
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/LargeFile'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
call plug#end()" > ~/.config/nvim/init.vim

python3 -m pip install neovim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall' # Installs neovim plugins

ln -s ${dir}neovim/init.vim ~/.config/nvim/init.vim

echo "Removing login message from terminal"
ln -s ${dir}osx/hushlogin ~/.hushlogin

echo "Installing vim profile"
mkdir -p ~/.vim/colors
cp ~/.config/nvim/plugged/space-vim-dark/colors/space-vim-dark.vim ~/.vim/colors/space-vim-dark.vim
ln -s ${dir}vim/vimrc ~/.vimrc

echo "Installing Tmux"
mkdir -p ~/.tmux
ln -s ${dir}tmux/getPublicIP ~/.tmux/getPublicIP
ln -s ${dir}tmux/getLocalIP ~/.tmux/getLocalIP
ln -s ${dir}tmux/tmux.conf ~/.tmux.conf

echo "Install git"
cp ${dir}git/.gitconfig ~

echo "Installing iTerm2:"
cp ${dir}iterm2/iterm_bg.png ~/Pictures/iterm_bg.png

echo "Installing oh my zsh"
sh -c "$(sed -e '111d' <(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh))"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

ln -s ${dir}zsh/zshrc ~/.zshrc

echo "Installation Done! Opening iTerm2"
open -a iTerm
