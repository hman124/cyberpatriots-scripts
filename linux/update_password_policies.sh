#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# File to modify
FILE="/etc/login.defs"

# Backup the original file
if [ ! -f "${FILE}.bak" ]; then
  echo "Creating a backup of the original file..."
  cp "$FILE" "${FILE}.bak"
  echo "Backup created at ${FILE}.bak"
fi

# Update PASS_MIN_DAYS to 2
echo "Updating PASS_MIN_DAYS to 2..."
sed -i 's/^PASS_MIN_DAYS\s*[0-9]*/PASS_MIN_DAYS 2/' "$FILE"

# Confirm the change
echo "Updated file content:"
grep "^PASS_MIN_DAYS" "$FILE"

echo "Minimum password age has been successfully updated to 2 days."
