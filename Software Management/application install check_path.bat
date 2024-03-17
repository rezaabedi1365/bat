@echo off
cls & color 0B
Mode con cols=90 lines=5
set Location=%ProgramFiles%\Notepad++
set FileName=Notepad++.exe
echo( & cls
echo(  & echo  Please Wait for moment .... Searching for "%FileName%" on "%Location%"
TimeOut /T 3 /NoBreak>Nul
cls
IF EXIST "%Location%\%FileName%" ( color 0A && echo The "%FileName%" is installed && pause && Start "" "%Location%\%FileName%" 
) ELSE (
    Color 0C & echo The "%FileName%" is not installed & pause & Start "" "Notepad.exe"
)
