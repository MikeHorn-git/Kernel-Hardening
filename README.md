# Kernel-Hardening

> [!IMPORTANT]
> Read content of files before proceeding, certains features are disabled.

![logo](https://github.com/MikeHorn-git/Kernel-Hardening/assets/123373126/e4fca8a7-782a-42a7-863e-431a94660313)

## Table of contents

* [Description](https://github.com/MikeHorn-git/Kernel-Hardening#description)
* [Blacklist Modules](https://github.com/MikeHorn-git/Kernel-Hardening#blacklist-modules-100)
* [GRUB Parameters](https://github.com/MikeHorn-git/Kernel-Hardening#grub-parameters-25)
* [Kernel Parameters](https://github.com/MikeHorn-git/Kernel-Hardening#kernel-parameters-50)
* [Installation Script](https://github.com/MikeHorn-git/Kernel-Hardening#installation-script)
* [Kconfigs](https://github.com/MikeHorn-git/Kernel-Hardening#kconfigs)
* [Compile Kernel](https://github.com/MikeHorn-git/Kernel-Hardening#compile-kernel)
* [Kernel Installation](https://github.com/MikeHorn-git/Kernel-Hardening#kernel-installation)
* [Security Audit](https://github.com/MikeHorn-git/Kernel-Hardening#security-audit)
* [Resources](https://github.com/MikeHorn-git/Kernel-Hardening#resources)

## Description

Kernel kconfigs files with hardening in mind.

## Blacklist Modules (+100)

* Driver
* Filesystem
* Graphics
* Input devices
* Network
* Storage

These kernel modules blacklisted are stored in conf/blacklist.conf

## GRUB Parameters (25)

* Debugging and Diagnostics
* Randomness
* Security features
* Vulnerability mitigation

These GRUB paramaters are stored in conf/grub.txt

## Kernel Parameters (+50)

* FileSystem
* Kernel
* Network

These kernel parameters are present in conf/sysctl.conf

## Installation Script

* Add GRUB entries
* Copy blacklist.conf
* Copy sysctl.conf

```bash
# Backup your files before running
git clone https://github.com/MikeHorn-git/Kernel-Hardening.git
cd Kernel-Hardening/scripts
chmod +x install.sh
./install.sh
```

## Kconfigs

```bash
kconfigs
├── fragment-X86_64
├── gentoo
│   └── config
└── vanilla
    └── config
```

### Fragment

Kernel-hardening-checker tool that generates a Kconfig fragment with the security hardening options for the selected microarchitecture following the [README](https://github.com/a13xp0p0v/kernel-hardening-checker#generating-a-kconfig-fragment-with-the-security-hardening-options)

```bash
kernel-hardening-checker -g X86_64 > fragment-X86_64
```

### Gentoo

Kernel sources lightly patched by [Gentoo kernel team](https://packages.gentoo.org/packages/sys-kernel/gentoo-sources).

### Vanilla

Official kernel sources released [here](https://www.kernel.org/).

## Compile Kernel

### Gentoo

#### Prepare

```bash
# Install gentoo kernel
sudo emerge -av gentoo-sources

# Use eselect to change symlinks
sudo eselect kernel list
sudo eselect kernel set 1 # Use the correct number from kernel list command

# Take custom .config
cd /usr/src/linux
wget https://raw.githubusercontent.com/MikeHorn-git/Kernel-Hardening/main/kconfigs/gentoo/config
mv config .config
```

#### Modify

When the kernel source is newer than the .config file.

```bash
sudo make oldconfig
```

To manually modify config.

```bash
sudo make nconfig
```

#### Compile

```bash
# Compile & Install
sudo make -j$(nproc)
sudo make modules_install
sudo make install
```

### Arch

#### Prepare

```bash
export KVERSION=6.13.6
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$KVERSION".tar.xz
tar -xf linux-"$KVERSION".tar.xz
cd linux-"$KVERSION"
wget https://raw.githubusercontent.com/MikeHorn-git/Kernel-Hardening/main/kconfigs/vanilla/config
mv config .config
```

#### Modify

When the kernel source is newer than the .config file.

```bash
sudo make oldconfig
```

To manually modify config.

```bash
sudo make nconfig
```

#### Compile

```bash
# Change to your version
export KVERSION=6.13.6
sudo cp arch/x86/boot/bzImage /boot/vmlinuz-"$KVERSION"

# Compile & Install
sudo make -j$(nproc)
sudo make modules_install
sudo make install

# Create initramfs image (choose one based on your distribution)
sudo dracut --kver "$KVERSION" /boot/initramfs-"$KVERSION".img
sudo mkinitcpio -k "$KVERSION" -g /boot/initramfs-"$KVERSION".img
sudo update-initramfs -c -k "$KVERSION"

# Update GRUB (choose one based on your distribution)
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Security Audit

### Kernel-Hardening-Checker

```bash
kernel-hardening-checker -c kconfigs/gentoo/config
kernel-hardening-checker -c kconfigs/vanilla/config
```

### Spectre-meltdown-checker

```bash
sudo ./spectre-meltdown-checker.sh
```

## Resources

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
