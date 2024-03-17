@ECHO OFF
:: Copy the configuration file
copy config.xml "%AppData%\DataLinks.xml"

:: Search for the CONFIG file, if this doesn't exit then the user doesn't have the .Net framework 2.0
SET FileName=%windir%\Microsoft.NET\Framework\v2.0.50727\CONFIG
IF EXIST %FileName% GOTO INSTALL_DIALER
ECHO.You currently do not have the Microsoft(c) .NET Framework 2.0 installed.
ECHO.This is required by the setup program for CAT Dialer
ECHO.
ECHO.The Microsoft(c) .NET Framework 2.0 will now be installed on you system.
ECHO.After completion setup will continue to install CAT Dialer on your system.
ECHO.
:: Install the .Net framework and then run setup to install the CAT Dialerr 
PAUSE
ECHO Installing... this could take serveral minutes...Please wait....
START /WAIT NetFx20SP2_x86.exe
:: If the user cancels the installation of the framework exit batch file
IF errorlevel 1 GOTO EOF
Start CATSoftphone.exe
ECHO ON
EXIT

:: .Net framework has been skipped contine to install the dialer.
:INSTALL_DIALER
ECHO *** Skiped Dotnet Framework 2.0.50727 ***
ECHO Installing... Please wait...
START CATSoftphone.exe
ECHO ON
EXIT
