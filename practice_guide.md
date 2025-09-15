# AIX Lab Simulation - Practice Exercises

Welcome to the AIX Lab Simulation practice guide! This file contains hands-on exercises to help you learn AIX commands effectively.

## 🎯 Getting Started

First, make sure you've set up the simulation:
```bash
source ./aix_simulation.sh
```

## 📋 Basic Exercises

### Exercise 1: System Information
Learn to gather basic system information:
```bash
# Check AIX version and maintenance level
oslevel
oslevel -r
oslevel -s

# Get complete system information
uname -a

# Check system configuration
prtconf | head -20

# Get memory information
bootinfo -r
```

**Try it yourself**: What's the difference between `oslevel`, `oslevel -r`, and `oslevel -s`?

### Exercise 2: Storage Management
Understanding AIX storage hierarchy:
```bash
# List all physical volumes
lspv

# Get detailed info about hdisk0
lspv hdisk0

# List all volume groups
lsvg

# Show detailed info about rootvg
lsvg rootvg
lsvg -l rootvg

# List logical volumes
lslv hd4

# Check file system usage
df -g
lsfs
```

**Challenge**: Explain the relationship between hdisk0, rootvg, and the logical volumes shown.

### Exercise 3: Performance Monitoring
Monitor system performance:
```bash
# Check current processes
ps -ef

# See who's logged in
w
who

# Monitor system performance
topas
vmstat 2 5
iostat 2

# Check memory and swap usage
lsps -a
```

**Practice**: Start `topas` and observe the different metrics displayed.

### Exercise 4: Network Diagnostics
Explore network configuration:
```bash
# Show network interfaces
ifconfig -a

# Display routing table
netstat -rn

# Show network connections
netstat -an

# Test connectivity (simulated)
ping google.com
```

**Exercise**: What information can you gather about the network configuration?

### Exercise 5: Service Management
Learn about AIX services:
```bash
# List all services
lssrc -a

# List TCP/IP services specifically
lssrc -g tcpip

# Check specific service status
lssrc -s sshd
lssrc -s cron
```

**Question**: How many services are running in the tcpip group?

### Exercise 6: Error Analysis
Understanding system errors:
```bash
# View error log
errpt

# Show detailed error information
errpt -a

# Filter errors by date
errpt -s 0101000024

# Show only hardware errors
errpt -T PERM
```

**Analysis**: Look at the different types of errors and their classifications.

## 🔧 Advanced Exercises

### Exercise 7: Deep Storage Dive
```bash
# Examine volume group details
lsvg -p rootvg    # Show physical volumes
lsvg -l rootvg    # Show logical volumes
lsvg -L rootvg    # Show VG characteristics

# Look at specific logical volume
lslv -l hd4       # Show which PV it's on
lslv -m hd4       # Show logical to physical mapping

# File system details
lsfs -q /
lsfs -l /usr
```

### Exercise 8: Device Management
```bash
# List all devices
lsdev

# Show only available devices
lsdev -C

# Look at processor info
lsdev -Cc processor

# Show device attributes
lsattr -El sys0
lsattr -El hdisk0
```

### Exercise 9: Network Deep Dive
```bash
# Detailed interface statistics
entstat en0

# Network performance
netstat -i

# Protocol statistics
netstat -s
```

## 🎓 Scenarios-Based Learning

### Scenario 1: Disk Space Investigation
You've been told the system is running low on disk space. Use AIX commands to:
1. Check overall disk usage
2. Identify which file systems are full
3. Determine which volume groups have available space
4. Find the physical layout of storage

```bash
# Your commands here:
# df -g
# lsvg
# lspv
```

### Scenario 2: Performance Troubleshooting
Users are complaining about slow system performance. Investigate:
1. Check current system load
2. Identify resource-intensive processes
3. Check memory and swap usage
4. Monitor I/O performance

```bash
# Your investigation commands:
# topas
# ps -ef | sort
# vmstat
# iostat
```

### Scenario 3: Service Issues
A network service isn't responding properly. Troubleshoot:
1. Check if network services are running
2. Verify network configuration
3. Test connectivity
4. Look for related error messages

```bash
# Your troubleshooting steps:
# lssrc -g tcpip
# ifconfig -a
# netstat -an
# errpt
```

## 📝 Command Cheat Sheet Quick Reference

### Storage Commands
- `lspv` - List physical volumes
- `lsvg` - List volume groups  
- `lslv` - List logical volumes
- `lsfs` - List file systems
- `df -g` - Disk usage in GB

### Performance Commands  
- `topas` - Real-time performance monitor
- `nmon` - Advanced performance tool
- `vmstat` - Virtual memory stats
- `iostat` - I/O statistics
- `sar` - System activity reporter

### Network Commands
- `ifconfig -a` - All network interfaces
- `netstat -rn` - Routing table
- `netstat -an` - All connections
- `entstat en0` - Ethernet statistics
- `ping host` - Test connectivity

### Service Commands
- `lssrc -a` - List all services
- `lssrc -g group` - List service group
- `startsrc -s service` - Start service
- `stopsrc -s service` - Stop service

### Error Commands
- `errpt` - Show errors
- `errpt -a` - Detailed errors  
- `errpt -s date` - Errors since date
- `errpt -j ID` - Specific error detail

## 🏆 Mastery Checklist

Mark off each skill as you master it:

- [ ] Can check AIX version and system info
- [ ] Understand storage hierarchy (PV → VG → LV → FS)
- [ ] Can navigate physical and logical storage
- [ ] Know how to monitor system performance
- [ ] Can troubleshoot network issues
- [ ] Understand service management
- [ ] Can analyze system errors
- [ ] Comfortable with common flags and options
- [ ] Can combine commands for troubleshooting
- [ ] Ready for real AIX administration!

## 💡 Tips for Learning

1. **Practice regularly**: Use the simulation daily to build muscle memory
2. **Read man pages**: Use the cheatsheet to understand command options
3. **Combine commands**: Learn to pipe and combine AIX commands
4. **Focus on flags**: Many AIX commands have powerful flag combinations
5. **Think hierarchically**: AIX storage is hierarchical - understand the layers
6. **Learn error codes**: AIX has specific error reporting - understand the categories

## 🔗 Next Steps

Once comfortable with these exercises:
1. Review the full `aix_cheatsheet.txt` for advanced topics
2. Practice SMIT navigation (System Management Interface Tool)
3. Learn about automation and scripting in AIX
4. Explore advanced performance tuning concepts

Good luck with your AIX learning journey! 🚀