<div align="center">
    <img width="200" height="200" src="images/logo_circle.png"/>
    <br/>
    <br/>
    ![Pipeline](https://gitlab.com/PlatyPew/dotfiles/badges/master/pipeline.svg)
    <br/>
    ![License](https://img.shields.io/badge/license-MIT-green.svg)
    ![MacOS](https://img.shields.io/badge/macOS-10.15.3-blue.svg)
    <br/>
    <h1>Platy's MacOS Dotfiles</h1>
    <p>These dotfiles are used to transform a vanilla system, into one that is loaded with all the tools a developer could possibly have. Everything can be installed with a couple of commands away.</p>
    <img width="800" height="500" src="images/money_shot.png"/>
    <br/>
</div>

## Contents 
1. [Installation](#installation)
2. [Usage](#usage)

<br/>
<div align="center">
    <h1>Installation</h1>
</div>

**"One-click" install**
```
git clone https://gitlab.com/PlatyPew/dotfiles.git --recursive ~/dotfiles && \
    cd ~/dotfiles && ./install-all
```

**To install specific configuration, use `./install-standalone` instead, followed by the type of configuration**
```
./install-standalone git
./install-standalone iterm2
./install-standalone macos
./install-standalone neovim
./install-standalone tmux
./install-standalone zsh
```

_You might need to install Xcode Command Line Tools if you're running git on MacOS for the very first time_

_You may also be prompted to enter in the administrator password during installation_

<br/>
<div align="center">
    <h1>Usage</h1>
</div>

## Documentation
Documentation is available in the repository's [wiki](https://gitlab.com/PlatyPew/dotfiles/-/wikis/home)
- [Git](https://gitlab.com/PlatyPew/dotfiles/-/wikis/Configurations/Git)
- [iTerm2](https://gitlab.com/PlatyPew/dotfiles/-/wikis/Configurations/Iterm2)
- [MacOS](https://gitlab.com/PlatyPew/dotfiles/-/wikis/Configurations/MacOS)
- [Neovim](https://gitlab.com/PlatyPew/dotfiles/-/wikis/Configurations/Neovim)
- [Tmux](https://gitlab.com/PlatyPew/dotfiles/-/wikis/Configurations/Tmux)
- [Zsh](https://gitlab.com/PlatyPew/dotfiles/-/wikis/Configurations/Zsh)

## Features
This section will showcase the basic features.
The wiki has a more comprehensive list of all the features available

### Git Aliases
You can list all the aliases used by git
<br>
<img src="images/git-alias.gif" height="208" width="454"/>

```
$ git aliases
```
