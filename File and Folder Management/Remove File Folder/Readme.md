![image](https://github.com/rezaabedi1365/bat/assets/117336743/f966cfe4-5711-44d8-b7aa-2bc5113e5da0)
![image](https://github.com/rezaabedi1365/bat/assets/117336743/a4cce3b2-9ed2-48c7-a1c8-2026cd3886fc)
##### https://ss64.com/nt/syntax-delolder.html

![image](https://github.com/rezaabedi1365/bat/assets/117336743/7be23530-1fb7-44d5-af90-9889a0ee1b86)
![image](https://github.com/rezaabedi1365/bat/assets/117336743/4bfa197f-e1c2-4998-8e79-0c913657f6ca)


How-to: Delete files older than N days

There are several ways to do this

1) Using ForFiles to delete files over 7 days old [last modifie date]:
```
forfiles /p "C:\source_folder" /s /m *.* /c "cmd /c Del @path" /d -7
forfiles /P  C:\source_folder  /S /M *.* /D -7 /C "cmd /c del @PATH"
```
2) Using Robocopy /Move to delete files over 7 days old:
```
C:\> set _robodel=%TEMP%\~robodel
C:\> MD %_robodel%
C:\> ROBOCOPY "C:\source_folder" %_robodel% /move /minage:7
C:\> del %_robodel% /q
```
3) Using DateMath.cmd and Getdate.cmd, download DelOlder.cmd

4) With PowerShell delete files over 7 days old:
```
PS C:\> $now = get-date
PS C:\> dir "C:\source_folder\" | where {$_.LastWriteTime -le $now.AddDays(-7)} | del -whatif
```
![image](https://github.com/rezaabedi1365/bat/assets/117336743/b97e83b3-1db5-423f-b7bc-41c8d5959786)



---------------------------------------------------------------------------------------------------------------------
https://pureinfotech.com/delete-files-older-than-days-windows-10/




------------------------------------------------------------------------------------------------------------------------
https://www.easeus.com/questions/recovery/batch-file-to-delete-older-than-n-days.html




-----------------------------------------------------------------------------------------------------------------------
