@echo off
for /f "delims=" %%a in (%~dp0\temp.txt) do ping -n 1 %%a >nul && (echo %%a ok) || (echo %%a failed to respond) 
pause
 
