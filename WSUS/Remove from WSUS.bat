net stop wuauserv 

REG DELETE
"\\%computername%\HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"

net start wuauserv 
