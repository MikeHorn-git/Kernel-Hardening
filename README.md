# Warning
Backup up sensitive data. Check the content of the files before proceeding. Use at your own risk, manipulate kernel parameters can "break it".

# Installation
```bash
git clone https://github.com/MikeHorn-git/Kernel-Hardening.git
cd Kernel-Hardening
chmod +x ./install.sh
sudo ./install.sh
```
# Wiki
Sysctl.conf :
* [dev.tty.ldisc_autoload=0] Restricts loading TTY line disciplines.
* [kernel.dmesg_restrict=1] Restrict access to kernel log (dmesg).
* [kernel.kexec_load_disabled=1] Disable kexec syscall.
* [kernel.kptr_restrict=2] Mitigate kernel pointer leaks.
* [kernel.panic_on_oops=1] Kernel Panic if unexpected kernel behavior occured (oops).
* [kernel.perf_cpu_time_max_percent=1] Restrict subsystem perf use.
* [kernel.perf_event_max_sample_rate=1] Restrict subsystem perf use.
* [kernel.perf_event_paranoid=2] Restricts usage of performance events.
* [kernel.pid_max=65536] Set max pid.
* [kernel.printk=3] Restrict kernel log informations during boot.
* [kernel.randomize_va_space=2] Address space layout randomization (ASLR) activated.
* [kernel.sysrq=0] Disable SysRq key.
* [kernel.unprivileged_bpf_disabled=1] Restrict eBPF.
* [kernel.unprivileged_userns_clone=0] Restricts the usage of user namespaces.
* [kernel.yama.ptrace_scope=2] Restrict usage of ptrace.
* [vm.mmap_rnd_bits=32] Increase the bits of entropy used for mmap ASLR.
* [vm.mmap_rnd_compat_bits=16] Increase the bits of entropy used for mmap ASLR.
* [vm.unprivileged_userfaultfd=0] Restrict userfaultfd() syscall.

Network
* [net.core.bpf_jit_harden=2] Restrict eBPF.
* [net.ipv4.conf.all.accept_local=0]
* [net.ipv4.conf.all.accept_redirects=0] Disable ICMP redirect acceptance and sending.
* [net.ipv4.conf.all.accept_source_route=0] Disable source route.
* [net.ipv4.conf.all.arp_filter=1]
* [net.ipv4.conf.all.arp_ignore=2]
* [net.ipv4.conf.all.drop_gratuitous_arp=1]
* [net.ipv4.conf.all.route_localnet=0]
* [net.ipv4.conf.all.rp_filter=1] Enable source validation of packets received from all interfaces.
* [net.ipv4.conf.all.secure_redirects=0] Disable ICMP redirect acceptance and sending.
* [net.ipv4.conf.all.send_redirects=0] Disable ICMP redirect acceptance and sending.
* [net.ipv4.conf.all.shared_media=0]
* [net.ipv4.conf.default.accept_redirects=0] Disable ICMP redirect acceptance and sending.
* [net.ipv4.conf.default.accept_source_route=0] Disable source route.
* [net.ipv4.conf.default.rp_filter=1] Enable source validation of packets received from all interfaces.
* [net.ipv4.conf.default.secure_redirects=0] Disable ICMP redirect acceptance and sending.
* [net.ipv4.conf.default.send_redirects=0] Disable ICMP redirect acceptance and sending.
* [net.ipv4.conf.default.shared_media=0]
* [net.ipv4.icmp_echo_ignore_all=1] Ignore all ICMP requests.
* [net.ipv4.icmp_ignore_bogus_error_responses=1]
* [net.ipv4.ip_forward=0]
* [net.ipv4.ip_local_port_range=32768 65535]
* [net.ipv4.tcp_dsack=0] Disable TCP SACK.
* [net.ipv4.tcp_fack=0] Disable TCP SACK.
* [net.ipv4.tcp_rfc1337=1] Drop RST packets for sockets in the time-wait state.
* [net.ipv4.tcp_sack=0] Disable TCP SACK.
* [net.ipv4.tcp_syncookies=1] Mitigate SYN flood attacks.
* [net.ipv6.conf.default.disable_ipv6=1] Disable Ipv6.

File System
* [fs.protected_fifos=2]
* [fs.protected_hardinks=1]
* [fs.protected_regular=2]
* [fs.protected_symlinks=1]
* [fs.suid_dumpable=0]

# Tested on
* Arch
* Debian
* Fedora

# Resources
* [Anssi](https://cyber.gouv.fr/publications/recommandations-de-securite-relatives-un-systeme-gnulinux)
* [Madaidans](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kernel)
