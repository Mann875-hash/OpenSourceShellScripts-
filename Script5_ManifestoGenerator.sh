#!/bin/bash

# ==========================================================
# Script 5 — Open Source Manifesto Generator
# ==========================================================
# Name            : Mahiman Seetha
# Registration No : 24MIP10135
# ==========================================================
# Purpose:
# This script asks the user three questions about their
# thoughts on open source and generates a personalized
# manifesto paragraph. The manifesto is saved in a text
# file named after the user.
#
# Screenshot Description:
# The script interacts with the user via prompts, creates
# a text file with their name, and displays the content.
#
# Concepts Used:
# - read -p for user input
# - String concatenation within echo statements
# - Writing to file with > and >>
# - date command for current date
# - cat to display file contents
# - alias concept mentioned in comments
# ==========================================================

# -------- USER INPUT --------

read -p "Enter your name: " USER_NAME
read -p "What is your favorite aspect of open source? " ASPECT
read -p "How do you contribute or want to contribute to open source? " CONTRIBUTION
read -p "Why is open source important to you? " IMPORTANCE

# -------- CREATE FILE --------
FILE_NAME="${USER_NAME// /_}_manifesto.txt"  # Replace spaces in filename with underscores

# -------- GENERATE MANIFESTO --------
echo "Open Source Manifesto for $USER_NAME" > "$FILE_NAME"
echo "Generated on: $(date)" >> "$FILE_NAME"
echo "----------------------------------------" >> "$FILE_NAME"
echo "" >> "$FILE_NAME"

echo "My favorite aspect of open source is: $ASPECT." >> "$FILE_NAME"
echo "I contribute or plan to contribute by: $CONTRIBUTION." >> "$FILE_NAME"
echo "Open source is important to me because: $IMPORTANCE." >> "$FILE_NAME"

echo "" >> "$FILE_NAME"
echo "This is my personalized open source manifesto!" >> "$FILE_NAME"

# -------- DISPLAY FILE --------
echo "----------------------------------------"
echo "Your manifesto has been saved in '$FILE_NAME'."
echo "Here is your open source manifesto:"
echo "----------------------------------------"
cat "$FILE_NAME"

# -------- NOTES ON ALIAS CONCEPT --------
# You could create an alias to quickly display your manifesto:
# alias show_manifesto='cat ~/path_to_manifesto/${USER_NAME}_manifesto.txt'
# ==========================================================

# End of Script
