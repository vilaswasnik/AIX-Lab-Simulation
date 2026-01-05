# AIX Space Management & Troubleshooting Quick Reference

## 🚀 Quick Commands for Increasing Space

### Most Common Method: Using `chfs`
```bash
# Increase /var by 1GB
chfs -a size=+1G /var

# Increase /tmp by 2GB
chfs -a size=+2G /tmp

# Increase /home by 500MB
chfs -a size=+500M /home

# Set exact size (be careful!)
chfs -a size=5G /opt
```

### Check Before Extending
```bash
# Check current disk usage
df -g

# Check volume group free space
lsvg rootvg | grep "FREE PPs"

# List all file systems
lsfs

# Check specific file system details
lsfs -q /var
```

## 📊 Storage Hierarchy in AIX

```
Physical Disk (hdisk0)
    ↓
Volume Group (rootvg)
    ↓
Logical Volume (hd4)
    ↓
File System (/)
```

## 🔧 Complete Storage Expansion Workflow

### Scenario 1: Extend Existing File System (Space Available in VG)
```bash
# 1. Check current status
df -g /var
lsvg rootvg

# 2. Extend file system
chfs -a size=+2G /var

# 3. Verify
df -g /var
```

### Scenario 2: No Space in Volume Group (Need to Add Disk)
```bash
# 1. Discover new hardware
cfgmgr

# 2. List all disks
lspv

# 3. Add new disk to volume group
extendvg rootvg hdisk2

# 4. Verify addition
lsvg -p rootvg
lsvg rootvg

# 5. Now extend file system
chfs -a size=+5G /var
```

### Scenario 3: Create New File System
```bash
# Single command (recommended)
crfs -v jfs2 -g datavg -m /app -a size=10G -A yes

# Step by step
mklv -y applv -t jfs2 datavg 10G
crfs -v jfs2 -d applv -m /app -A yes
mount /app
df -g /app
```

## 🔍 Troubleshooting Common Issues

### Issue 1: File System is 100% Full

**Symptoms:**
- Applications failing
- Cannot create files
- `df -g` shows 100% usage

**Diagnosis:**
```bash
# Find which file system is full
df -g | grep -E '9[0-9]%|100%'

# Find largest directories
du -smx /var | sort -rn | head -20

# Find large files
find /var -type f -size +100M -exec ls -lh {} \;

# Check for deleted files still held open
lsof | grep deleted
```

**Solutions:**
```bash
# Option 1: Clean up space
rm -rf /tmp/old_files
find /var/log -name "*.log" -mtime +30 -exec rm {} \;
gzip /var/log/*.log

# Option 2: Extend file system
chfs -a size=+2G /var

# Option 3: Move data elsewhere
tar -cvf /backup/data.tar /var/olddata
rm -rf /var/olddata
```

### Issue 2: Cannot Extend - "No space in volume group"

**Error Message:**
```
0516-404 allocp: This system cannot fulfill the allocation request.
```

**Diagnosis:**
```bash
# Check volume group space
lsvg rootvg
lsvg rootvg | grep "FREE PPs"

# Check physical volumes
lspv
lsvg -p rootvg
```

**Solutions:**
```bash
# Solution 1: Add new disk to VG
cfgmgr                    # Discover new disks
lspv                      # List all disks
extendvg rootvg hdisk2    # Add hdisk2 to rootvg

# Solution 2: Remove unused logical volumes
lsvg -l rootvg            # List LVs in VG
lslv unusedlv             # Check if LV is needed
rmlv unusedlv             # Remove if not needed

# Solution 3: Create new volume group
mkvg -y appvg hdisk3
crfs -v jfs2 -g appvg -m /newapp -a size=10G -A yes
```

### Issue 3: Disk Shows as "MISSING"

**Symptoms:**
```bash
lspv
# Output shows: hdisk1    None    MISSING
```

**Diagnosis:**
```bash
# Check disk status
lsdev -Cc disk
lspv

# Check for errors
errpt | grep hdisk1
errpt -a | grep DISK
```

**Solutions:**
```bash
# Try to reconfigure
cfgmgr

# If disk is failed, replace it
migratepv hdisk1 hdisk2   # Move data to good disk
reducevg rootvg hdisk1    # Remove from VG
rmdev -l hdisk1 -d        # Delete device configuration
```

### Issue 4: File System Extension Fails

**Error:** "chfs: 0506-908 Cannot reduce size"

