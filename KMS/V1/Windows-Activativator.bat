@echo off
title Windows Activator - faratest.net
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
slmgr /skms activator.faradis.net
slmgr /ato
exit /b
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B`
