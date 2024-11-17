@echo off
:: Set the maximum password age to 90 days

echo Setting maximum password age to 90 days...

:: Use the net accounts command to configure the policy
net accounts /maxpwage:90

:: Display the updated settings
net accounts

echo Maximum password age has been set to 90 days.
pause
