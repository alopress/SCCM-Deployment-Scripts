@echo off
cls
echo --------------------------------------------------------
echo .
echo .
echo .      Installing Adobe Digital Editions - Please Wait
echo .         Window will close once installed

REM REM Uninstall existing Adobe Digital Editions 4.5.6.0 version
REM if exist "%PROGRAMFILES%\Adobe\Adobe Digital Editions 4.5\uninstall.exe" "%PROGRAMFILES%\Adobe\Adobe Digital Editions 4.5\uninstall.exe" /s
REM if exist "%PROGRAMFILES% (x86)\Adobe\Adobe Digital Editions 4.5\uninstall.exe" "%PROGRAMFILES% (x86)\Adobe\Adobe Digital Editions 4.5\uninstall.exe" /s
REM :: Wait for 10 seconds
REM ping -n 20 127.0.0.1 > NUL


REM Detect architecture for registry key addition to stop Norton prompt (http://www.itninja.com/software/adobe/digital-editions/4-3939)
if %PROCESSOR_ARCHITECTURE% == x86 set _arch=ade.reg
if %PROCESSOR_ARCHITECTURE% == AMD64 set _arch=ade64.reg
echo arch is %_arch%

REM Add registry keys
regedit /s "%~dp0%_arch%"

REM Install Adobe Digital Editions
"%~dp0ADE_4.5_Installer.exe" /s

REM Copy config file to Adobe Digital Editions installation folder
if exist "%PROGRAMFILES%\Adobe\Adobe Digital Editions 4.5\" copy "%~dp0adeupdaterconfig.cfg" "%PROGRAMFILES%\Adobe\Adobe Digital Editions 4.5\"
if exist "%PROGRAMFILES% (x86)\Adobe\Adobe Digital Editions 4.5\" copy "%~dp0adeupdaterconfig.cfg" "%PROGRAMFILES% (x86)\Adobe\Adobe Digital Editions 4.5\"

IF %errorlevel% GTR 0 Exit /B %errorlevel%

SET ERROR=%errorlevel%

REM Removes Adobe Digital Editions 4.5.6.0 Desktop Icon - Windows XP
REM if exist "%allusersprofile%\Desktop\Adobe Digital Editions 4.5.lnk" del "%allusersprofile%\Desktop\Adobe Digital Editions 4.5.lnk" /s

REM Removes Adobe Digital Editions 4.5.6.0 Desktop Icon - Windows 7
REM if exist "%public%\Desktop\Adobe Digital Editions 4.5.lnk" del "%public%\Desktop\Adobe Digital Editions 4.5.lnk" /s

REM Return exit code to SCCM
exit /B %ERROR%


