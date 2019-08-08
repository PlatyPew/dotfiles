#!/bin/sh

# Install packages
brew install $(cat packagelist/brewformulae.txt)
brew cask install $(cat packagelist/brewcask.txt)
npm -g install $(cat packagelist/npm.txt)
pip3 install $(cat packagelist/pip.txt)
