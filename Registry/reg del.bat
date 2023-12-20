# HKEY_CLASSES_ROOT=HKCR , HKEY_CURRENT_USER=HKCU , HKEY_LOCAL_MACHINE=HKLM  , HKEY_USERS=HKU , HKEY_CURRENT_CONFIG=HKCC 

#reg delete  Registry_key_path /v Registry_value_name /f
#reg delete  Registry_key_path /f
#If the registry key has space in its name, you can use double quotes as below.
#reg delete  "Registry_key_path" /v Registry_value_name /f

reg delete  "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" /f
