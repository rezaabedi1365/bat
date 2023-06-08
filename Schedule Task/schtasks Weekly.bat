#For example, you could schedule your computer to reboot at 11pm every Friday: 
schtasks /create /sc weekly /d FRI /tn "auto reboot computer weekly" /st 23:00 /tr "shutdown -r -f -t 10" 
