@echo off
set MyServer=192.168.22.11
%SystemRoot%\system32\ping.exe -n 1 %MyServer% >nul
if errorlevel 1 goto NoServer

echo %MyServer% is available.
rem Insert commands here, for example one or more net use to connect network drives.


:NoServer
echo %MyServer% is not available yet.
pause
