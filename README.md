![logo](https://github.com/MikeHorn-git/Kernel-Hardening/assets/123373126/e4fca8a7-782a-42a7-863e-431a94660313)

# Warning
Use it at your own risk for your own needs. Read content of files before proceeding, certains features are disabled.

# Table of contents
* [Description](https://github.com/MikeHorn-git/Kernel-Hardening#description)
* [Kconfig](https://github.com/MikeHorn-git/Kernel-Hardening#kconfig)
* [Blacklist Modules](https://github.com/MikeHorn-git/Kernel-Hardening#blacklist-modules-100)
* [GRUB Parameters](https://github.com/MikeHorn-git/Kernel-Hardening#grub-parameters-25)
* [Kernel Parameters](https://github.com/MikeHorn-git/Kernel-Hardening#kernel-parameters-50)
* [Installation Script](https://github.com/MikeHorn-git/Kernel-Hardening#installation-script)
* [Compile Kernel yourself](https://github.com/MikeHorn-git/Kernel-Hardening#compile-kernel-yourself)
* [Test](https://github.com/MikeHorn-git/Kernel-Hardening#compile-kernel-yourself)
* [Kernel Installation](https://github.com/MikeHorn-git/Kernel-Hardening#kernel-installation)
* [Security Benchmarks](https://github.com/MikeHorn-git/Kernel-Hardening#security-benchmarks)
* [Kernel Fuzzing](https://github.com/MikeHorn-git/Kernel-Hardening#kernel-fuzzing)
* [Credits](https://github.com/MikeHorn-git/Kernel-Hardening#credits)

# Description
Configure, build, install, benchmark, tweak and fuzzing the Linux Kernel with a secure approach.
This can be used for harden your OS or for Linux Kernel security research.

# Kconfig
.config
My custom Kconfig file, following best practices.
Build your kconfig file with tui based kconfig editor provided by Linux Kernel source code :
```bash
# Inside the Linux kernel source code root path
make menuconfig
```
.Kernel-Hardening-Checker
Kconfig file from kernel-hardening-checker.
Generate with :
```bash
# Take your targeted architecture
kernel-hardening-checker -g X86_64 | tee .Kernel-Hardening-Checker
```
These Kconfig files are stored in Kconfigs/

# Blacklist Modules (+100)
* Driver
* Filesystem
* Graphics
* Input devices
* Network
* Storage

These kernel modules blacklisted are stored in conf/blacklist.conf

# GRUB Parameters (25)
* Debugging and Diagnostics
* Randomness
* Security features
* Vulnerability mitigation

These GRUB paramaters are stored in conf/grub.txt

# Kernel Parameters (+50)
* FileSystem
* Kernel
* Network

These kernel parameters are present in conf/sysctl.conf

# Installation Script
```bash
# Backup your files before running
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

# Test
TBD

# Kernel Installation
```bash
# Change to your version
KVERSION=6.9.1
sudo cp arch/x86/boot/bzImage /boot/vmlinuz-"$KVERSION"
# Install modules
sudo make modules_install

# Create initramfs image (choose one based on your distribution)
sudo dracut --kver 6.9.1 /boot/initramfs-"$KVERSION".img
sudo mkinitcpio -k 6.9.1 -g /boot/initramfs-"$KVERSION".img
sudo update-initramfs -c -k "$KVERSION"

# Update GRUB (choose one based on your distribution)
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

# Security Benchmarks
Kernel-Hardening-Checker
```bash
# Take the config file for your linux distros
./bin/kernel-hardening-checker -c kernel_hardening_checker/config_files/distros/Archlinux-hardened.config -l /proc/cmdline -s kernel_hardening_checker/config_files/distros/example_sysctls.txt
```
Spectre-meltdown-checker
```bash
# [Bonus] For a more completed approach for linux system hardening
sudo ./spectre-meltdown-checker.sh
```

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
