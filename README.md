# Dotfiles
Basic terminal configurations for OSX. [Screenshots](#Screenshots)

## Iterm 2
Install profile: `Preferences` -> `General` -> `Load preferences from a custom folder or URL` -> `Browse`

## Neovim
Install [Vim-Plug](https://github.com/junegunn/vim-plug) to use. Copy file `init.vim` into `~/.config/nvim`

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## OSX
Put `.hushlogin` into home directory to remove last login message

## Vim
Copy file `.vimrc` into `~`

## ZSH
Download the z-shell (can be found on Homebrew)

Download [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Download powerline fonts (can be found on Homebrew)

Install [powerlevel9k](https://github.com/bhilburn/powerlevel9k)

Copy `.zshrc` into `~`

# Screenshots

## ZSH

### Neofetch
![neofetch](screenshots/screenshot1.png)

### VCS (Git)
![vcs](screenshots/screenshot2.png)

### Virtual Environment (virtualenv)
![virtualenv](screenshots/screenshot3.png)

## Neovim

### Normal
![neovim](screenshots/screenshot4.png)

### NERDTree
![nerdtree](screenshots/screenshot5.png)

### Transparent Mode
![transparent](screenshots/screenshot6.png)

### Goyo
![goyo](screenshots/screenshot7.png)

### Rainbow and Limelight
![rainbow_limelight](screenshots/screenshot8.png)
