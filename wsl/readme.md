# Install WSL2

(*) To write this documentation, I have based myself on David Navia's web article ["WordPress development for Windows with WSL (part 1): Installing WSL"](https://davidnaviaweb.com/blog/desarrollo-web/desarrollo-wordpress-para-windows-con-wsl-parte-1-instalar-wsl/)

1. Open a Power Shell as administrator and execute the following command:

```dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart```

2. Launch the Run command with the key combination *Windows + R* to find out the version number of your Windows and enter the *winver* command.
3. For everything to work correctly, you must have Windows 10 version 2004 or higher installed. If this is not your case, use the upgrade wizard to [download the latest version of Windows 10](https://www.microsoft.com/es-es/software-download/windows10).
4. Now, run the following command from your PowerShell in administrator mode and restart your computer:

```dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart```

5. Once the computer has restarted, re-open your PowerShell in administrator mode and run the ```wsl``` command to verify that it has been installed correctly.
6. The next step is to download and install the Linux Kernel. Choose the option that suits you best depending on your computer:
    - [x64](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
    - [AMR64](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
7. Now, set WSL version 2 as the default with the following command:

```wsl --set-default-version 2```

8. Finally, download and install the latest version of Ubuntu from Microsoft Store.

With these steps, you will have a Linux operating subsystem on your Windows computer.