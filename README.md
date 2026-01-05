# AIX-Lab-Simulation

A comprehensive IBM AIX command simulation environment for learning and training purposes. This project provides a realistic AIX command-line experience without requiring actual AIX hardware or systems.

## ✨ Key Features

🔒 **Authentic AIX Environment**: Linux-specific commands are disabled to enforce proper AIX command usage
📚 **Comprehensive Command Set**: Full simulation of AIX storage, performance, network, and system commands
💡 **Learning-Focused**: Helpful suggestions when you try Linux commands by mistake
🎯 **Realistic Output**: Commands produce actual AIX-style output

## 🚀 Quick Start

### 1. Start the Simulation
```bash
# Source the simulation to enable AIX commands
source ./aix_simulation.sh
```

**That's it!** The simulation is now active in your current terminal session.

### 2. Use AIX Commands Interactively
Once sourced, you can use AIX commands just like on a real system:

```bash
# Check AIX version
oslevel -r

# List physical volumes
lspv

# List logical volumes in rootvg
lsvg -l rootvg

# Check file system usage (use -g not -h!)
df -g

# Monitor system performance (use topas not top!)
topas
```

**Note**: Once sourced, Linux commands like `top`, `fdisk`, `systemctl` will be disabled and suggest AIX alternatives.

### 3. Exit the Simulation
To exit and return to normal Linux environment:

**Option 1** (Recommended): Close the terminal and open a new one

**Option 2**: Exit the current terminal session:
```bash
exit
```

Then open a new terminal. The simulation only affects the current shell session.

## 🔒 Linux Command Blocking

This simulation blocks common Linux commands to help you learn proper AIX syntax:

| ❌ Linux Command | ✅ AIX Equivalent | Purpose |
|-----------------|------------------|---------|
| `top` | `topas` | Performance monitoring |
| `htop` | `topas` or `nmon` | Advanced performance |
| `free -h` | `svmon -G` | Memory usage |
| `lsblk` | `lspv` | List disks |
| `fdisk -l` | `lspv` | List physical volumes |
| `df -h` | `df -g` | Disk space (in GB) |
| `systemctl` | `lssrc`, `startsrc`, `stopsrc` | Service management |
| `ip addr` | `ifconfig -a` | Network interfaces |
| `lvextend` | `extendlv` or `chfs` | Extend logical volume |
| `yum install` | `installp -a` | Package installation |

When you try a Linux command, you'll see a helpful message like:
```
⚠️  AIX: Command 'top' not found.
💡 Try the AIX equivalent: topas
```

## 📋 Features

### System Information Commands
- `oslevel` - AIX operating system level
- `uname` - System information
- `prtconf` - System configuration
- `bootinfo` - Boot and hardware info
- `getconf` - System configuration variables

### Storage Management
- `lspv` - List physical volumes
- `lsvg` - List volume groups
- `lslv` - List logical volumes
- `lsfs` - List file systems
- `df` - File system usage (supports -k, -m, -g, -i, -t flags)

### Device & Hardware Management
- `lscfg` - List system configuration
- `lsdev` - List devices
- `lsattr` - List device attributes

### Process & Performance Monitoring
- `ps` - Process status
- `w` - Show logged in users
- `who` - Show who is logged in
- `topas` - Performance monitor
- `nmon` - System performance monitor
- `vmstat` - Virtual memory statistics
- `iostat` - I/O statistics
- `sar` - System activity reporter

### Network Commands
- `ifconfig` - Network interface configuration
- `netstat` - Network statistics
- `entstat` - Ethernet statistics
- `ping` - Network connectivity test

### Service Management
- `lssrc` - List system resource controller
- `startsrc` - Start system services
- `stopsrc` - Stop system services

### Error Reporting
- `errpt` - Error report (supports -a, -s, -j, -d flags)

## 📖 Learning Resources

This simulation comes with a comprehensive cheatsheet (`aix_cheatsheet.txt`) that includes:

- Command comparisons between Linux and AIX
- Advanced AIX-specific features
- Key concepts and terminology
- Practice scenarios
- Real-world examples
- Best practices
- Troubleshooting guides
- SMIT (System Management Interface Tool) reference

## 🔧 Examples

### Storage Management Examples
```bash
# View all physical volumes
lspv

# Get detailed info about a specific PV
lspv hdisk0

# List all volume groups
lsvg

# Show logical volumes in rootvg
lsvg -l rootvg

# Check file system space in GB
df -g
```

### Performance Monitoring
```bash
# Start topas with 5-second intervals
topas -i 5

# Get memory information
bootinfo -r

# Check virtual memory stats
vmstat 2 5

# Monitor I/O performance
iostat 2
```

### Network Commands
```bash
# Show network interfaces
ifconfig -a

# Display routing table
netstat -rn

# Check network connections
netstat -an

# Test connectivity
ping 8.8.8.8
```

### Service Management
```bash
# List all services
lssrc -a

# List TCP/IP services
lssrc -g tcpip

# Start a service
startsrc -s sshd

# Stop a service
stopsrc -s sshd
```

## 🎯 Important Notes

- **This is a simulation**: Commands produce realistic AIX output but don't perform actual system operations
- **Learning Tool**: Perfect for AIX training, certification prep, and command familiarity
- **Safe Environment**: No risk of damaging real systems while learning
- **Realistic Output**: Based on real AIX systems to provide authentic learning experience

## 📚 Study Guide

1. **Start with basics**: `oslevel`, `uname`, `prtconf`
2. **Learn storage**: `lspv`, `lsvg`, `lslv`, `df`
3. **Monitor performance**: `topas`, `nmon`, `vmstat`
4. **Manage services**: `lssrc`, `startsrc`, `stopsrc`
5. **Network diagnostics**: `netstat`, `ifconfig`, `ping`
6. **Error analysis**: `errpt`

## 🔍 Troubleshooting

If you encounter issues:

1. Ensure the script is executable: `chmod +x aix_simulation.sh`
2. Source the script properly: `source ./aix_simulation.sh`
3. Check that you're in the correct directory
4. Refer to the cheatsheet for command syntax

## 📄 Files

- `aix_simulation.sh` - Main simulation script with all AIX commands
- `aix_cheatsheet.txt` - Comprehensive reference guide
- `README.md` - This documentation

## 🤝 Contributing

Feel free to enhance the simulation by:
- Adding more AIX commands
- Improving command output realism
- Adding new scenarios
- Fixing bugs or improving documentation

---

**Happy Learning!** 🎓

This simulation helps bridge the gap between Linux knowledge and AIX administration, making it easier to learn IBM's powerful Unix variant.