#!/bin/sh

# Install packages
brew tap beeftornado/rmtree
brew install $(cat packagelist/brewformulae.txt)
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew cask install --force $(cat packagelist/brewcask.txt)
brew untap homebrew/cask-fonts
brew untap homebrew/cask-versions
npm -g install $(cat packagelist/npm.txt)
pip3 install $(cat packagelist/pip.txt)

# Patch gimp to photogimp
curl -L "https://github.com/Diolinux/PhotoGIMP/releases/download/1.0/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip" -o ~/Downloads/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip && unzip ~/Downloads/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip -d ~/Downloads && sudo cp -R ~/Downloads/PhotoGIMP\ by\ Diolinux\ v2020\ for\ Flatpak/.var/app/org.gimp.GIMP/config/GIMP/2.10/ ~/Library/Application\ Support/GIMP/2.10 && rm -r ~/Downloads/PhotoGIMP.by.Diolinux.v2020.for.Flatpak*
