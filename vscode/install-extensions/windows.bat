@echo off

echo [DEV] Extensions that I can use to develop, regardless of the language I use
echo [PHP] For my PHP developments
echo [PYTHON] For my Python developments
echo [JAVA] For my Java developments
echo '[SPRING] For my SpringBoot developments'
echo [WP] For my WordPress developments
echo [CPP] For my C++ developments

set /p option=What type of extensions do you want to install??

IF "%option%"=="DEV" (
  code --install-extension ms-vscode-remote.remote-ssh
  code --install-extension ms-vscode-remote.remote-wsl
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension eamodio.gitlens
  code --install-extension gruntfuggly.todo-tree
) ELSE IF "%option%"=="PHP" (
  code --install-extension gerardreches.php-extension-pack
  code --install-extension bmewburn.vscode-intelephense-client
  code --install-extension emallin.phpunit
) ELSE IF "%option%"=="PYTHON" (
  code --install-extension ms-python.python
  code --install-extension kevinrose.vsc-python-indent
) ELSE IF "%option%"=="JAVA" (
  code --install-extension redhat.java
  code --install-extension vscjava.vscode-java-debug
  code --install-extension vscjava.vscode-java-test
  code --install-extension vscjava.vscode-maven
  code --install-extension vscjava.vscode-java-dependency
  code --install-extension VisualStudioExptTeam.vscodeintellicode
) ELSE IF "%option%"=="WP" (
  code --install-extension wordpresstoolbox.wordpress-toolbox
) ELSE IF "%option%"=="CPP" (
  code --install-extension ms-vscode.cpptools
) ELSE IF "%option%"=="SPRING" (
  code --install-extension vscjava.vscode-spring-boot-dashboard
  code --install-extension vscjava.vscode-spring-initializr
  code --install-extension vmware.vscode-spring-boot
) ELSE (
  echo Sorry, that is not a valid option
)

pause
exit