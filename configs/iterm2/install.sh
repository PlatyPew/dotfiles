#!/bin/sh

# Install packages
brew tap homebrew/cask-fonts
brew cask install iterm2 homebrew/cask-fonts/font-inconsolata-nerd-font
brew untap homebrew/cask-fonts
