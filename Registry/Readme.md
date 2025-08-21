## Reg Query
```
reg query "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v Type
```
<img width="580" height="43" alt="image" src="https://github.com/user-attachments/assets/01eb855f-69c7-4069-942b-b85c4a7bf75c" />


## Reg Export
```
reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" c:\KMS_Registry_backup.reg /y
```
- reg export in default overwrite but you can use >> for append
```
@echo off
reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" C:\RegBack\Backup.reg /y
reg export "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" >> C:\RegBack\Backup.reg /y
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" >> C:\RegBack\Backup.reg /y
pause
```

## Reg Add
```
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 4458 /f 
```
- Change remote desktop port
```
@echo off
set /p RDP= what port do you want set for Remote Desktop?
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d %RDP% /f 
pause
```
- windows auto login
```
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /t REG_SZ /d faratest /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d conference /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d 123456aA /f
```

## Reg dell
```
reg delete  "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" /f
```
