#!/bin/bash
function sudocheck () {
  if [[ $EUID -ne 0 ]]; then
    tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  You Must Execute as a SUDO USER (with sudo) or as ROOT!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
    exit 0
  fi
}

function clone() {
    sudo rm -rf ~/scripts
    git clone --quiet git@github.com:bakhtiardurrani/scripts.git ~/scripts
    sudo chown -cR 1000:1000 ~/scripts/ 1>/dev/null 2>&1
    sudo chmod -cR 755 ~/scripts/ >> /dev/null 1>/dev/null 2>&1
    if [[ ! -d "/home/$(whoami)/scripts" ]]; then
        echo "scripts directory not available you don't have github ssh access!"
        exit 1
    else
    sudo bash ~/scripts/after-install.sh
    fi
}
# Sudo check depricated due to ssh access
clone