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

