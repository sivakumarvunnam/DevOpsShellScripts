#!/bin/bash
set -eu
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /opt
sudo mv /opt/eksctl /usr/bin/
echo "eksctl version is : $(eksctl version)"
