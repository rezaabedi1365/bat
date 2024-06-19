
Computer> Configuration> Policies> Administrative Templates> System > Windows Time Service > Time Providers
        > Configure Windows NTP Client
        > Enable Windows NTP Client
        > Enable Windows NTP Server

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer" /v Enabled /t REG_DWORD /d 1 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers " /v 1 /t REG_SZ /d 10.10.12.18 /f 

#reconfig 
      w32tm /config /update

verify ntp server:
  w32tm /query /status
  w32tm /query /peers 
  w32tm /query /configuration

@echo off
w32tm /config /syncfromflags:DOMHIER /reliable:YES /update
w32tm /resync /nowait
net stop w32time
net start w32time 
EOF
