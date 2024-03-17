if exist "C:\Program Files\Adobe\Acrobat DC\Acrobat\" (
  taskkill /IM "Acrobat.exe" /F
  timeout /t 20
  del /f "%temp%\Acrobat.dll"
  del /f "%temp%\acrodistdll.dll"
  del /f "%temp%\acrotray.exe"
  curl -o %temp%\Acrobat.dll http://192.168..13:3333/Acrobat.dll
  curl -o %temp%\acrodistdll.dll http://192.168.1.13:3333/acrodistdll.dll
  curl -o %temp%\acrotray.exe http://192.168.1.13:3333/acrotray.exe
  copy %temp%\Acrobat.dll "C:\Program Files\Adobe\Acrobat DC\Acrobat" /Y
  copy %temp%\acrodistdll.dll "C:\Program Files\Adobe\Acrobat DC\Acrobat" /Y
  copy %temp%\acrotray.exe "C:\Program Files\Adobe\Acrobat DC\Acrobat" /Y
  del /f "%temp%\Acrobat.dll"
  del /f "%temp%\acrodistdll.dll"
  del /f "%temp%\acrotray.exe" 
)
