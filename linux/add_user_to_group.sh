#!/bin/bash

read -p "Enter group name: " group
read -p "Enter username to add: " user

sudo gpasswd -a $user $group
echo "done"