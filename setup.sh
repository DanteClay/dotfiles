#!/usr/bin/env bash


files() {
    mv "$HOME/Desktop" "$HOME/desktop"
    mv "$HOME/Documents" "$HOME/files"
    mv "$HOME/Downloads" "$HOME/downloads"
    mv "$HOME/Music"    "$HOME/music"
    mv "$HOME/Pictures" "$HOME/pictures"
    mv "$HOME/Videos"   "$HOME/videos"
    mv "$HOME/Public" "$HOME/src/public"
    mv "$HOME/Templates"  "$HOME/src/templates"
    mkdir -p "$HOME/go/bin" "$HOME/go/pkg"
    mkdir -p "$HOME/go/src/github.com/danteclay"
    mkdir -p "$HOME/code"
    cat user-dirs.dirs > ~/.config/user-dirs.dirs
}

configs(){
    git config --global user.name "Dante Clay"
    git config --global user.email "dante.clay@zoho.com"
    line="export GOPATH=$HOME/go"
    grep -q "$line" ~/.profile || echo "$line" >> ~/.profile
    mkdir -p "$HOME/.config/fish"
    ln -s $(realpath fish/config.fish) ~/.config/fish/config.fish
}

files
configs