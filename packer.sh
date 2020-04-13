#!/bin/bash
set -eu
version=1.5.5
curl -SL https://releases.hashicorp.com/packer/${version}/packer_${version}_linux_amd64.zip -o packer_${version}_linux_amd64.zip
unzip packer_${version}_linux_amd64.zip
sudo mv packer /usr/bin/packer
