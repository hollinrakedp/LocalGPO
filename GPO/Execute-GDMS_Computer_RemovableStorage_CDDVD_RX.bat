@ECHO Off
goto EndComment
:Comment
Name         - Execute-GDMS_Computer_RemovableStorage_CDDVD_RX.bat
Version      - 1.0
Author       - Darren Hollinrake
Date Created - 2019-09-04
Date Updated - 

.SYNOPSIS
Apply the GDMS Group Policy to allow read/execute permissions of CD/DVD removable storage against the local machine.

.NOTES


:EndComment

:Variables
SETLOCAL
set GPO=GDMS - Computer - Removable Storage - ReadExecute CDDVD

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