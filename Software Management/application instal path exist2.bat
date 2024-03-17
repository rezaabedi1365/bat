@echo off

REM check if Barracuda Add-In is already installed
if exist "C:\Program Files (x86)\Barracuda\Message Archiver\Outlook Add-In\BmaSearch.exe" (
GOTO UNINSTALL
) else (

if exist "C:\Program Files\Barracuda\Message Archiver\Outlook Add-In\BmaSearch.exe" (
GOTO UNINSTALL
)}

EXIT
REM EXIT or else you will go to UNINSTALL whether or not the file exists!

:UNINSTALL

REM UINSTALL ADDON
echo UnInstalling
msiexec /x \\qpaynet.local\sysvol\QpayNet.local\Policies\{B7D55D1D-7D20-46EB-92F9-FEB42BABC41E}\Machine\Applications\BmaOutlookAddIn-3.6.20.0_x86.msi /quiet

REM You don't need this
REM exit 
