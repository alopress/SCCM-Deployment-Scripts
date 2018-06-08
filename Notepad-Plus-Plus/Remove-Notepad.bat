@echo off
cls
echo --------------------------------------------------------
echo .
echo .
echo .      Uninstalling Notepad++ - Please Wait
echo .         Window will close once installed



REM Uninstall existing Notepad++
:UNINSTALL

if exist "%PROGRAMFILES%\Notepad++\uninstall.exe" GOTO UNINSTALL1
if exist "%PROGRAMFILES(x86)%\Notepad++\uninstall.exe" GOTO UNINSTALL2

:EXIT
exit /B %ERROR%

:UNINSTALL1
TASKKILL /F /IM notepad++.exe
START /WAIT "" "%PROGRAMFILES%\Notepad++\uninstall.exe" /S
SET ERROR=%errorlevel%
ping -n 10 127.0.0.1 >nul

RD /S /Q "%PROGRAMFILES%\Notepad++"


GOTO UNINSTALL

:UNINSTALL2
TASKKILL /F /IM notepad++.exe
START /WAIT "" "%PROGRAMFILES(x86)%\Notepad++\uninstall.exe" /S
SET ERROR=%errorlevel%
ping -n 10 127.0.0.1 >nul

RD /S /Q "%PROGRAMFILES(x86)%\Notepad++"

GOTO UNINSTALL

