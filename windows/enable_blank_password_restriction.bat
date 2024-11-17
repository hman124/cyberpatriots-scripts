@echo off
:: Enable "Limit local account use of blank passwords to console logon only"

echo Configuring security policy to restrict blank password use...

:: Set the registry key to enable the policy
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 1 /f

echo Security policy has been configured successfully.

pause
