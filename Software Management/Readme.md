# Curl
  ```
curl -o %temp%\spf.msi http://192.168.1.10:3333/spf.msi
  ```
----------------------------
# msiexc

  - [Install From Current path]()
    ```
    msiexec /i "UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /lv "Agentinstalllog.txt
    ```
  - [Install From Special path]()
    ```
    msiexec /i "C:\Users\r.abedi.FARADIS\Desktop\localsetup\UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /lv "Agentinstalllog.txt
    ```
  - [install From UNC path]()
    ```
    msiexec /i "\\file\Softbank\Manage Engine Patch Manager\localsetup\UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /lv "Agentinstalllog.txt
    ```
  ---------------------
  - [install with current path log]()
    ```
    msiexec.exe /i "\\Server\Share\Setup.msi" /QN /L*V "msilog.log"
    ```
  - [install with Special path log]()
    ```
    msiexec.exe /i "\\Server\Share\Setup.msi" /QN /L*V "C:\Temp\msilog.log"
    ```
# wmic
- [https://ss64.com/nt/wmic.html](https://ss64.com/nt/wmic.html)
```
wmic product get name
```
```
wmic product where name="ManageEngine UEMS - Agent" call uninstall /nointeractive
```
### Examle

-Application
- wmic product get name
- WMIC PRODUCT GET name,vendor,version
- WMIC PRODUCT GET InstallDate, Name,localPackage 
  
-Service
- wmic service list brief
- wmic startup list brief
- WMIC SERVICE where (state="running") GET caption, name, state > services.tsv
  
-Computer information
- wmic OS
- WMIC OS LIST BRIEF
- WMIC OS GET localdatetime
- wmic computersystem get name,systemtype
- wmic path win32_physicalmedia get SerialNumber
  
-Resources
- WMIC COMPUTERSYSTEM GET MANUFACTURER
- wmic baseboard get product,Manufacturer,version,serialnumber
- wmic COMPUTERSYSTEM get TotalPhysicalMemory
- wmic CPU
- WMIC PROCESS where name='evil.exe' delete
- wmic process get workingsetsize,commandline
- wmic process list brief
- wmic partition get name,size,type
- WMIC LOGICALDISK where drivetype!=4 get deviceid, description, volumename

-Network
- wmic NETUSE
- wmic NIC
- wmic SHARE
- WMIC /node:computer64,computer65 PROCESS call create "netstat.exe -ano > C:\output.txt"
- WMIC /node:@computers.txt /failfast:on PROCESS call create "\\server\share\installer.cmd"
  ###### :: Get a list of installed Windows updates on a remote machine, unlike Get-Hotfix, this includes the installation date.
- WMIC /NODE:"server64" QFE list

-Printer
- WMIC PRINTER LIST brief
- WMIC PRINTER where PortName="LPT1:" GET PortName, Name, ShareName
- WMIC /INTERACTIVE:ON PRINTER where PortName="LPT1:" DELETE


 


### :: Disable Netbios
- WMIC NICCONFIG where (IPEnabled=True and TcpipNetbiosOptions!=null and TcpipNetbiosOptions!=2) CALL SetTcpipNetbios 2

### :: Stop the TELNET service (also StartService, PauseService,ResumeService)
- WMIC SERVICE where caption='TELNET' CALL StopService

-------------------------------------------------

# Setup.exe
- [https://www.advancedinstaller.com/silent-install-exe-msi-applications.html](https://www.advancedinstaller.com/silent-install-exe-msi-applications.html)

- Support Silent Installation
  
```
Setup.exe /VERYSILENT /NORESTART
```
```
cd /d d:\ && .\LocalOffice_Agent.exe /VERYSILENT /NORESTART
```
```
cd /d "%temp%" && .\LocalOffice_Agent.exe /VERYSILENT /NORESTAR
del /f "%temp%\LocalOffice_Agent.exe"
```

- No Support for Silent Installation
###### USE Advanced Installer EXE setup
- [Advanced Installer Architect](https://p30download.ir/fa/entry/12256/advanced-installer)

![image](https://github.com/rezaabedi1365/bat/assets/117336743/1cd4e1a4-4cea-4a7c-be85-78b1df650b6f)

![image](https://github.com/rezaabedi1365/bat/assets/117336743/001cbed7-353b-4716-ba9c-835e4f7fa4ae)

--------------------------------------------------

# psexec
- [https://learn.microsoft.com/en-us/sysinternals/downloads/psexec](https://learn.microsoft.com/en-us/sysinternals/downloads/psexec)
  
```
C:\apps\tools\psexec \\%RemoteHostName% -u %Domain%\%userName% -p %userPassword% -accepteula -d -h -i 1 cmd.exe /c 	"cd C:\apps\test\ & echo Hello World" & call C:\apps\test\script.bat
```

     
