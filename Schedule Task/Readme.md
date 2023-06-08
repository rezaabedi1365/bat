## at
 * [Syntax]()

```
at [\computername] [[id] [/delete] | /delete [/yes]] 
```
```
at [\computername] <time> [/interactive] [/every:date[,...] | /next:date[,...]] <command> 
```

## schtasks
 

* #### schtasks /create
```
schtasks /create /sc <scheduletype> /tn <taskname> /tr <taskrun> [/s <computer> [/u [<domain>\]<user> [/p <password>]]] [/ru {[<domain>\]<user> | system}] [/rp <password>] [/mo <modifier>] [/d <day>[,<day>...] | *] [/m <month>[,<month>...]] [/i <idletime>] [/st <starttime>] [/ri <interval>] [/rl <level>] [{/et <endtime> | /du <duration>} [/k]] [/sd <startdate>] [/ed <enddate>] [/it] [/np] [/z] [/f]
```
* #### schtasks /query
```
schtasks [/query] [/fo {TABLE | LIST | CSV}] [/nh] [/v] [/s <computer> [/u [<domain>\]<user> [/p <password>]]]
```
* #### schtasks /delete
```
schtasks /delete /tn {<taskname> | *} [/f] [/s <computer> [/u [<domain>\]<user> [/p <password>]]]
```
* #### schtasks /change
```
schtasks /change /tn <Taskname> [/s <computer> [/u [<domain>\]<user> [/p <password>]]] [/ru <username>] [/rp <password>] [/tr <Taskrun>] [/st <Starttime>] [/ri <interval>] [/rl <level>] [{/et <Endtime> | /du <duration>} [/k]] [/sd <Startdate>] [/ed <Enddate>] [/{ENABLE | DISABLE}] [/it] [/z]
```
* #### schtasks /end
```
schtasks /end /tn <taskname> [/s <computer> [/u [<domain>\]<user> [/p <password>]]]
```

* #### schtasks /run
```
schtasks /run /tn <taskname> [/s <computer> [/u [<domain>\]<user> [/p <password>]]]
```

