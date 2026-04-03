#!/bin/bash

# ==========================================================
# Script 3 — Disk and Permission Auditor
# ==========================================================
# Name            : Mahiman Seetha
# Registration No : 24MIP10135
# ==========================================================
# Purpose:
# This script checks important Linux system directories.
# It displays:
# - Permissions
# - Owner and Group
# - Disk usage of each directory
# It also specifically detects the kernel modules directory
# and reports its details separately.
#
# Screenshot Description:
# The output shows a list of directories. For each directory,
# permissions, owner, group, and disk usage are displayed.
# If the kernel modules directory is found, it is highlighted
# with a special message.
#
# Concepts Used:
# - Arrays in Bash
# - for loop
# - if-then condition
# - ls -ld with awk
# - du -sh with cut
# ==========================================================

# -------- ARRAY OF DIRECTORIES --------

DIRS=(
    "/bin"
    "/etc"
    "/home"
    "/usr"
    "/var"
    "/lib/modules"
)

echo "=============================================="
echo "     DISK AND PERMISSION AUDITOR REPORT"
echo "=============================================="

# -------- LOOP THROUGH DIRECTORIES --------

for DIR in "${DIRS[@]}"
do
    echo "----------------------------------------------"
    echo "Directory: $DIR"

    # Check if directory exists
    if [ -d "$DIR" ]; then

        # Get permissions, owner, group
        DETAILS=$(ls -ld "$DIR")
        PERMS=$(echo "$DETAILS" | awk '{print $1}')
        OWNER=$(echo "$DETAILS" | awk '{print $3}')
        GROUP=$(echo "$DETAILS" | awk '{print $4}')

        # Get disk usage
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "Permissions : $PERMS"
        echo "Owner       : $OWNER"
        echo "Group       : $GROUP"
        echo "Disk Usage  : $SIZE"

        # Special check for kernel modules directory
        if [[ "$DIR" == "/lib/modules" ]]; then
            echo ">>> Kernel Modules Directory Found!"
            echo "This directory contains kernel module files."
        fi

    else
        echo "Directory does NOT exist."
    fi

done

echo "=============================================="

# End of Script
