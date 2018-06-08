@echo on
 cls
 echo --------------------------------------------------------
 echo .
 echo . Installing Notepad++ in Silent mode - Please Wait
 echo . (This window will close once installed)
 echo . Installs Notepad++ in silent mode and disables plugins and autoupdate checking
 echo . 
 echo --------------------------------------------------------


    TASKKILL /F /IM notepad++.exe

REM Installing Notepad++
 "%~dp0npp.7.5.5.Installer.exe" /S /noUpdater

IF %errorlevel% GTR 0 Exit /B %errorlevel%

SET ERROR=%errorlevel%

REM Disable Plugins and Updates by removing two folders
ping -n 10 127.0.0.1 >nul
if exist "%PROGRAMFILES%\Notepad++\plugins" RD /S /Q "%PROGRAMFILES%\Notepad++\plugins" 
if exist "%PROGRAMFILES%\Notepad++\updater" RD /S /Q "%PROGRAMFILES%\Notepad++\updater"
if exist "%PROGRAMFILES(X86)%\Notepad++\plugins" RD /S /Q "%PROGRAMFILES(X86)%\Notepad++\plugins"
if exist "%PROGRAMFILES(X86)%\Notepad++\updater" RD /S /Q "%PROGRAMFILES(X86)%\Notepad++\updater"

 REM Return exit code to SCCM
 exit /B %ERROR%
