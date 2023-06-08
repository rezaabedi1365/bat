#To complement your weekly reboot, you could schedule tasks to launch specific programs on startup: 
schtasks /create /sc onstart /tn "launch Chrome on startup" /tr "C:\Program Files (x86)\Google\Chrome\Application\Chrome.exe" 

#To schedule the MyApp program to run every time the system starts, type:
schtasks /create onstart /tn MyApp /tr c:\apps\myapp.exe /sc onstart

# /sc is Specifies the schedule type.
      #MINUTE
      #HOURLY
      #DAILY
      #WEEKLY
      #MONTHLY
      #ONCE
      #ONSTART
      #ONLOGON
      #ONIDLE
         
 #/tn <taskname>   ""
  
 #/tr <Taskrun>    ""
