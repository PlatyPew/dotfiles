# Installs packages
brew install npm python3 ctags-exuberant neovim
python3 -m pip install neovim flake8
npm install -g tern livedown eslint eslint-config-google esctags

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Installs Vim-plug

nvim -u <(sed '/call plug#end/q' init.vim) '+PlugInstall | qall'
