@echo off
cls
echo --------------------------------------------------------
echo .
echo .
echo .      	Uninstalling VLC - Please Wait
echo .         Window will close once installed

REM Uninstall existing VLC version
if exist "%PROGRAMFILES%\VideoLAN\VLC\uninstall.exe" "%PROGRAMFILES%\VideoLAN\VLC\uninstall.exe" /S
if exist "%PROGRAMFILES% (x86)\VideoLAN\VLC\uninstall.exe" "%PROGRAMFILES% (x86)\VideoLAN\VLC\uninstall.exe" /S


REM Return exit code to SCCM
exit /B %errorlevel%
