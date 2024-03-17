#https://superuser.com/questions/992592/automatically-find-installation-directory-of-application-and-run-batch-command-i
@echo off
setlocal
setlocal enabledelayedexpansion
for /f "usebackq tokens=3*" %%a in (`reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Adobe\Acrobat Reader\DC\InstallPath" /s`) do (
  set _acrobat_path=%%a %%b
  echo !_acrobat_path!

  )
endlocal
