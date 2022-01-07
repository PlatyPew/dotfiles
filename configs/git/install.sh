#!/bin/sh

# Installing packages using brew
git submodule init configs/git/gitz
git submodule update --remote --recursive
brew install git-lfs gnupg pinentry-mac commitizen

mkdir -p $HOME/.gnupg
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >$HOME/.gnupg/gpg-agent.conf
