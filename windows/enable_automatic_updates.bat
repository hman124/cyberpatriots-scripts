@echo off
:: Enable "Configure Automatic Updates" equivalent in the Registry

echo Configuring Automatic Updates...

:: Create the Windows Update policy path in the Registry
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /f

:: Set the "Configure Automatic Updates" policy to Enabled
:: Value 4 means "Auto download and schedule the install"
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 4 /f

:: Optional: Set the install day (0 = Every day, 1-7 = Sunday-Saturday)
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t REG_DWORD /d 0 /f

:: Optional: Set the install time (in 24-hour format)
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t REG_DWORD /d 3 /f

echo Automatic Updates have been configured successfully.

:: Refresh Group Policy
gpupdate /force

pause
