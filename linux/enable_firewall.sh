#!/bin/bash

# Enable UFW
ufw enable

# Allow necessary services
ufw allow ssh
ufw allow http
ufw allow https

# Deny all other traffic by default
ufw default deny incoming
ufw default allow outgoing

# Reload UFW to apply rules
ufw reload
