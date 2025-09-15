#!/bin/bash
# AIX Lab Simulation - Quick Setup Script
# This script helps you get started with the AIX simulation environment

echo "================================================="
echo "🚀 AIX Lab Simulation - Quick Setup"
echo "================================================="
echo

# Check if we're in the right directory
if [[ ! -f "aix_simulation.sh" ]]; then
    echo "❌ Error: aix_simulation.sh not found in current directory"
    echo "Please run this script from the AIX-Lab-Simulation directory"
    exit 1
fi

echo "✅ Found aix_simulation.sh"

# Make simulation script executable
echo "🔧 Making simulation script executable..."
chmod +x aix_simulation.sh
echo "✅ Execute permissions set"

echo
echo "================================================="
echo "🎯 Getting Started"
echo "================================================="
echo

echo "1. To start the AIX simulation, run:"
echo "   source ./aix_simulation.sh"
echo

echo "2. Try these example commands:"
echo "   oslevel -r        # Check AIX version"
echo "   lspv              # List physical volumes"
echo "   lsvg -l rootvg    # List logical volumes"
echo "   df -g             # File system usage"
echo "   topas             # Performance monitor"
echo "   ps -ef            # List processes"
echo

echo "3. For comprehensive command reference, check:"
echo "   cat aix_cheatsheet.txt"
echo

echo "================================================="
echo "🚀 Auto-Starting Simulation..."
echo "================================================="
echo

# Source the simulation automatically
source ./aix_simulation.sh

echo
echo "================================================="
echo "🎓 Quick Demo - Try these commands now:"
echo "================================================="
echo

# Run some demo commands
echo "🔍 Checking AIX version:"
echo "Command: oslevel -r"
oslevel -r
echo

echo "🔍 Listing physical volumes:"
echo "Command: lspv"
lspv
echo

echo "🔍 Checking file system usage:"
echo "Command: df -g"
df -g
echo

echo "================================================="
echo "✅ Setup Complete!"
echo "================================================="
echo
echo "📚 Next steps:"
echo "• Run 'cat README.md' for detailed documentation"
echo "• Run 'cat aix_cheatsheet.txt' for command reference"
echo "• Practice with different AIX commands"
echo "• Try 'lsvg -l rootvg' to see logical volumes"
echo "• Use 'topas' for performance monitoring"
echo
echo "🎯 Remember: This is a learning simulation - commands produce"
echo "   realistic AIX output but don't affect your actual system!"
echo
echo "Happy learning! 🚀"