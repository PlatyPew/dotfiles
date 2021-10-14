# Installs packages
brew install npm python3 universal-ctags neovim yapf
python3 -m pip install neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Installs Vim-plug

BASE_PATH="configs/neovim"
sed '/call plug#end/q' $BASE_PATH/init.vim > $BASE_PATH/tmp.vim
nvim -u $BASE_PATH/tmp.vim --headless +PlugInstall +qall
rm $BASE_PATH/tmp.vim
