#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# sudo check funciton
sudocheck () {
  if [[ $EUID -ne 0 ]]; then
      echo "Must execute as sudo."
      exit 1
  fi
}
# ssh check function
check-ssh() {
    if [[ ! -f /home/"$(whoami)"/.ssh/id_rsa ]]; then
        echo "Kindly upload your private key and restart the process."
        exit 1
    else
    eval "$(ssh-agent -s)"
    ssh-add /home/"$(whoami)"/.ssh/id_rsa
    fi
}

# clone function
clone() {
    if [[ ! -d "/home/$(whoami)/scripts" ]]; then
    git clone --quiet git@github.com:bakhtiardurrani/scripts.git ~/scripts
    sudo chown -cR 1000:1000 ~/scripts/ 1>/dev/null 2>&1
    sudo chmod -cR 755 ~/scripts/ >> /dev/null 1>/dev/null 2>&1
    else
    git -C "/home/$(whoami)/scripts" pull
    git -C "/home/$(whoami)/scripts" fetch --all --prune
    git -C "/home/$(whoami)/scripts" reset --hard origin/master
    git -C "/home/$(whoami)/scripts" pull
    sudo bash /home/"$(whoami)"/scripts/after-install.sh
    fi
}
check-ssh
clone