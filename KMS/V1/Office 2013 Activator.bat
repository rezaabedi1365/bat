@echo off
title Office 2013 Activator
call :isAdmin
if %errorlevel% == 0 (
goto :run
) else (
echo Requesting administrative privileges...
goto :UACPrompt
)
exit /b
:isAdmin
fsutil dirty query %systemdrive% >nul
exit /b
:run
cd C:\Program Files\Microsoft Office\Office15
cscript ospp.vbs /sethst:activator.faratest.net
cscript ospp.vbs /act
exit /b
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B`
pause
