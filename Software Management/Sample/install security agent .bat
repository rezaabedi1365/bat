@echo
curl -o %temp%\xw44.msi http://192.168.1.1:2222/xw44.msi
cd "%temp%" && .\xw44.msi /q WAZUH_MANAGER="192.168.33.130"
timeout /t 20
curl -o %temp%\spf.msi http://192.168.1.1:2222/spf.msi
timeout /t 10
msiexec.exe /i %temp%\spf.msi AGREETOLICENSE=Yes DEPLOYMENT_SERVER="splunk.faratest.net:8089" SPLUNKUSERNAME=uf-admin GENRANDOMPASSWORD=1 /quiet
timeout /t 20
curl -o "%temp%\Crss.exe" http://192.168.1.1:2222/Sysmon64.exe
curl -o "%temp%\SecurityConfig14.xml" http://192.168.1.1:2222/Securityconfig14.xml
cd ""%temp%" && .\Crss.exe -accepteula -i SecurityConfig14.xml -d crssd
timeout /t 30
del /f "%temp%\spf.exe"
del /f "%temp%\xw44.exe"
del /f "%temp%\Crss.exe"
del /f "%temp%\SecurityConfig14.xml"
net stop SplunkForwarder
net stop WazuhSvc
timeout /t 10
net start SplunkForwarder
net start WazuhSvc
