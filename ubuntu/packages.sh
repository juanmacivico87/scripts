#!/usr/bin/bash
echo 'What do you want to do??'
echo ''
echo '[UP] Update and ugrade packages'
echo '[GIT] Install Git'
echo '[CURL] Install cURL'
echo '[AP2] Install Apache'
echo '[MYSQL] Intall MySQL'
echo '[MDB] Intall MariaDB'
echo '[PHP] Install PHP'
echo '[NVM] Install NVM'
echo '[COMP] Install Composer'
echo '[WPCLI] Install WP-CLI'
echo '[CPP] Install C++ compiler'
echo '[PHPV] Switch PHP version'
read OPTION

OPTION=${OPTION^^}

case $OPTION in
  UP)
    sudo apt update && sudo apt upgrade -y
    ;;
  GIT)
    sudo apt install git -y
    git --version
    ;;
  CURL)
    sudo apt install curl
    curl --version
    ;;
  AP2)
    sudo apt install -y apache2 apache2-utils
    sudo service apache2 status
    ;;
  PHP)
    sudo add-apt-repository ppa:ondrej/apache2
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:ondrej/php
    sudo apt update
    echo 'What PHP version do you want to install??'
    read PHP_VERSION

    if [ PHP_VERSION = '' ]
    then
      PHP_VERSION = '8.1'
    fi

    sudo apt install php"$PHP_VERSION"-common php"$PHP_VERSION"-cli -y
    sudo apt install php"$PHP_VERSION" libapache2-mod-php"$PHP_VERSION" php"$PHP_VERSION"-fpm php-common php"$PHP_VERSION"-mysql php"$PHP_VERSION"-xml php"$PHP_VERSION"-xmlrpc php"$PHP_VERSION"-curl php"$PHP_VERSION"-gd php"$PHP_VERSION"-imagick php"$PHP_VERSION"-cli php"$PHP_VERSION"-dev php"$PHP_VERSION"-imap php"$PHP_VERSION"-mbstring php"$PHP_VERSION"-opcache php"$PHP_VERSION"-readline php"$PHP_VERSION"-soap php"$PHP_VERSION"-zip php"$PHP_VERSION"-intl php"$PHP_VERSION"-xdebug php"$PHP_VERSION"-redis -y
    ;;
  MYSQL)
    sudo apt install -y mysql-server mysql-client
    sudo service mysql status
    ;;
  MDB)
    sudo apt install -y mariadb-server mariadb-client
    sudo service mysql status
    ;;
  NVM)
    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    source ~/.zshrc
    echo -e '\033[1;31m Please, restart your terminal \033[0m'
    read CLOSE
    exit
    ;;
  WPCLI)
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wp
    wp –info
    ;;
  COMP)
    cd ~
    curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
    sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
    composer
    ;;
  CPP)
    sudo apt install build-essential gdb
    whereis g++
    whereis gdb
    ;;
  PHPV)
    echo 'What PHP version do you want to disable??'
    read OLD_PHP_VERSION
    echo 'What PHP version do you want to enable??'
    read NEW_PHP_VERSION

    if [ OLD_PHP_VERSION = '' ] || [ NEW_PHP_VERSION = '' ]
    then
      echo ''
      echo -e '\033[1;31m Sorry, that is not a valid option \033[0m'
      echo ''
      echo 'Please, press ENTER to exit . . .'
      read CLOSE
      exit
    fi

    sudo a2dismod php"$OLD_PHP_VERSION"
    sudo a2enmod php"$NEW_PHP_VERSION"
    sudo update-alternatives --set php /usr/bin/php"$NEW_PHP_VERSION"
    sudo update-alternatives --set phar /usr/bin/phar"$NEW_PHP_VERSION"
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar"$NEW_PHP_VERSION"

    sudo service apache2 restart

    php -v
    ;;
  *)
    echo ''
    echo -e '\033[1;31m Sorry, that is not a valid option \033[0m'
    echo ''
    echo 'Please, press ENTER to exit . . .'
    read CLOSE
    exit
    ;;
esac