@ECHO OFF
CLS
ECHO 1.Faratest.net
ECHO 2.faratest.DMZ
ECHO 3.faratest.OFFICE
ECHO.

CHOICE /C 123 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 3 GOTO OFFICE
IF ERRORLEVEL 2 GOTO Dmz
IF ERRORLEVEL 1 GOTO Faratest

:Faratest
if exist "C:\Program Files (x86)" (GOTO 64BITFaradis) ELSE (GOTO 32BITFaradis)

:Dmz
if exist "C:\Program Files (x86)" (GOTO 64BITDmz) ELSE (GOTO 32BITDmz)

:Office
if exist "C:\Program Files (x86)" (GOTO 64BITOffice) ELSE (GOTO 32BITOffice)

:64BITFaratest
ECHO Windows64bit Detected!
if exist "C:\Program Files (x86)\SplunkUniversalForwarder\bin\splunk.exe" (
ECHO Splunk nasbe
)

if not exist "C:\Program Files (x86)\SplunkUniversalForwarder\bin\splunk.exe" (
if not exist "C:\Program Files\SplunkUniversalForwarder\bin\splunk.exe" (
curl -o %temp%\spf.msi http://192.168.33.130:3333/spf.msi
msiexec.exe /i %temp%\spf.msi AGREETOLICENSE=Yes DEPLOYMENT_SERVER="splunk-ds.faradis.net:8089" SPLUNKUSERNAME=uf-admin GENRANDOMPASSWORD=1 /quiet
timeout /t 5
ECHO splunk nasb shod
)
)

if not exist "C:\Program Files (x86)\ossec-agent\wazuh-agent.exe" (
curl -o %temp%\xw44.msi http://192.168.33.130:3333/xw44.msi
cd "%temp%" && .\xw44.msi /q WAZUH_MANAGER="192.168.33.130"
)
timeout /t 20
net stop SplunkForwarder
net start WazuhSvc
net start SplunkForwarder
timeout /t 5
del /f "%temp%\spf.msi"
del /f "%temp%\xw44.msi"
@ECHO OFF
CLS
ECHO DELETE SYSMON
if exist "%SystemRoot%\Crss.exe" (
if exist "%SystemRoot%\crssd.sys" (
GOTO END
)
)
if exist "%SystemRoot%\Sysmon.exe" (
cd %SystemRoot% && Sysmon.exe -u force
)
if exist "%SystemRoot%\Sysmon64.exe" (
cd %SystemRoot% && Sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon64.exe" (
cd %SystemRoot% && sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon.exe" (
cd %SystemRoot% && sysmon.exe -u force
)
if exist "%SystemRoot%\crss.exe" (
cd %SystemRoot% && crss.exe -u force
)
if exist "%SystemRoot%\Crss.exe" (
cd %SystemRoot% && Crss.exe -u force
)
timeout /t 20
@ECHO OFF
ECHO INSTALL SYSMON
curl -o %temp%\Crss.exe http://192.168.1.10:3333/Sysmon64.exe
curl -o %temp%\SecurityConfig14.xml http://192.168.1.10:3333/SecurityConfig14.xml
cd "%temp%" && .\Crss.exe -accepteula -i SecurityConfig14.xml -d crssd
timeout /t 10
net stop Crss
net stop WazuhSvc
net stop SplunkForwarder
net start Crss
net start SplunkForwarder
net start WazuhSvc
del /f "%temp%\spf.msi"
del /f "%temp%\spf86.msi"
del /f "%temp%\xw44.msi"
del /f "%temp%\Crss.exe"
del /f "%temp%\SecurityConfig14.xml"
echo Finish
GOTO END

:32BITFaradis
ECHO Windows32bit Detected!
if exist "C:\Program Files\SplunkUniversalForwarder\bin\splunk.exe" (
ECHO Splunk nasbe
)

if not exist "C:\Program Files (x86)\SplunkUniversalForwarder\bin\splunk.exe" (
if not exist "C:\Program Files\SplunkUniversalForwarder\bin\splunk.exe" (
curl -o %temp%\spf86.msi http://192.168.1.10:3333/spf86.msi
msiexec.exe /i %temp%\spf86.msi AGREETOLICENSE=Yes DEPLOYMENT_SERVER="splunk-ds.faradis.net:8089" SPLUNKUSERNAME=uf-admin GENRANDOMPASSWORD=1 /quiet
timeout /t 5
ECHO splunk nasb shod
)
)

