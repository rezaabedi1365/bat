## at
```
at [\computername] [[id] [/delete] | /delete [/yes]] 
```
```
at [\computername] <time> [/interactive] [/every:date[,...] | /next:date[,...]] <command> 
```

## schtasks
 

* #### [schtasks /create]()
```
schtasks /create /sc <scheduletype> /tn <taskname> /tr <taskrun> [/s <computer> [/u [<domain>\]<user> [/p <password>]]] [/ru {[<domain>\]<user> | system}] [/rp <password>] [/mo <modifier>] [/d <day>[,<day>...] | *] [/m <month>[,<month>...]] [/i <idletime>] [/st <starttime>] [/ri <interval>] [/rl <level>] [{/et <endtime> | /du <duration>} [/k]] [/sd <startdate>] [/ed <enddate>] [/it] [/np] [/z] [/f]
```

* #### [schtasks /query]()
```
schtasks [/query] [/fo {TABLE | LIST | CSV}] [/nh] [/v] [/s <computer> [/u [<domain>\]<user> [/p <password>]]]
```
* #### [schtasks /delete]()
```
schtasks /delete /tn {<taskname> | *} [/f] [/s <computer> [/u [<domain>\]<user> [/p <password>]]]
```
* #### [schtasks /change]()
```
schtasks /change /tn <Taskname> [/s <computer> [/u [<domain>\]<user> [/p <password>]]] [/ru <username>] [/rp <password>] [/tr <Taskrun>] [/st <Starttime>] [/ri <interval>] [/rl <level>] [{/et <Endtime> | /du <duration>} [/k]] [/sd <Startdate>] [/ed <Enddate>] [/{ENABLE | DISABLE}] [/it] [/z]
```
* #### [schtasks /end]()
```
schtasks /end /tn <taskname> [/s <computer> [/u [<domain>\]<user> [/p <password>]]]
```

* #### [schtasks /run]()
```
schtasks /run /tn <taskname> [/s <computer> [/u [<domain>\]<user> [/p <password>]]]
```
---------------------------------------------------------------------------------------
###### [Microsoft Schedule Task Link](https://learn.microsoft.com/en-us/windows/win32/taskschd/schtasks)
###### [Microsoft Schetask/Create Link](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/schtasks-create)


# Parametrs
### /sc <Specifies the schedule type> 
      - #MINUTE  in visual is ontime with minut repeat
      - #HOURLY  in visual is ontime with hourly repeat
      - #DAILY
      - #WEEKLY
      - #MONTHLY
      - #ONCE
      - #ONSTART
      - #ONLOGON
      - #ONIDLE
### /d  <is  DAYs >
      value between 1-52 weeks 
    OR
      Specefic Days
         - SAT
         - SUN
         - MON
         - TUE
         - #WED
         - THU
         - FRI
 #/tn <taskname>   ""
 #/tr <Taskrun>    ""
 ---------------------------------------------------------------------------
 #/st <Starttime>
	#if you write /sd and dont write start time by default is current time ,
 #/sd <StartDate>
	#if you write /st and dont write start date by default is current date ,
 #/et <EndTime>
	#if you write /ed and dont write edn time for expire date by default is 12:00 AM ,
 #/ed <EndDate>
 	#if you write /et and dont write End date by default is current date ,
#****if you want to set /et for after days you must enter /ed for example its wrong : /st 17:00 /et 08:00
----------------------------------------------------------------------------
 # /mo   
	- #if /sc was Daily   /mo is  1-365  
	- #if /sc was wekely  /mo is  1-52
	- #if /sc was monthly /mo is  1-12
	- #if /sc was hourly  /mo is  1-23  in visual /sc hourly = ontime with hourly repeat you can set duration until 1day
 #/du <duration>
	#maximum length minute or hourly schedule in <HHHH:MM> 24-hour format.
-----------------------------------------------------------------------------
 /Z  A value that  marks the task to be deleted after its final run.
 /F  A value that  forcefully creates the task and suppresses warnings if the specified task already exists.
 /DELAY <wait time to delay the task after the trigger> time format is mmmm:ss  delaytime  This option is only valid for schedule types ONSTART, ONLOGON, and ONEVENT.
 /RI interval <interval in minutes> The valid range is 1 - 599940 minutes

