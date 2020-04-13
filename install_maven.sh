#!/bin/sh
set -e

# script to install maven
mvn_version=${mvn_version:-3.6.3}
url="http://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz"
install_dir="/opt/maven"

if [ -d ${install_dir} ]; then
    mv ${install_dir} ${install_dir}.$(date +"%Y%m%d")
fi

mkdir ${install_dir}
echo 'Installing maven...'
curl -fsSL ${url} | tar zx --strip-components=1 -C ${install_dir}

export MAVEN_HOME=${install_dir}
export M2_HOME=${install_dir}
export M2=${install_dir}/bin
export PATH=${install_dir}/bin:$PATH

echo maven installed to ${install_dir}

echo "maven version is : $(mvn --version)"

