#!/usr/bin/env bash
# Check if composer currently installed
if hash composer; then
  echo "Composer Already Installed"
  echo "You can find it at $(type -p composer)"
  exit
fi
# Update package index
sudo apt update
# Download latest composer snapshot and run it by php
sudo wget https://getcomposer.org/composer.phar
# Move composer to /bin/composer
sudo mv composer.phar /bin/composer && chmod 775 /bin/composer

echo "Composer Installed Globally Successfully"
echo "Composer Installed at $(type -p composer)"
echo "You can always find it by calling `type -p composer`"

if hash php; then
  echo "PHP Already Installed"
  echo "You can find it at $(type -p php)"
  echo "You Installed $(php -version)"
  exit
fi
# Make sure php is installed
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update && apt-get install -y dh-php libapache2-mod-php7.3 newrelic-php5 newrelic-php5-common php-amqp php-common php-curl php-gettext php-gnupg php-igbinary php-imagick php-memcached php-mongodb php-msgpack php-pear php-redis php-ssh2 php7.3 php7.3-bcmath php7.3-bz2 php7.3-cli php7.3-common php7.3-curl php7.3-dev php7.3-gd php7.3-gmp php7.3-imap php7.3-intl php7.3-json php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-pspell php7.3-readline php7.3-recode php7.3-soap php7.3-sqlite3 php7.3-tidy php7.3-xml php7.3-xmlrpc php7.3-xsl php7.3-zip php7.4-common php7.4-curl pkg-php-tools
