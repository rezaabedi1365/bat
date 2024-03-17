#https://www.edugeek.net/forums/how-do-you-do/227155-installing-things-via-batch-file-if-not-exist.html

if not exist "%systemdrive%\Program Files\aprogram\theprogram.exe" msiexec /i \\mydomain\someshareoranother\setup.exe /qn
