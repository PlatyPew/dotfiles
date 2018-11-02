dir=$(echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")") # Finds the current absolute path of file

echo Installing plugin manager for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Installs Vim-plug

# Temporary init.vim to prevent vim from complaining that space-vim-dark does not exist
mkdir -p ~/.config/nvim
cat << EOF > ~/.config/nvim/init.vim
call plug#begin()
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
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/LargeFile'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
call plug#end() 
EOF

python3 -m pip install neovim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall' # Installs neovim plugins

mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak 2> /dev/null
ln -s ${dir}init.vim ~/.config/nvim/init.vim
