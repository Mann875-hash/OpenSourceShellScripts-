#!/bin/bash

# ==========================================================
# Script 4 — Log File Analyzer (Online Compiler Ready)
# ==========================================================
# Name            : Mahiman Seetha
# Registration No : 24MIP10135
# ==========================================================
# Purpose:
# This script analyzes a log file and searches for a keyword.
# Designed to work in any environment, including online compilers.
# It:
# - Counts keyword occurrences
# - Displays the last 5 matching lines
# ==========================================================

# -------- COMMAND-LINE ARGUMENTS --------
LOG_FILE=${1:-"sample.log"}       # Default sample log file
KEYWORD=${2:-"error"}             # Default keyword

# -------- CREATE SAMPLE LOG FILE IF NOT EXISTS --------
if [ ! -f "$LOG_FILE" ]; then
    cat <<EOF > "$LOG_FILE"
System started successfully
Error: failed to load module
User login successful
Warning: low disk space
Error: connection timeout
Service started
ERROR: disk failure detected
User logout
EOF
    echo "Sample log file '$LOG_FILE' created."
fi

# -------- INITIALIZE COUNTER AND MATCHES --------
COUNT=0
MATCHES=""

# -------- READ FILE LINE BY LINE --------
while IFS= read -r LINE
do
    echo "$LINE" | grep -i "$KEYWORD" > /dev/null
    if [ $? -eq 0 ]; then
        COUNT=$((COUNT + 1))
        MATCHES+="$LINE"$'\n'
    fi
done < "$LOG_FILE"

# -------- OUTPUT RESULT --------
echo "=============================================="
echo "           LOG FILE ANALYSIS REPORT"
echo "=============================================="
echo "Log File   : $LOG_FILE"
echo "Keyword    : $KEYWORD"
echo "----------------------------------------------"
echo "Total Matches Found: $COUNT"
echo "----------------------------------------------"
echo "Last 5 Matching Lines:"
echo "----------------------------------------------"
echo -e "$MATCHES" | tail -n 5
echo "=============================================="

# End of Script
