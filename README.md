# MacOS setup using Ansible

This repository contains an Ansible configuration to set up a new Mac from scratch. This is an opinionated setup, and is based on what I use. Therefore, PRs for this repo will not be accepted unless they fix a bug in the scripts. If you are interested in customizing the installation, please make a fork of this repository.

## How to use

The `bootstrap.sh` scrips installs the prerequisites and then starts Ansible. You do not need to download this script but can run it directly after downloading it via:
```shell
curl -s "https://raw.githubusercontent.com/josefeg/new-mac-setup/master/bootstrap.sh" | bash
```