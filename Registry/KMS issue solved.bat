@echo off
REM ***remove last activation***
	REM slmgr /upk
	REM slmgr /cpky
	REM slmgr /rearm

reg export  "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" c:\KMS_Registry_backup.reg /y
reg delete  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\55c92734-d682-4d71-983e-d6ec3f16059f\ef6cfc9f-8c5d-44ac-9aad-de6a2ea0ae03" /v KeyManagementServiceName /t REG_SZ /d 172.16.1.16 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\55c92734-d682-4d71-983e-d6ec3f16059f\ef6cfc9f-8c5d-44ac-9aad-de6a2ea0ae03" /v KeyManagementServicePort /t REG_SZ /d 1688 /f 

slmgr /skms 172.16.1.16
slmgr /ato

pause
