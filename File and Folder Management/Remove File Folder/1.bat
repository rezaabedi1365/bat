#https://stackoverflow.com/questions/51563787/batch-file-to-delete-files-last-accessed-or-created-older-than-x-days
forfiles /P O:\Backup\ /S /M *.accdb /D -7 /C "cmd /c del @PATH"
pause
