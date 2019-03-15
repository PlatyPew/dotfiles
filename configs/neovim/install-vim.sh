dir=$(echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")") # Finds the current absolute path of file

echo Installing plugin manager for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Installs Vim-plug

# Temporary init.vim to prevent vim from complaining that space-vim-dark does not exist
mkdir -p ~/.config/nvim

mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak 2> /dev/null

python3 -m pip install neovim

nvim -u <(sed '/call plug#end/q' ${dir}init.vim) ':PlugInstall' -c ':qall'

ln -s ${dir}init.vim ~/.config/nvim/init.vim
