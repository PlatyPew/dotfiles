#!/bin/sh

# Installing packages
brew install autojump bat exa fzf zsh npm python3 gawk gnu-sed ripgrep

# Install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/b4b4r07/zsh-vimode-visual.git ~/.oh-my-zsh/custom/plugins/zsh-vimode-visual

# Install zsh themes
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Install other stuff
python3 -m pip install virtualenv
npm install -g speed-test
