#For example, you could schedule your computer to reboot at 11pm every Friday: 
schtasks /create /sc weekly /d FRI /tn "auto reboot computer weekly" /st 23:00 /tr "shutdown -r -f -t 10" 

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
 #/tn <taskname>     
         
      
