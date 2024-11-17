#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Step 1: Create /usr/share/pam-configs/faillock file
echo "Creating /usr/share/pam-configs/faillock file..."
touch /usr/share/pam-configs/faillock

# Step 2: Write content to /usr/share/pam-configs/faillock
echo "Writing content to /usr/share/pam-configs/faillock..."
cat <<EOL > /usr/share/pam-configs/faillock
Name: Enforce failed login attempt counter
Default: no
Priority: 0
Auth-Type: Primary
Auth:
[default=die] pam_faillock.so authfail
sufficient pam_faillock.so authsucc
EOL

# Step 3: Create /usr/share/pam-configs/faillock_notify file
echo "Creating /usr/share/pam-configs/faillock_notify file..."
touch /usr/share/pam-configs/faillock_notify

# Step 4: Write content to /usr/share/pam-configs/faillock_notify
echo "Writing content to /usr/share/pam-configs/faillock_notify..."
cat <<EOL > /usr/share/pam-configs/faillock_notify
Name: Notify on failed login attempts
Default: no
Priority: 1024
Auth-Type: Primary
Auth:
requisite pam_faillock.so preauth
EOL

# Step 5: Run pam-auth-update to apply changes
echo "Running pam-auth-update to apply PAM changes..."
pam-auth-update --force

# Step 6: Prompt user to manually select options during pam-auth-update (this will happen interactively)
echo "Please manually select the following options in the pam-auth-update interface:"
echo " - Notify on failed login attempts"
echo " - Enforce failed login attempt counter"
echo "Then, select <OK> to apply changes."

echo "Done! After completing the selection in pam-auth-update, the changes will take effect."
