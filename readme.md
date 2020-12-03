# Collection of clone.sh scripts for different private repos

- These `clone-scripts` use *SSH key based authorization* to access private github repos.

- **You'll need to add your SSH key to the ssh-agent**

### Start the ssh-agent in the background
`eval $(ssh-agent -s)`

### Add SSH key to agent, this presumes your ssh private key is in the `home` directory and named `id-rsa`
`ssh-add ~/.ssh/id_rsa`
