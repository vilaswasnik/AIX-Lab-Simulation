# AIX-Lab-Simulation

A comprehensive IBM AIX command simulation environment for learning and training purposes. This project provides a realistic AIX command-line experience without requiring actual AIX hardware or systems.

## ✨ Key Features

🔒 **Authentic AIX Environment**: Linux-specific commands are disabled to enforce proper AIX command usage
📚 **Comprehensive Command Set**: Full simulation of AIX storage, performance, network, and system commands
💡 **Learning-Focused**: Helpful suggestions when you try Linux commands by mistake
🎯 **Realistic Output**: Commands produce actual AIX-style output
🤖 **AI-Powered Assistant**: Ask questions in natural language and get instant AIX command suggestions (OpenAI integration)

## 🚀 Quick Start

### 1. Setup (Optional: Enable AI Assistant)
For natural language command suggestions, set up your OpenAI API key:

```bash
# Get your API key from: https://platform.openai.com/api-keys
export OPENAI_API_KEY='your-api-key-here'

# Make it permanent by adding to ~/.bashrc
echo 'export OPENAI_API_KEY="your-api-key-here"' >> ~/.bashrc
source ~/.bashrc
```

### 2. Start the Simulation
```bash
# Source the simulation to enable AIX commands
source ./aix_simulation.sh
```

**That's it!** The simulation is now active in your current terminal session.

**Your prompt will change to:**
```
[AIX-7.3] user@aix-server:/workspaces/AIX-Lab-Simulation$
```

This visual indicator shows you're in AIX simulation mode!

### 3. Use AIX Commands Interactively
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

### 4. Ask Questions in Natural Language (AI Assistant)
If you have configured the OpenAI API key, you can ask questions in plain English:

**Option A: Interactive Mode** (Recommended)
```bash
# Enter interactive natural language interface
aixa

# Now just type naturally without 'ask' prefix:
Query> show disk space
Query> check memory
Query> list all disks
Query> quit  # to exit
```

**Option B: One-Time Questions**
```bash
# Use 'ask' command for single questions
ask how do I check disk space?
ask show me all running processes
ask what command lists physical volumes?
ask how to monitor system performance?
ask what's the difference between lspv and lsvg?

# Get help about the AI assistant
aixhelp
```

The AI will understand your question and suggest the appropriate AIX command with explanations!

**Note**: Once sourced, Linux commands like `top`, `fdisk`, `systemctl` will be disabled and suggest AIX alternatives.

### 3. Exit the Simulation
To exit and return to normal Linux environment:

**Option 1** (Recommended): Type `exit_aix` to restore your original prompt
```bash
exit_aix
```

**Option 2**: Close the terminal and open a new one

**Option 3**: Exit the current terminal session:
```bash
exit
```

The `exit_aix` command will cleanly exit the simulation and restore your original prompt without closing the terminal.

## 🤖 AI Assistant Features

The integrated OpenAI-powered assistant helps you learn AIX commands naturally:

### How It Works
- **Natural Language Understanding**: Ask questions in plain English
- **Smart Suggestions**: Get the right AIX command for your task
- **Contextual Help**: Receive explanations and usage examples
- **Learning Tool**: Understand why a command is used, not just what it is

### Interactive Mode (`aixa`)
The interactive mode provides a conversational interface where you can ask questions naturally without typing `ask` each time:

```bash
$ aixa
════════════════════════════════════════════════════════════
  AIX Natural Language Interface
════════════════════════════════════════════════════════════

Enter your queries in natural language.

📚 Special Commands:
  • 'explain <command>' - Get detailed info about a command
  • 'history' - View command history
  • 'clear' - Clear the screen
  • 'quit' or 'exit' - Stop the interface

💡 Try queries like: 'show disk space', 'check memory', 'list disks'

Query> show disk space

📚 Educational Info:
   Report file system disk space usage in gigabytes

   💡 Tip: Use df -g for GB, df -k for KB, df -m for MB

Command: df -g
────────────────────────────────────────────────────────────
Filesystem    GB blocks      Free %Used    Iused %Iused Mounted on
/dev/hd4           0.25      0.19   25%      567    11% /
...

Query> quit
```

### One-Time Questions (`ask`)
For quick questions without entering interactive mode:

```bash
ask how do I check available disk space?
# Returns: df -g with explanation

ask show me memory usage
# Returns: svmon -G with usage details

ask list all network interfaces
# Returns: ifconfig -a with examples

ask how to monitor CPU performance?
# Returns: topas or nmon with comparison
```

### Setup Requirements
- OpenAI API key (get from https://platform.openai.com/api-keys)
- `curl` and `jq` installed (usually pre-installed on most systems)
- Internet connection for API calls

### Commands Reference
- `aixa` - Enter interactive natural language mode (continuous conversation)
- `ask <question>` - Ask a single question and get command suggestion
- `aixhelp` - Show AI assistant help and status

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