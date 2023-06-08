#For example, you could schedule your computer to reboot at 11pm every Friday: 
schtasks /create /sc weekly /d FRI /tn "auto reboot computer weekly" /st 23:00 /tr "shutdown -r -f -t 10" 

#To schedule the MyApp program to run every week on Wednesday, type:
schtasks /create /sc weekly /d WED /tn MyApp /tr c:\apps\myapp.exe 

#To schedule a task to run on Monday and Friday of every eighth week, type:
schtasks /create /tn MyApp /tr c:\apps\myapp.exe /sc weekly /mo 8 /d MON,FRI

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
# /d  is  DAYs.
      #value between 1-52 weeks 
      #OR
      #Specefic Days
         #SAT
         #SUN
         #MON
         #TUE
         #WED
         #THU
         #FRI
         
 #/sd <Startdate>
      #MM/DD/YYYY
      
 #/tn <taskname>   ""
 
 #/st <Starttime>
 
 #/tr <Taskrun>    ""
         
      
