#https://www.anoopcnair.com/deploy-batch-file-using-intune-guide/
@echo off
set "tempFolder=%TEMP%"
echo Cleaning up the Temp folder: %tempFolder%
echo.

rem List all files in the Temp folder (excluding subfolders)
for %%F in ("%tempFolder%\*") do (
    if not "%%~xF"=="" (
        echo Deleting file: "%%F"
        del "%%F" /q
    )
)

echo.
echo Temp folder cleanup completed.
