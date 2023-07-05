# Curl
----------------------------
# msiexc

  - [Install From Current path]()
  - [Install From Special path]()
  - [install From UNC path]()
  ---------------------
  - [install with current path log]()
  - [install with Special path log]()
  
# wmic
- [https://ss64.com/nt/wmic.html](https://ss64.com/nt/wmic.html)

-Application
-  wmic product get name
  
-Service
- wmic service list brief
- wmic startup list brief
  
-Computer information
- wmic OS
- wmic computersystem get name,systemtype
- wmic path win32_physicalmedia get SerialNumber
  
-Resources
- WMIC COMPUTERSYSTEM GET MANUFACTURER
- wmic baseboard get product,Manufacturer,version,serialnumber
- wmic COMPUTERSYSTEM get TotalPhysicalMemory
- wmic CPU
- wmic process get workingsetsize,commandline
- wmic process list brief
- wmic partition get name,size,type

-Network
- wmic NETUSE
- wmic NIC
- wmic SHARE

:: List the OS build and version
WMIC OS LIST BRIEF

:: List the computername, locale and Bootdevice:
WMIC OS GET csname, locale, bootdevice /value

WMIC OS GET osarchitecture /value

:: Get a list of installed Windows updates on a remote machine, unlike Get-Hotfix, this includes the installation date.
WMIC /NODE:"server64" QFE list 

:: Get the local date and time
WMIC OS GET localdatetime

:: List all local Disks
WMIC LOGICALDISK where drivetype!=4 get deviceid, description, volumename

:: List ipv4 adapters 
WMIC NICCONFIG where (IPEnabled=True and TcpipNetbiosOptions!=null and TcpipNetbiosOptions!=2) GET caption,index,TcpipNetbiosOptions,IPEnabled

:: Disable Netbios
WMIC NICCONFIG where (IPEnabled=True and TcpipNetbiosOptions!=null and TcpipNetbiosOptions!=2) CALL SetTcpipNetbios 2

:: Dump the full application event log to a text file:
WMIC NTEVENT List Full >appevents.txt

:: List all the running services and save to a file
WMIC SERVICE where (state="running") GET caption, name, state > services.tsv

:: Stop the TELNET service (also StartService, PauseService,ResumeService)
WMIC SERVICE where caption='TELNET' CALL StopService

:: List the installed software MSI's
WMIC PRODUCT GET name,vendor,version
WMIC PRODUCT GET InstallDate, Name,localPackage 

:: Display Printer Status
WMIC PRINTER LIST brief
WMIC PRINTER LIST /?
WMIC PRINTER where PortName="LPT1:" GET PortName, Name, ShareName
 
WMIC /INTERACTIVE:ON PRINTER where PortName="LPT1:" DELETE

WMIC PROCESS where name='evil.exe' delete

WMIC /output:"%computername%.txt" MEMORYCHIP where "memorytype=17" get Capacity

WMIC /node:computer64,computer65 PROCESS call create "netstat.exe -ano > C:\output.txt"

WMIC /node:@computers.txt /failfast:on PROCESS call create "\\server\share\installer.cmd"

WMIC /node:computer64 /output:shares.html SHARE get name,path /format:htable

WMIC /node:computer64 SHARE where name="Share1" 

Interactive mode:
C:> WMIC
wmic:root\cli> OS get csname
wmic:root\cli> quit
