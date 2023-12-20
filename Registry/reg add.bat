#https://www.windowscentral.com/how-edit-registry-using-command-prompt-windows-10
#/t Type: Specifies the type of registry entries. Here's the list of valid types: REG_SZ, REG_MULTI_SZ, REG_DWORD_BIG_ENDIAN, REG_DWORD, REG_BINARY, REG_DWORD_LITTLE_ENDIAN, REG_LINK, REG_FULL_RESOURCE_DESCRIPTOR, and REG_EXPAND_SZ.


reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 4458 /f 