**Cause:** Wrong syntax - trying to reduce instead of increase

**Fix:**
```bash
# WRONG
chfs -a size=1G /var      # This sets to 1G (reduction)

# CORRECT
chfs -a size=+1G /var     # This adds 1G (increase)
```

### Issue 5: Poor Disk Performance

**Diagnosis:**
```bash
# Check I/O statistics
iostat -D 1 5

# Check for disk errors
errpt | grep DISK

# Check disk queue depth
lsattr -El hdisk0 | grep queue

# Check file system fragmentation
defragfs /var
```

**Solutions:**
```bash
# Increase queue depth
chdev -l hdisk0 -a queue_depth=32

# Check for hardware issues
diag -c
errpt -a

# Consider spreading load across disks
# Use striped logical volumes for better I/O
mklv -y striplv -t jfs2 -S 128K datavg 5G hdisk1 hdisk2
```

## 📋 Essential Troubleshooting Commands

### Daily Health Checks
```bash
# Disk space check
df -g

# Swap/paging space check
lsps -s

# Error log check
errpt | head -20

# Service status
lssrc -a | grep inoperative

# Performance snapshot
vmstat 1 5
```

### Storage Investigation
```bash
# Show all storage layers
lspv                      # Physical volumes
lsvg -o                   # Active volume groups
lsvg -l rootvg            # Logical volumes in VG
lsfs                      # File systems
df -g                     # Mounted file systems

# Detailed disk info
lspv hdisk0               # PV details
lsvg rootvg               # VG details
lslv hd4                  # LV details
lsfs -q /                 # FS details
```

### Performance Analysis
```bash
# Real-time monitoring
topas                     # Overall performance
nmon                      # Comprehensive monitoring
iostat -D 1 5            # Disk I/O
vmstat 1 5               # Memory and CPU

# Memory usage
svmon -G                 # Global memory
svmon -P -t 10           # Top 10 processes

# Find resource hogs
ps aux | sort -k3 -nr | head -10    # CPU hogs
ps aux | sort -k4 -nr | head -10    # Memory hogs
```

## 🎯 Best Practices Checklist

- [ ] Always check free space before extending: `lsvg rootvg`
- [ ] Use `+` notation for increases: `chfs -a size=+1G /var`
- [ ] Monitor regularly with `df -g` and `lsps -s`
- [ ] Keep 20% free space in critical file systems
- [ ] Document all storage changes
- [ ] Test in dev before production changes
- [ ] Backup before major changes: `savevg -i rootvg`
- [ ] Set up alerts at 80% disk usage
- [ ] Review error log daily: `errpt | head -20`
- [ ] Clean up old logs and temporary files regularly

## 🚨 Emergency Response Procedure

1. **Identify the Problem**
   ```bash
   df -g                    # What's full?
   lsps -s                  # Swap issues?
   errpt | head -20         # Any errors?
   ```

2. **Quick Space Recovery**
   ```bash
   # Clear cache and temp files
   rm -rf /tmp/*
   find /var/tmp -type f -mtime +7 -delete
   
   # Compress logs
   gzip /var/log/*.log
   ```

3. **Permanent Fix**
   ```bash
   # Check if space available in VG
   lsvg rootvg
   
   # If yes, extend
   chfs -a size=+2G /var
   
   # If no, add disk
   cfgmgr
   extendvg rootvg hdisk2
   chfs -a size=+2G /var
   ```

4. **Verify and Monitor**
   ```bash
   df -g /var
   lsvg rootvg
   errpt | head -20
   ```

## 📚 Additional Resources

- **Cheatsheet**: See `aix_cheatsheet.txt` for complete command reference
- **Practice**: See `practice_guide.md` for hands-on exercises
- **Official Docs**: IBM AIX Information Center
- **SMIT**: Use `smit` for GUI-based management

## 💡 Quick Command Reference Card

```bash
# Top 10 Most Used Commands
df -g                          # Check disk space
lsvg rootvg                    # Check VG status
lspv                           # List disks
chfs -a size=+1G /var         # Increase space
extendvg rootvg hdisk2        # Add disk to VG
errpt | head -20              # Check errors
lsps -s                       # Check swap
topas                         # Performance monitor
cfgmgr                        # Discover hardware
lsdev -Cc disk                # List all disks
```

---
**Remember**: This is a learning simulation - practice these commands here before using them on production systems!
