#!/bin/sh

# Install packages
brew tap beeftornado/rmtree
brew install $(cat packagelist/brewformulae.txt)
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew install --cask --force $(cat packagelist/brewcask.txt)
brew untap homebrew/cask-fonts
brew untap homebrew/cask-versions
npm -g install $(cat packagelist/npm.txt)
pip3 install $(cat packagelist/pip.txt)