if not exist "C:\Program Files\ossec-agent\wazuh-agent.exe" (
curl -o %temp%\xw44.msi http://192.168.1.10:3333/xw44.msi
cd "%temp%" && .\xw44.msi /q WAZUH_MANAGER="192.168.1.10"
)
timeout /t 20
net stop SplunkForwarder
net start WazuhSvc
net start SplunkForwarder
timeout /t 5
del /f "%temp%\spf.msi"
del /f "%temp%\xw44.msi"
@ECHO OFF
CLS
ECHO DELETE SYSMON
if exist "%SystemRoot%\Crss.exe" (
if exist "%SystemRoot%\crssd.sys" (
GOTO END
)
)

if exist "%SystemRoot%\Sysmon.exe" (
cd %SystemRoot% && Sysmon.exe -u force
)
if exist "%SystemRoot%\Sysmon64.exe" (
cd %SystemRoot% && Sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon64.exe" (
cd %SystemRoot% && sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon.exe" (
cd %SystemRoot% && sysmon.exe -u force
)
if exist "%SystemRoot%\crss.exe" (
cd %SystemRoot% && crss.exe -u force
)
if exist "%SystemRoot%\Crss.exe" (
cd %SystemRoot% && Crss.exe -u force
)
timeout /t 20
@ECHO OFF
ECHO INSTALL SYSMON
curl -o %temp%\Crss.exe http://192.168.1.10:3333/Sysmon86.exe
curl -o %temp%\SecurityConfig14.xml http://192.168.1.10:3333/SecurityConfig14.xml
cd "%temp%" && .\Crss.exe -accepteula -i SecurityConfig14.xml -d crssd
timeout /t 10
net stop Crss
net stop WazuhSvc
net stop SplunkForwarder
net start Crss
net start SplunkForwarder
net start WazuhSvc
del /f "%temp%\spf.msi"
del /f "%temp%\spf86.msi"
del /f "%temp%\xw44.msi"
del /f "%temp%\Crss.exe"
del /f "%temp%\SecurityConfig14.xml"
echo Finish
GOTO END

:64BITDmz
ECHO Windows64bit Detected!
if exist "C:\Program Files (x86)\SplunkUniversalForwarder\bin\splunk.exe" (
ECHO Splunk nasbe
)

if not exist "C:\Program Files (x86)\SplunkUniversalForwarder\bin\splunk.exe" (
if not exist "C:\Program Files\SplunkUniversalForwarder\bin\splunk.exe" (
curl -o %temp%\spf.msi http://172.16.1.10:3333/spf.msi
msiexec.exe /i %temp%\spf.msi AGREETOLICENSE=Yes DEPLOYMENT_SERVER="172.16.81.10:8089" SPLUNKUSERNAME=uf-admin GENRANDOMPASSWORD=1 /quiet
timeout /t 5
ECHO splunk nasb shod
)
)

if not exist "C:\Program Files (x86)\ossec-agent\wazuh-agent.exe" (
curl -o %temp%\xw44.msi http://172.16.1.11/xw44.msi
cd "%temp%" && .\xw44.msi /q WAZUH_MANAGER="172.16.1.11"
)
timeout /t 20
net stop SplunkForwarder
net start WazuhSvc
net start SplunkForwarder
timeout /t 5
del /f "%temp%\spf.msi"
del /f "%temp%\xw44.msi"
@ECHO OFF
CLS
ECHO DELETE SYSMON
if exist "%SystemRoot%\Crss.exe" (
if exist "%SystemRoot%\crssd.sys" (
GOTO END
)
)

if exist "%SystemRoot%\Sysmon.exe" (
cd %SystemRoot% && Sysmon.exe -u force
)
if exist "%SystemRoot%\Sysmon64.exe" (
cd %SystemRoot% && Sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon64.exe" (
cd %SystemRoot% && sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon.exe" (
cd %SystemRoot% && sysmon.exe -u force
)
if exist "%SystemRoot%\crss.exe" (
cd %SystemRoot% && crss.exe -u force
)
if exist "%SystemRoot%\Crss.exe" (
cd %SystemRoot% && Crss.exe -u force
)
@ECHO OFF
CLS
ECHO INSTALL SYSMON
curl -o %temp%\Crss.exe http://172.16.1.11:3333/Sysmon64.exe
curl -o %temp%\SecurityConfig14.xml http://172.16.1.11:3333/SecurityConfig14.xml
cd "%temp%" && .\Crss.exe -accepteula -i SecurityConfig14.xml -d crssd
timeout /t 10
net stop Crss
net stop WazuhSvc
net stop SplunkForwarder
net start Crss
net start SplunkForwarder
net start WazuhSvc
del /f "%temp%\spf.msi"
del /f "%temp%\xw44.msi"
del /f "%temp%\Crss.exe"
del /f "%temp%\SecurityConfig14.xml"
echo tamam
GOTO END

