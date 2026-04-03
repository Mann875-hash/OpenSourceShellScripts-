#!/bin/bash

# ==========================================================
# Script 2 — Package Information & Open Source Note
# ==========================================================
# Name            : Mahiman Seetha
# Registration No : 24MIP10135
# ==========================================================

# -------- VARIABLES --------

# Automatically find an installed linux-image package
PACKAGE=$(dpkg -l | grep '^ii' | grep linux-image | awk '{print $2}' | head -n 1)

ARCH=$(uname -m)
OS=$(uname -o)

# -------- CHECK PACKAGE INSTALLATION --------

if [ -n "$PACKAGE" ]; then

    echo "=============================================="
    echo "        PACKAGE INFORMATION REPORT"
    echo "=============================================="
    echo "Package Name       : $PACKAGE"

    # Extract version
    VERSION=$(dpkg -l | grep "^ii  $PACKAGE" | awk '{print $3}')
    echo "Version            : $VERSION"

    # License
    LICENSE="GNU General Public License v2 (GPLv2)"
    echo "License            : $LICENSE"

    echo "----------------------------------------------"
    echo "System Architecture: $ARCH"
    echo "Operating System   : $OS"
    echo "----------------------------------------------"

    # -------- CASE STATEMENT --------

    case "$PACKAGE" in
        linux-image*)
            echo "Open Source Note:"
            echo "The Linux kernel represents freedom and collaboration."
            echo "It is developed openly and shared globally."
            ;;
        *)
            echo "Open Source Note:"
            echo "This package follows open-source principles."
            ;;
    esac

    echo "=============================================="

else
    echo "=============================================="
    echo "No Linux kernel package found using dpkg."
    echo "This may be due to a restricted or online environment."
    echo "=============================================="
fi

# End of Script
