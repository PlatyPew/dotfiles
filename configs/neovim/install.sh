# Installs packages
brew install npm python3 universal-ctags neovim yapf
python3 -m pip install neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Installs Vim-plug

BASE_PATH="configs/neovim"
sed '/call plug#end/q' $BASE_PATH/init.vim > $BASE_PATH/tmp.vim
nvim -u $BASE_PATH/tmp.vim --headless +PlugInstall +qall
rm $BASE_PATH/tmp.vim

COQ_PATH="$HOME/.config/nvim/plugged/coq_nvim/.vars"
TABNINE_VERSION=$(curl -fsSL https://update.tabnine.com/bundles/version)

mkdir -p $COQ_PATH/$TABNINE_VERSION/t9
mkdir -p $COQ_PATH/clients/t9

TARGET=$(uname -m)
if [[ ${TARGET} == "arm64" ]]; then
    TARGET="aarch64"
fi

curl -sS https://update.tabnine.com/bundles/$TABNINE_VERSION/$TARGET-apple-darwin/TabNine.zip > $BASE_PATH/TabNine.zip
unzip -d $COQ_PATH/$TABNINE_VERSION/t9 $BASE_PATH/TabNine.zip
chmod +x $COQ_PATH/$TABNINE_VERSION/t9/*
cp $COQ_PATH/$TABNINE_VERSION/t9/TabNine $COQ_PATH/clients/t9/

rm $BASE_PATH/TabNine.zip
