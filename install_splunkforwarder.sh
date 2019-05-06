#!/usr/bin/env bash
# maintainer <sivakumarvunnam1@gmail.com>
version=6.5.1-f74036626f0c
SPLUNKFORWARDER_HOME=/opt/splunkforwarder
mkdir -p $SPLUNKFORWARDER_HOME
chown -R root:root $SPLUNKFORWARDER_HOME

echo "What version-build of splunk should we install? default($version):"
read u_version
echo "What should we make the splunk admin password?":
read password

wget https://download.splunk.com/products/universalforwarder/releases/6.5.1/linux/splunkforwarder-${version}-Linux-x86_64.tgz -O /opt/splunkforwarder-${version}-Linux-x86_64.tgz
tar -xzvf /opt/splunkforwarder-${version}-Linux-x86_64.tgz  --directory=$SPLUNKFORWARDER_HOME --strip-components=1

#add splunk to profile.d
echo "PATH=\$PATH:$SPLUNKFORWARDER_HOME/bin" > /etc/profile.d/splunkforwarder.sh
echo "SPLUNK_HOME=$SPLUNKFORWARDER_HOME" >> /etc/profile.d/splunkforwarder.sh
#source splunk.sh
source /etc/profile.d/splunkforwarder.sh

#start splunk
splunk start --accept-license --answer-yes --auto-ports --no-prompt

cat <<EOT>> /opt/splunkforwarder/etc/system/local/deploymentclient.conf
[deployment-client]
clientName = $HOSTNAME
[target-broker:deploymentServer]
targetUri = splunkserver.local:8089
EOT
chown root:root /opt/splunkforwarder/etc/system/local/deploymentclient.conf
chmod 644 /opt/splunkforwarder/etc/system/local/deploymentclient.conf
# Starting Splunk Service
service splunk start
# Change Admin Password on the UF
splunk edit user admin -password $password -auth admin:changeme
#enable splunk at boot-start
splunk enable boot-start -user root

