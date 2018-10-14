#!/bin/bash
echo "This installation script overwrites all your current settings

Requirements:
brew

You have 3 seconds before the installation script starts

Starting in..."

for i in {3..1}; do
	echo $i
	sleep 1
done

dir=$(echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")")

echo Installing all necessary programs
brew install gpg2 neovim pinentry-mac tmux python3
brew cask install font-inconsolata-nerd-font iterm2

echo Installing plugins for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Installs Vim-plug

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
call plug#end()" > ~/.config/nvim/init.vim

python3 -m pip install neovim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

cp ${dir}neovim/init.vim ~/.config/nvim/.

echo "Removing login message from terminal"
cp ${dir}osx/.hushlogin ~

echo "Installing vim profile"
mkdir -p ~/.vim/colors
cp ~/.config/nvim/plugged/space-vim-dark/colors/space-vim-dark.vim ~/.vim/colors/.
cp ${dir}/vim/.vimrc ~

echo "Installing Tmux"
mkdir -p ~/.tmux
cp ${dir}tmux/get* ~/.tmux/.
cp ${dir}tmux/.tmux.conf ~

echo "Install git"
cp ${dir}git/.gitconfig ~

echo "Install iTerm2:
Preferences -> General -> Load preferences from a custom folder or URL -> Browse
Import iterm2/com.googlecode.iterm2.plist

Image Used: https://www.pixiv.net/member_illust.php?mode=medium&illust_id=39759178"

echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

cp ${dir}zsh/.zshrc ~
