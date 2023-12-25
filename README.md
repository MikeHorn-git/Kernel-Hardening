# Kernel-Hardening
This projects contain 4 elements :

* Sysctl.conf define kernel parameter value.
* Define parameters when starting the kernel with GRUB_CMDLINE_LINUX line in grub config.
* Blacklist.conf disable certains unwanted kernel modules.
* Install.sh backup and copy files in a automated script.

# Installation
```bash
git clone https://github.com/MikeHorn-git/Kernel-Hardening.git
cd Kernel-Hardening
chmod +x ./install.sh
sudo ./install.sh
```

# Test on
* Arch
* Debian
* Fedora

# Resources
* [Anssi](https://cyber.gouv.fr/publications/recommandations-de-securite-relatives-un-systeme-gnulinux)
* [Arch Wiki](https://wiki.archlinux.org/title/Kernel_parameters#GRUB)
* [Kernel-Hardening-Checker](https://github.com/a13xp0p0v/kernel-hardening-checker)
* [Madaidans](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kernel)
