@echo off
:: Set the account lockout threshold to 10 failed login attempts

echo Configuring account lockout threshold to 10 failed attempts...

:: Use the net accounts command to set the policy
net accounts /lockoutthreshold:10

:: Display the updated settings
net accounts

echo Account lockout threshold has been configured to 10 attempts.
pause
