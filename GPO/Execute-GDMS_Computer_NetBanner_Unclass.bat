@ECHO Off
goto EndComment
:Comment
Name         - Execute-GDMS_GPO_NetBanner_Unclass.bat
Version      - 1.0
Author       - Darren Hollinrake
Date Created - 2018-11-10
Date Updated - 

.SYNOPSIS
Apply the GDMS Group Policy for NetBanner Unclassified against the local machine.

.NOTES


:EndComment

:Variables
SETLOCAL
set GPO=GDMS - Computer - NetBanner - Unclassified

:LogStart
FOR /F "TOKENS=2-4 delims=/ " %%a in ('date /t') do (SET date=%%c%%a%%b)
set LOGFILE="%~dp0ApplyLocalGPO.txt"
ECHO %DATE% %TIME% - Info: Executing script %~nx0>>%LOGFILE%


:Begin
pushd %LGPOPATH%
ECHO %DATE% %TIME% - Info: Running: LGPO.exe /g "..\..\GPO\%GPO%">>%LOGFILE%
ECHO Applying %GPO%
ECHO ****************************************
LGPO.exe /g "..\..\GPO\%GPO%"
popd


:LogEnd
ECHO %DATE% %TIME% - Info: Completed script %~nx0>>%LOGFILE%

ENDLOCAL