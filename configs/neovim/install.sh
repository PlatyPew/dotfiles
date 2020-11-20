# Installs packages
brew install npm python3 ctags-exuberant
brew install --HEAD neovim
python3 -m pip install neovim flake8
npm install -g tern livedown eslint eslint-config-google esctags

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Installs Vim-plug

BASE_PATH="configs/neovim"
sed '/call plug#end/q' $BASE_PATH/init.vim > $BASE_PATH/tmp.vim
nvim -u $BASE_PATH/tmp.vim -c ':PlugInstall' -c ':qall'
rm $BASE_PATH/tmp.vim
