# MacOS setup using Ansible

This repository contains an Ansible configuration to set up a new Mac from scratch. This is an opinionated setup, and is based on what I use. Therefore, PRs for this repo will not be accepted unless they fix a bug in the scripts. If you are interested in customizing the installation, please make a fork of this repository.

## How to use

The `bootstrap.sh` script installs the prerequisites and then starts Ansible. Before you run this script, you need to give the Terminal app Full Disk Access permission. To do that, open System Settings, and go to Privacy & Security. Find the Full Disk Access permission in the list and click on it. Find Terminal in the list of apps, and enable the permissions via the switch on the right. If Terminal is not in the list, you can add it via the plus sign at the bottom.

Once you have configured the required permissions, open Terminal app so that you can run the included `bootstrap.sh` script. You do not need to clone the repository in order to run the script, but you can download it and run it directly via.

```shell
curl -s "https://raw.githubusercontent.com/josefeg/new-mac-setup/master/bootstrap.sh" | bash
```
