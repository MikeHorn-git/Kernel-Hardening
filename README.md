![logo](https://github.com/MikeHorn-git/Kernel-Hardening/assets/123373126/e4fca8a7-782a-42a7-863e-431a94660313)

# Warning
Use it at your own risk for your own needs. Read content of files before proceeding, certains features are disabled.

# Table of contents
* [Description](https://github.com/MikeHorn-git/Kernel-Hardening#description)
* [Kconfig](https://github.com/MikeHorn-git/Kernel-Hardening#kconfig)
* [Blacklist Modules](https://github.com/MikeHorn-git/Kernel-Hardening#blacklist-modules-100)
* [Kernel Parameters](https://github.com/MikeHorn-git/Kernel-Hardening#kernel-parameters-50)
* [Installation Script](https://github.com/MikeHorn-git/Kernel-Hardening#installation-script)
* [Compile Kernel yourself](https://github.com/MikeHorn-git/Kernel-Hardening#compile-kernel-yourself)
* [Kernel Fuzzing](https://github.com/MikeHorn-git/Kernel-Hardening#kernel-fuzzing)
* [Credits](https://github.com/MikeHorn-git/Kernel-Hardening#credits)

# Description
This project aim to automating, make easier and help people to harden their kernel. This can be used for harden their OS or to be use for kernel-fuzzing and security research about linux Kernel.

# Kconfig
Kconfig files are stored in configs folder.
* .config : Custom Kconfig file, following best practices. Build with tui based kconfig editor provided by Linux Kernel source code
```bash
# Inside the Linux kernel source code root path
make menuconfig
```
* .Kernel-Hardening-Checker : Kconfig file from kernel-hardening-checker
```bash
kernel-hardening-checker -g X86_64 | tee .Kernel-Hardening-Checker
```

# Blacklist Modules (+100)
* Driver
* Filesystem
* Graphics
* Input devices
* Network
* Storage

These kernel modules blacklisted are present in blacklist.conf.

# Kernel Parameters (+50)
* FileSystem
* Kernel
* Network

These kernel parameters are present in sysctl.conf

# Installation Script
Backup your files before running.
```bash
git clone https://github.com/MikeHorn-git/Kernel-Hardening.git
cd Kernel-Hardening/scripts
chmod +x install.sh
./install.sh
```
* Add GRUB entries
* Copy blacklist.conf
* Copy sysctl.conf

# Compile Kernel yourself
```bash
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.9.1.tar.xz
tar -xf linux-6.9.1.tar.xz
cd linux-6.9.1
wget https://raw.githubusercontent.com/MikeHorn-git/Kernel-Hardening/main/Kconfigs/.config
wget https://raw.githubusercontent.com/MikeHorn-git/Kernel-Hardening/main/scripts/build.sh
chmod +x build.sh
./build.sh
```
* All [Clean | Oldconfig | Build]
* Build
* Clean : mrproper & clean
* Config : default X86-64 .config
* Configbuild
* Oldconfig
* Oldconfigbuild
* Rebuild : Clean and Build

It's higlhy recommended to run oldconfig when the kernel source is newer than the .config file.

# Kernel Fuzzing
TBD

# Credits
* [Anssi](https://cyber.gouv.fr/publications/recommandations-de-securite-relatives-un-systeme-gnulinux) [Guide]
* [ClipOS](https://docs.clip-os.org/clipos/kernel.html#configuration) [Guide]
* [Kernel.org](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html) [Guide]
* [Kernel-Hardening-Checker](https://github.com/a13xp0p0v/kernel-hardening-checker) [Tool]
* [Kernel_Self_Protection_Project](https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project/Recommended_Settings) [Guide]
* [Kicksecure](https://github.com/Kicksecure) [Guide]
* [Linux-Hardened](https://github.com/anthraxx/linux-hardened) [Implementation]
* [lwn.net](https://lwn.net/) [Logo]
* [Madaidans](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kernel) [Guide]
* [spectre-meltdown-checker](https://github.com/speed47/spectre-meltdown-checker) [Tool]
