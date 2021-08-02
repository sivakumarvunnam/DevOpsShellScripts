#!/usr/bin/env bash
set +u
# executed as root
# update repo list
sudo yum update -y && yum install -y curl wget
# function to install nvm
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
# function to install corretto-8
function corretto-8() {
  if ! [ -x "$(command -v java)" ]; then
    echo "Installing Java..."
    sudo amazon-linux-extras enable corretto8 && sudo yum install -y java-1.8.0-amazon-corretto
    sudo alternatives --config java && sudo alternatives --config javac
    echo "Java version : $(java -version)"
  fi
}
nvm
corretto-8
