
# Path Envirunment Variable
  - %Systemroot%    OR   %windir%
  - %userprofile%
  - %temp%



# FIND VS findstr
###### FIND command can scan large files line-by-line to find a certain string. It doesn't support wildcards in the search string.
```
find /i "Completed" "%userprofile%\Downloads\*.log" >> %targetdir%\tested.log

TYPE scan2.txt | FIND "Failed" /c && echo Scan failed || echo Scan Succeeded
```

###### FINDSTR command is more feature reach, and supports Regular Expressions (REGEX) search with wildcards in the search string.
```
FINDSTR /L /C:"Completed" Results.txt

echo %%G | findstr /r /b /c:"[ ]*staff.*" >nul && echo Found!
```
 # FIND
 ```
 find [/v] [/c] [/n] [/i] [/off[line]] <"string"> [[<drive>:][<path>]<filename>[...]]
 ```
 * [FIND Directory]()
    ```
    dir c:\temp /s /b | find "CPU"
    ```

 * [FIND Process]()
   ```
   tasklist | find /v /i "agent"
   ```
 * [FIND Service]()
     ```
     sc query  Winmgmt | find "RUNNING" >nul 2>&1 && (echo service is started) || (echo service is stopped)
     ```
![image](https://github.com/rezaabedi1365/bat/assets/117336743/d2e46e52-9be8-43c2-a8d7-dee3ddfa24c9)
