#!/bin/sh

# Install packages
brew install $(cat packagelist/brewformulae.txt)
brew tap homebrew/cask-fonts
brew install --cask --force $(cat packagelist/brewcask.txt)
npm -g install $(cat packagelist/npm.txt)
pip3 install $(cat packagelist/pip.txt)
ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
