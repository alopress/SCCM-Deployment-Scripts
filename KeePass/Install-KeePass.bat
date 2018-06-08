@echo off
 cls
 echo --------------------------------------------------------
 echo .
 echo . KeePass - Please Wait
 echo . (This window will close once installed)
 echo . Installs KeePass
 echo . 
 echo --------------------------------------------------------



:INSTALL

 REM Installing KeePass
 msiexec.exe /i "%~dp0KeePass-2.39.msi" /qn /norestart /l* %temp%\keepass.log

IF %errorlevel% GTR 0 Exit /B %errorlevel%

SET ERROR=%errorlevel%

REM Copy CONF
 if exist "C:\Program Files (x86)\KeePass2x\" xcopy "%~dp0KeePass.config.enforced.xml" "C:\Program Files (x86)\KeePass2x\" /e /i /h /y
 if exist "C:\Program Files\KeePass2x\" xcopy "%~dp0KeePass.config.enforced.xml" "C:\Program Files\KeePass2x\" /e /i /h /y


 REM Return exit code to SCCM
 exit /B %ERROR%
