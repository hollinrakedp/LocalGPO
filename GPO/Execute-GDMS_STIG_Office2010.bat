@ECHO Off
goto EndComment
:Comment
Name         - Execute-GDMS_STIG_Office2010.bat
Version      - 1.0
Author       - Darren Hollinrake
Date Created - 2018-11-10
Date Updated - 2019-09-04

.SYNOPSIS
Apply the GDMS Group Policy for Office 2010 against the local machine.

.NOTES


:EndComment

:Variables
SETLOCAL
set STIGUSER=GDMS - User - Office 2010 STIG
set STIGCOMPUTER=GDMS - Computer - Office 2010 STIG
set STIGVER=(2018-04-10)

:LogStart
FOR /F "TOKENS=2-4 delims=/ " %%a in ('date /t') do (SET date=%%c%%a%%b)
set LOGFILE="%~dp0ApplyLocalGPO.txt"
ECHO %DATE% %TIME% - Info: Executing script %~nx0>>%LOGFILE%


:Begin
pushd %LGPOPATH%
ECHO %DATE% %TIME% - Info: Running: LGPO.exe /g "..\..\GPO\%STIGUSER% %STIGVER%">>%LOGFILE%
ECHO Applying %STIGUSER% %STIGVER%
ECHO ****************************************
LGPO.exe /g "..\..\GPO\%STIGUSER% %STIGVER%"

ECHO %DATE% %TIME% - Info: Running: LGPO.exe /g "..\..\GPO\%STIGCOMPUTER% %STIGVER%">>%LOGFILE%
ECHO Applying %STIGCOMPUTER% %STIGVER%
ECHO ****************************************
LGPO.exe /g "..\..\GPO\%STIGCOMPUTER% %STIGVER%"
popd


:LogEnd
ECHO %DATE% %TIME% - Info: Completed script %~nx0>>%LOGFILE%

ENDLOCAL