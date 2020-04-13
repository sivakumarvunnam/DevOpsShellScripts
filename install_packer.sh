#!/bin/bash
set -eu
packer_version=${packer_version:-1.5.5}
curl -SL https://releases.hashicorp.com/packer/${packer_version}/packer_${packer_version}_linux_amd64.zip -o packer_${packer_version}_linux_amd64.zip
unzip packer_${packer_version}_linux_amd64.zip
sudo mv packer /usr/bin/packer
echo "packer version is : $(packer version)"
