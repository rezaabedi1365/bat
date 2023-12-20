# HKEY_CLASSES_ROOT=HKCR , HKEY_CURRENT_USER= , HKEY_LOCAL_MACHINE=  , HKEY_USERS= , HKEY_CURRENT_CONFIG= 

#reg delete  Registry_key_path /v Registry_value_name /f
#reg delete  Registry_key_path /f
#If the registry key has space in its name, you can use double quotes as below.
#reg delete  "Registry_key_path" /v Registry_value_name /f

reg delete  "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SppExtComObj.exe" /f
