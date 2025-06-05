#! /bin/bash

echo "installing all the formulae"
while IFS='' read -r leaf; do
    brew install "$leaf"
done < brew-leaves.txt

echo "installing all the casks"
while IFS='' read -r cask; do
    brew install "$cask" --cask
done < brew-cask.txt
