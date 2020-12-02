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
    sudo rm -rf ~/PMUSED
    git clone --quiet git@github.com:bakhtiardurrani/scripts.git ~/PMUSED
    sudo chown -cR $(whoami):$(whoami) ~/PMUSED/ 1>/dev/null 2>&1
    sudo chmod -cR 755 ~/PMUSED/ >> /dev/null 1>/dev/null 2>&1
}
# Sudo check depricated due to ssh access 
clone