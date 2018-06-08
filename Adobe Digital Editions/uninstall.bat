@echo off
cls
echo --------------------------------------------------------
echo .
echo .
echo .         Uninstalling Adobe Digital Editions - Please Wait
echo .         Window will close once installed

REM Remove adeupdaterconfig.cfg from "%PROGRAMFILES%\Adobe\Adobe Digital Editions 4.5\"
if exist "%PROGRAMFILES%\Adobe\Adobe Digital Editions 4.5\adeupdaterconfig.cfg" DEL /f /q "%PROGRAMFILES%\Adobe\Adobe Digital Editions 4.5\adeupdaterconfig.cfg" /s
if exist "%PROGRAMFILES% (x86)\Adobe\Adobe Digital Editions 4.5\adeupdaterconfig.cfg" DEL /f /q "%PROGRAMFILES% (x86)\Adobe\Adobe Digital Editions 4.5\adeupdaterconfig.cfg" /s

REM Uninstall existing Adobe Digital Editions 
if exist "%PROGRAMFILES%\Adobe\Adobe Digital Editions 4.5\uninstall.exe" "%PROGRAMFILES%\Adobe\Adobe Digital Editions 4.5\uninstall.exe" /s
if exist "%PROGRAMFILES% (x86)\Adobe\Adobe Digital Editions 4.5\uninstall.exe" "%PROGRAMFILES% (x86)\Adobe\Adobe Digital Editions 4.5\uninstall.exe" /s

REM Wait for 10 seconds
ping -n 10 127.0.0.1  > nul

IF %errorlevel% GTR 0 Exit /B %errorlevel%

SET ERROR=%errorlevel%

REM Return exit code to SCCM
exit /B %ERROR%
