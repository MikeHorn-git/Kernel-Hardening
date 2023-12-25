# Warning
Backup up sensitive data. Check the content of the files before proceeding.

# Kernel-Hardening
This project contains 4 elements :

* Sysctl.conf defines kernel parameter values.
* Define parameters when starting the kernel with the GRUB_CMDLINE_LINUX line in grub config.
* Blacklist.conf disables certain unwanted kernel modules.
* Install.sh backup and copy files in an automated script.

# Installation
```bash
git clone https://github.com/MikeHorn-git/Kernel-Hardening.git
cd Kernel-Hardening
chmod +x ./install.sh
sudo ./install.sh
```

# Tested on
* Arch
* Debian
* Fedora

# Resources
* [Anssi](https://cyber.gouv.fr/publications/recommandations-de-securite-relatives-un-systeme-gnulinux)
* [Arch Wiki](https://wiki.archlinux.org/title/Kernel_parameters#GRUB)
* [Kernel-Hardening-Checker](https://github.com/a13xp0p0v/kernel-hardening-checker)
* [Madaidans](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kernel)
