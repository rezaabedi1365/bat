#https://stackoverflow.com/questions/31034607/finding-a-programs-installation-path-using-a-batch-file/31038687

@echo off
Mode con cols=90 lines=15
set Location=C:\Program files
Set FileName=Program*
Set Tmp=Tmp.txt
Set SearchResult=SearchResult.txt
echo( & cls
echo(  & echo  Please Wait for moment .... Searching for "%FileName%" on "%Location%"
where /r "%Location%" "%FileName%" > %Tmp%
Cmd /U /C Type %Tmp% > %SearchResult%
Del %Tmp%
Start %SearchResult%
