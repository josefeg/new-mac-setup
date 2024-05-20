#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

xcode-select --install
echo -n "Installing command line tools"
until eval "xcode-select --print-path &> /dev/null"; do
  sleep 5;
  echo -n "."
done
echo

TEMP_DIR=$(mktemp -d)

curl https://bootstrap.pypa.io/get-pip.py -o "$TEMP_DIR/get-pip.py"
python3 "$TEMP_DIR/get-pip.py"

sudo pip3 install ansible

git clone https://github.com/josefeg/new-mac-setup.git "$TEMP_DIR/new-mac-setup"

ansible-galaxy install -r "$TEMP_DIR/new-mac-setup/ansible_requirements.yaml"

ansible-playbook -i "localhost," -c local "$TEMP_DIR/new-mac-setup/ansible_playbook.yaml" --ask-become-pass

export HOMEBREW_BIN_PATH=/opt/homebrew/bin
export PATH=$PATH:$HOMEBREW_BIN_PATH

BW_SESSION=$(bw login --raw)
export BW_SESSION

bw sync
bw get notes gpg-key | gpg --import

chezmoi init https://github.com/josefeg/dotfiles.git
chezmoi apply --force

bw logout

rm -rf "$TEMP_DIR"
