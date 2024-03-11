https://ss64.com/nt/syntax-delolder.html

How-to: Delete files older than N days

There are several ways to do this

1) Using ForFiles to delete files over 7 days old:

C:\> forfiles /p "C:\source_folder" /s /m *.* /c "cmd /c Del @path" /d -7
forfiles /P  C:\source_folder  /S /M *.* /D -7 /C "cmd /c del @PATH"

2) Using Robocopy /Move to delete files over 7 days old:

C:\> set _robodel=%TEMP%\~robodel
C:\> MD %_robodel%
C:\> ROBOCOPY "C:\source_folder" %_robodel% /move /minage:7
C:\> del %_robodel% /q

3) Using DateMath.cmd and Getdate.cmd, download DelOlder.cmd

4) With PowerShell delete files over 7 days old:
PS C:\> $now = get-date
PS C:\> dir "C:\source_folder\" | where {$_.LastWriteTime -le $now.AddDays(-7)} | del -whatif
---------------------------------------------------------------------------------------------------------------------
https://pureinfotech.com/delete-files-older-than-days-windows-10/




------------------------------------------------------------------------------------------------------------------------
https://www.easeus.com/questions/recovery/batch-file-to-delete-older-than-n-days.html




-----------------------------------------------------------------------------------------------------------------------