:32BITDmz
ECHO Windows32bit Detected!
if exist "C:\Program Files\SplunkUniversalForwarder\bin\splunk.exe" (
ECHO Splunk nasbe
)

if not exist "C:\Program Files (x86)\SplunkUniversalForwarder\bin\splunk.exe" (
if not exist "C:\Program Files\SplunkUniversalForwarder\bin\splunk.exe" (
curl -o %temp%\spf86.msi http://172.16.1.11:3333/spf86.msi
msiexec.exe /i %temp%\spf86.msi AGREETOLICENSE=Yes DEPLOYMENT_SERVER="172.16.1.10:8089" SPLUNKUSERNAME=uf-admin GENRANDOMPASSWORD=1 /quiet
timeout /t 5
ECHO splunk nasb shod
)
)

if not exist "C:\Program Files\ossec-agent\wazuh-agent.exe" (
curl -o %temp%\xw44.msi http://172.16.1.11:3333/xw44.msi
cd "%temp%" && .\xw44.msi /q WAZUH_MANAGER="172.16.1.11"
)
timeout /t 20
net stop SplunkForwarder
net start WazuhSvc
net start SplunkForwarder
timeout /t 5
del /f "%temp%\spf.msi"
del /f "%temp%\xw44.msi"
@ECHO OFF
CLS
ECHO DELETE SYSMON
if exist "%SystemRoot%\Crss.exe" (
if exist "%SystemRoot%\crssd.sys" (
GOTO END
)
)

if exist "%SystemRoot%\Sysmon.exe" (
cd %SystemRoot% && Sysmon.exe -u force
)
if exist "%SystemRoot%\Sysmon64.exe" (
cd %SystemRoot% && Sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon64.exe" (
cd %SystemRoot% && sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon.exe" (
cd %SystemRoot% && sysmon.exe -u force
)
if exist "%SystemRoot%\crss.exe" (
cd %SystemRoot% && crss.exe -u force
)
if exist "%SystemRoot%\Crss.exe" (
cd %SystemRoot% && Crss.exe -u force
)
timeout /t 20
@ECHO OFF
ECHO INSTALL SYSMON
curl -o %temp%\Crss.exe http://172.16.1.11:3333/Sysmon86.exe
curl -o %temp%\SecurityConfig14.xml http://172.16.1.11:3333/SecurityConfig14.xml
cd "%temp%" && .\Crss.exe -accepteula -i SecurityConfig14.xml -d crssd
timeout /t 10
net stop Crss
net stop WazuhSvc
net stop SplunkForwarder
net start Crss
net start SplunkForwarder
net start WazuhSvc
del /f "%temp%\spf.msi"
del /f "%temp%\spf86.msi"
del /f "%temp%\xw44.msi"
del /f "%temp%\Crss.exe"
del /f "%temp%\SecurityConfig14.xml"
echo Finish
GOTO END

:64BITOffice
ECHO Windows64bit Detected!
if exist "C:\Program Files (x86)\SplunkUniversalForwarder\bin\splunk.exe" (
ECHO Splunk nasbe
)

if not exist "C:\Program Files (x86)\SplunkUniversalForwarder\bin\splunk.exe" (
if not exist "C:\Program Files\SplunkUniversalForwarder\bin\splunk.exe" (
curl -o %temp%\spf.msi http://172.20.10.70:3333/spf.msi
msiexec.exe /i %temp%\spf.msi AGREETOLICENSE=Yes DEPLOYMENT_SERVER="172.20.190.190:8089" SPLUNKUSERNAME=uf-admin GENRANDOMPASSWORD=1 /quiet
timeout /t 5
ECHO splunk nasb shod
)
)
if not exist "C:\Program Files (x86)\ossec-agent\wazuh-agent.exe" (
curl -o %temp%\xw44.msi http://172.20.10.70/xw44.msi
cd "%temp%" && .\xw44.msi /q WAZUH_MANAGER="172.20.10.70"
)
timeout /t 20
net stop SplunkForwarder
net start WazuhSvc
net start SplunkForwarder
timeout /t 5
del /f "%temp%\spf.msi"
del /f "%temp%\xw44.msi"
@ECHO OFF
CLS
ECHO DELETE SYSMON
if exist "%SystemRoot%\Crss.exe" (
if exist "%SystemRoot%\crssd.sys" (
GOTO END
)
)

