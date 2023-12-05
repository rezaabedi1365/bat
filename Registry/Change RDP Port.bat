@echo off
set /p RDP= what port do you want set for Remote Desktop?
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d %RDP% /f 
pause
