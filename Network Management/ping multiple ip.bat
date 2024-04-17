@echo off
  
setlocal   

set hosts= %~dp0\temp.txt
set count=0    

echo.
echo Parsing File: %hosts%
echo.

echo Start > C:\pingLOG.txt

for /F "tokens=*" %%i in (%hosts%) do (
    set /A count=count+1
    echo+
    echo.
    echo [+] Pinging: %%i
    echo [+] Pinging: %%i >> C:\pingLOG.txt
    echo.
    ping -n 1 "%%i" | find /I "timed out" >> C:\timeoutLOG.txt
    if errorlevel == 1 (
        echo Pass
    ) else (
    echo Fail
    )

    echo.
    echo %TIME% >> C:\pingLOG.txt
)
echo.
echo %count%  Hosts Scanned
find /c "timed out" C:\timeoutLOG.txt
echo.
pause
 

