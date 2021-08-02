#!/usr/bin/env bash
set +u
# executed as root
# update repo list
sudo yum update -y && yum install -y curl wget
function nvm() {
  if ! [ -x "$(command -v nvm)" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    source ~/.bashrc && source ~/.bash_profile
    echo "nvm version : $(nvm -v)"
    nvm install node # Install's latest LTS node version
    # nvm install 12.19.0 #Install's specific version of node
    echo "node version : $(node -v) && npm version : $(npm -v)"
  fi
}
nvm
