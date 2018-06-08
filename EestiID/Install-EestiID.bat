@echo off
 cls
 echo --------------------------------------------------------
 echo .
 echo . Installing Open-EID - Please Wait
 echo . (This window will close once installed)
 echo . 
 echo --------------------------------------------------------

	REM TASKILL FF & C
 
	REM	TASKKILL /F /IM Chrome.exe
	REM	TASKKILL /F /IM Firefox.exe
	REM	TASKKILL /F /IM Iexplore.exe

	REM Installing Open-EID

start "ID_install" /wait Open-EID-18.3.0.1783_x86.exe /install /quiet /log /norestart AutoUpdate=0 RunQesteidutil=0 IESupport=1 ChomeSupport=1 FirefoxSupport=1 IconsDesktop=1 MinidriverInstall=1 QdigidocInstall=1 QesteidutilInstall=1 TeRaInstall=1

SET ERROR=%errorlevel%


exit /B %ERROR%
