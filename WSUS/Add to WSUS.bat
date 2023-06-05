Net Stop "wuauserv"
%windir%\Regedit.exe /s WSUS.reg
Net Start "wuauserv" 
wuauclt /detectnow
wuauclt /reportnow
wuauclt /downloadnow
Pause
