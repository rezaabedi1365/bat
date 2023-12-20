# HKEY_CLASSES_ROOT=HKCR , HKEY_CURRENT_USER=HKCU , HKEY_LOCAL_MACHINE=HKLM  , HKEY_USERS=HKU , HKEY_CURRENT_CONFIG=HKCC 


@echo off

#reg export [registry path] [path to store backup] /y

reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" c:\KMS_Registry_backup.reg /y
 
reg export HKCR C:RegBackHKCR.Reg /y

reg export HKCU C:RegBackHKCU.Reg /y

reg export HKLM C:RegBackHKLM.Reg /y

reg export HKU C:RegBackHKU.Reg /y

reg export HKCC C:RegBackHKCC.Reg /y
