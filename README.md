# Kernel-Hardening
This projects contain 4 elements :

* Blacklist.conf disable certains modules.
* Sysctl.conf define kernel parameter value.
* Install.sh backup and copy files.
* Define kernel parameters when starting the kernel with grub.

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
* [Kernel-Hardening-Checker](https://github.com/a13xp0p0v/kernel-hardening-checker)
* [Madaidans](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kernel)
