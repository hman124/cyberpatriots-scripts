:: List all user accounts
@echo off
net user

:: Check for accounts without passwords
echo "Accounts with blank passwords:"
echo for /F "delims=" %%A in ('net user') do net user "%%A" | findstr /C:"Password required"

pause
