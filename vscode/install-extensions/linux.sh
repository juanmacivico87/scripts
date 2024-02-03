#!/usr/bin/bash
echo 'What type of extensions do you want to install??'
echo ''
echo '[DEV] Extensions that I can use to develop, regardless of the language I use'
echo '[PHP] For my PHP developments'
echo '[PYTHON] For my Python developments'
echo '[WP] For my WordPress developments'
echo '[CPP] For my C++ developments'
read OPTION

OPTION=${OPTION^^}

case $OPTION in
  DEV)
    code --install-extension ms-vscode-remote.remote-ssh
    code --install-extension ms-vsliveshare.vsliveshare
    code --install-extension eamodio.gitlens
    code --install-extension gruntfuggly.todo-tree
    ;;
  PHP)
    code --install-extension gerardreches.php-extension-pack
    code --install-extension bmewburn.vscode-intelephense-client
    code --install-extension emallin.phpunit
    ;;
  PYTHON)
    code --install-extension ms-python.python
    code --install-extension kevinrose.vsc-python-indent
    ;;
  WP)
    code --install-extension wordpresstoolbox.wordpress-toolbox
    ;;
  CPP)
    code --install-extension ms-vscode.cpptools
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