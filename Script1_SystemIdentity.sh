#!/bin/bash

# ==========================================================
# Script 1 — System Identity Report
# ==========================================================
# Purpose:
# This script displays a welcome screen with system information.
# It shows:
# - Linux distribution name
# - Kernel version
# - Current logged-in user
# - User's home directory
# - System uptime
# - Current date and time
# - Kernel license information (GPL v2)
#
# Screenshot Description:
# The output appears as a neatly formatted report on the terminal.
# It begins with a header line, followed by system details listed
# line-by-line, and ends with a license message.
#
# Concepts Used:
# - Variables: to store system information
# - Command Substitution: using $(...) to capture command output
# - echo: to display formatted output
# ==========================================================

# -------- VARIABLES --------

STUDENT_NAME="Your Name"

# Command substitution to capture system details
KERNEL=$(uname -r)
DISTRO=$(lsb_release -d | cut -f2)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date)

# -------- OUTPUT --------

echo "=============================================="
echo "        SYSTEM IDENTITY REPORT"
echo "=============================================="
echo "Student Name       : $STUDENT_NAME"
echo "Distribution       : $DISTRO"
echo "Kernel Version     : $KERNEL"
echo "Logged-in User     : $USER_NAME"
echo "Home Directory     : $HOME_DIR"
echo "System Uptime      : $UPTIME"
echo "Current Date/Time  : $CURRENT_DATE"
echo "----------------------------------------------"
echo "Kernel License     : GNU General Public License v2 (GPLv2)"
echo "=============================================="

# End of Script
