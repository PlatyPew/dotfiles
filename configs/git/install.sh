#!/bin/sh

# Installing packages using brew
git submodule init configs/git/gitz
git submodule update --remote --recursive
brew install git-lfs gnupg pinentry-mac commitizen
