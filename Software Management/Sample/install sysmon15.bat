@ECHO OFF
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

timeout /t 10

curl -o %temp%\Crss.exe http://192.168.33.10:3333/Sysmon15.exe
curl -o %temp%\SecurityConfig15.xml http://192.168.33.10:3333/SecurityConfig15.xml
cd "%temp%" && .\Crss.exe -accepteula -i SecurityConfig15.xml -d crssd

timeout /t 10

net stop Crss
net stop WazuhSvc
net stop SplunkForwarder

timeout /t 10

net start Crss
net start SplunkForwarder
net start WazuhSvc

timeout /t 10

del /f "%temp%\spf.msi"
del /f "%temp%\spf86.msi"
del /f "%temp%\xw44.msi"
del /f "%temp%\Crss.exe"
del /f "%temp%\SecurityConfig15.xml"

GOTO END
:END
