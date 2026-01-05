# 🔒 Linux Command Blocking Feature

## Overview
The AIX simulation now blocks 60+ common Linux commands to create an authentic learning environment. When you try a Linux command, you'll receive a helpful message suggesting the correct AIX alternative.

## What's Blocked

### Package Management
- `yum`, `apt`, `apt-get`, `dnf`, `zypper` → Use `installp`
- `rpm` → Use `lslpp -L`

### Service Management  
- `systemctl` → Use `lssrc`, `startsrc`, `stopsrc`
- `journalctl` → Use `errpt` or `alog`
- `service`, `chkconfig` → Use `lssrc -a`

### Hardware & System Info
- `lscpu` → Use `prtconf` or `lsdev -Cc processor`
- `lsblk` → Use `lspv` or `lsdev -Cc disk`
- `lspci` → Use `lsdev -Cc adapter`
- `lshw` → Use `lsdev` or `prtconf`
- `free` → Use `svmon -G` (memory) or `lsps -a` (swap)

### Performance Monitoring
- `top` → Use `topas`
- `htop` → Use `topas` or `nmon`
- `dmesg` → Use `errpt`

### Storage & LVM
- `fdisk`, `parted` → Use `lspv`
- `lvs` → Use `lslv`
- `vgs` → Use `lsvg`
- `pvs` → Use `lspv`
- `lvcreate` → Use `mklv`
- `vgcreate` → Use `mkvg`
- `lvextend` → Use `extendlv` or `chfs`
- `vgextend` → Use `extendvg`

### Filesystem Commands
- `mkfs.ext4`, `mkfs.xfs` → Use `mkfs -V jfs2`
- `resize2fs` → Use `chfs -a size=+XG /path`
- `tune2fs` → Use `lsfs -q`
- `dumpe2fs` → Use `lsfs -l`

### Network Commands
- `ip` → Use `ifconfig` or `netstat`
- `ethtool` → Use `entstat -d`
- `ss` → Use `netstat -an`
- `nmcli`, `nmtui` → Use `ifconfig` or `smit tcpip`

### User Management
- `useradd` → Use `mkuser`
- `userdel` → Use `rmuser`
- `usermod` → Use `chuser`
- `groupadd` → Use `mkgroup`

## How It Works

When you source the AIX simulation, it:
1. Creates wrapper functions for Linux commands
2. These functions display a warning message
3. Suggests the correct AIX alternative
4. Returns exit code 127 (command not found)

## Example Output

```bash
$ top
⚠️  AIX: Command 'top' not found.
💡 Try the AIX equivalent: topas

$ fdisk -l
⚠️  AIX: Command 'fdisk' not found.
💡 Try the AIX equivalent: lspv
```

## Benefits

✅ **Enforces Learning**: Can't accidentally use Linux commands
✅ **Instant Feedback**: Immediately shows the correct AIX command
✅ **Builds Muscle Memory**: Forces you to use proper AIX syntax
✅ **Real-World Preparation**: Simulates actual AIX environment behavior

## Disabling the Feature

If you need to disable this feature temporarily, you can unset the functions:

```bash
unset -f top yum systemctl  # etc.
```

Or simply start a new shell session without sourcing the AIX simulation.

## Complete List of Blocked Commands

```
yum, apt, apt-get, dnf, zypper, rpm
systemctl, journalctl, systemd-analyze
lscpu, lsblk, lspci, lsusb, lshw, dmidecode, hwinfo
free, htop, top, dmesg
fdisk, parted, gdisk
lvs, vgs, pvs, lvcreate, vgcreate, pvcreate
lvextend, vgextend, lvremove, vgremove
lvdisplay, vgdisplay, pvdisplay
mkfs.ext4, mkfs.ext3, mkfs.xfs
resize2fs, tune2fs, dumpe2fs, e2fsck, xfs_repair
ip, ethtool, ss, nmcli, nmtui
useradd, userdel, usermod, groupadd, groupdel, groupmod
service, chkconfig, update-rc.d
firewall-cmd, ufw, iptables
blkid, findmnt, lsof (limited)
```

---

**Remember**: This is a training feature to help you learn AIX commands properly!
