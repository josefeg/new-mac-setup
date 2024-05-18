#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

mkdir temp

xcode-select --install
echo -n "Installing command line tools"
until $(xcode-select --print-path &> /dev/null); do
  sleep 5;
  echo -n "."
done
echo

curl https://bootstrap.pypa.io/get-pip.py -o ./temp/get-pip.py
python3 ./temp/get-pip.py

sudo pip3 install ansible

git clone https://github.com/josefeg/new-mac-setup.git ./temp/new-mac-setup

ansible-galaxy install -r ./temp/new-mac-setup/ansible_requirements.yaml

ansible-playbook -i "localhost," -c local ./temp/new-mac-setup/ansible_playbook.yaml --ask-become-pass

export HOMEBREW_BIN_PATH=/opt/homebrew/bin
export PATH=$PATH:$HOMEBREW_BIN_PATH

export BW_SESSION=$(bw login --raw)

chezmoi init https://github.com/josefeg/dotfiles.git
chezmoi apply --force

bw logout
