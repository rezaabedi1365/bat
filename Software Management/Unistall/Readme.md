## Method 1:
```
#"%ProgramFiles%\WinRAR\uninstall.exe" /S
cd %ProgramFiles%\WinRAR & uninstall.exe /S
```

-----------------------------------------------------------------------------
## wmic
```
#wmic product get name  
wmic product where name="ManageEngine UEMS - Agent" call uninstall /nointeractive
```
#https://www.urtech.ca/2019/09/solved-command-line-to-uninstall-software-exes-or-msis/
#Also note that wild cards can be used with WMIC but the command is slightly different:
wmic product where "name like '<PROGRAM NAME HERE>%%'" call uninstall

#You also may want to clean up the installation folder, if it still exists using:
rd /s /q C:\Program Files\<PROGRAM FOLDER NAME HERE>

#ReturnValue = 1603;  dont have administrator permision
#ReturnValue = 0;  remove successfuly
```
reg delete "HKEY_CLASSES_ROOT\Installer\Products\4749502044BC37C4AA96A71CAA2D661D" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\4749502044BC37C4AA96A71CAA2D661D" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\4749502044BC37C4AA96A71CAA2D661D" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{41F12F70-5FA9-43F5-94F4-53B54EB4EEC4}" /f
```
---------------------------------------------------------------------------

## Uninstall Using the Installation MSI
```
msiexec /x <PROGRAM NAME HERE>.msi /q
```
--------------------------------------
## Uninstall a Program using PowerShell
```
$app = Get-WmiObject -Class Win32_Product -Filter "Name = '<PROGRAM NAME HERE>'"
$app.Uninstall()
```

