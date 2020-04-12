#!/usr/bin/env bash
# maintainer <sivakumarvunnam1@gmail.com>
version=7.0.3-fa31da744b51
SPLUNK_HOME=/opt/splunk
mkdir -p $SPLUNK_HOME
useradd -m splunk && groupadd -g 10000 splunk
sudo usermod -a -G splunk splunk
chown -R splunk:splunk $SPLUNK_HOME

echo "What version-build of splunk should we install? default($version):"
read u_version
echo "What should we make the splunk admin password?":
read password

wget https://download.splunk.com/products/splunk/releases/7.0.3/splunk/linux/splunk-${version}-Linux-x86_64.tgz -O /opt/splunk-${version}-Linux-x86_64.tgz

tar -xzvf /opt/splunk-${version}-Linux-x86_64.tgz  --directory=$SPLUNK_HOME --strip-components=1

#add splunk to profile.d
echo "PATH=\$PATH:$SPLUNK_HOME/bin" > /etc/profile.d/splunk.sh
echo "SPLUNK_HOME=$SPLUNK_HOME" >> /etc/profile.d/splunk.sh
#source splunk.sh
source /etc/profile.d/splunk.sh

#start splunk
splunk start --accept-license --answer-yes --auto-ports --no-prompt
splunk edit user admin -password $password -auth admin:changeme
#enable splunk at boot-start
splunk enable boot-start -user splunk

