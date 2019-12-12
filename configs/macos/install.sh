#!/bin/sh

# Install packages
brew tap mongodb/brew
brew install $(cat packagelist/brewformulae.txt)
brew untap mongodb/brew
brew tap homebrew/cask-fonts
brew cask install --force $(cat packagelist/brewcask.txt)
brew untap homebrew/cask-fonts
npm -g install $(cat packagelist/npm.txt)
pip3 install $(cat packagelist/pip.txt)