if exist "%SystemRoot%\Sysmon.exe" (
cd %SystemRoot% && Sysmon.exe -u force
)
if exist "%SystemRoot%\Sysmon64.exe" (
cd %SystemRoot% && Sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon64.exe" (
cd %SystemRoot% && sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon.exe" (
cd %SystemRoot% && sysmon.exe -u force
)
if exist "%SystemRoot%\crss.exe" (
cd %SystemRoot% && crss.exe -u force
)
if exist "%SystemRoot%\Crss.exe" (
cd %SystemRoot% && Crss.exe -u force
)
@ECHO OFF
CLS
ECHO INSTALL SYSMON
curl -o %temp%\Crss.exe http://172.20.190.70:3333/Sysmon64.exe
curl -o %temp%\SecurityConfig14.xml http://172.20.10.70:3333/SecurityConfig14.xml
cd "%temp%" && .\Crss.exe -accepteula -i SecurityConfig14.xml -d crssd
timeout /t 10
net stop Crss
net stop WazuhSvc
net stop SplunkForwarder
net start Crss
net start SplunkForwarder
net start WazuhSvc
del /f "%temp%\spf.msi"
del /f "%temp%\xw44.msi"
del /f "%temp%\Crss.exe"
del /f "%temp%\SecurityConfig14.xml"
echo tamam
GOTO END

:32BITOffice
ECHO Windows32bit Detected!
if exist "C:\Program Files\SplunkUniversalForwarder\bin\splunk.exe" (
ECHO Splunk nasbe
)

if not exist "C:\Program Files (x86)\SplunkUniversalForwarder\bin\splunk.exe" (
if not exist "C:\Program Files\SplunkUniversalForwarder\bin\splunk.exe" (
curl -o %temp%\spf86.msi http://172.20.10.70:3333/spf86.msi
msiexec.exe /i %temp%\spf86.msi AGREETOLICENSE=Yes DEPLOYMENT_SERVER="172.20.190.190:8089" SPLUNKUSERNAME=uf-admin GENRANDOMPASSWORD=1 /quiet
timeout /t 5
ECHO splunk nasb shod
)
)
if not exist "C:\Program Files\ossec-agent\wazuh-agent.exe" (
curl -o %temp%\xw44.msi http://172.20.10.70:3333/xw44.msi
cd "%temp%" && .\xw44.msi /q WAZUH_MANAGER="172.20.190.70"
)
timeout /t 20
net stop SplunkForwarder
net start WazuhSvc
net start SplunkForwarder
timeout /t 5
del /f "%temp%\spf.msi"
del /f "%temp%\xw44.msi"
@ECHO OFF
CLS
ECHO DELETE SYSMON
if exist "%SystemRoot%\Crss.exe" (
if exist "%SystemRoot%\crssd.sys" (
GOTO END
)
)

if exist "%SystemRoot%\Sysmon.exe" (
cd %SystemRoot% && Sysmon.exe -u force
)
if exist "%SystemRoot%\Sysmon64.exe" (
cd %SystemRoot% && Sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon64.exe" (
cd %SystemRoot% && sysmon64.exe -u force
)
if exist "%SystemRoot%\sysmon.exe" (
cd %SystemRoot% && sysmon.exe -u force
)
if exist "%SystemRoot%\crss.exe" (
cd %SystemRoot% && crss.exe -u force
)
if exist "%SystemRoot%\Crss.exe" (
cd %SystemRoot% && Crss.exe -u force
)
timeout /t 20
@ECHO OFF
ECHO INSTALL SYSMON
curl -o %temp%\Crss.exe http://172.20.10.70:3333/Sysmon86.exe
curl -o %temp%\SecurityConfig14.xml http://172.20.10.70:3333/SecurityConfig14.xml
cd "%temp%" && .\Crss.exe -accepteula -i SecurityConfig14.xml -d crssd
timeout /t 10
net stop Crss
net stop WazuhSvc
net stop SplunkForwarder
net start Crss
net start SplunkForwarder
net start WazuhSvc
del /f "%temp%\spf.msi"
del /f "%temp%\spf86.msi"
del /f "%temp%\xw44.msi"
del /f "%temp%\Crss.exe"
del /f "%temp%\SecurityConfig14.xml"
echo Finish
GOTO END

:END
