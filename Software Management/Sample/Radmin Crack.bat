@echo off

IF EXIST "C:\radmin\" (
echo 1
) ELSE (
copy "\\ftp-offices\d$\Softbank\Softbank\Radmin.Remote.Control.3.5\radmin.rar*" C:\
cd C:\Program Files\WinRAR\
UnRAR x C:\radmin.rar
)
cd C:\radmin
install.bat
