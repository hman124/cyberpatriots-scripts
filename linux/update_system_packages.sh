#!/bin/bash

# Update package list and upgrade all packages
apt update && apt upgrade -y

# Remove unnecessary packages
apt autoremove -y
