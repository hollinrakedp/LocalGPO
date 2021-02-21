@ECHO Off
goto EndComment
:Comment
Name         - Execute-GDMS_GPO_RemovableStorage_NonAdmin_CDDVD_RW.bat
Version      - 1.0
Author       - Darren Hollinrake
Date Created - 2018-11-13
Date Updated - 2019-09-04

.SYNOPSIS
Apply the GDMS Group Policy for allowing the Non-Administrators group Read/Write access to the local CD/DVD drive.

.NOTES


:EndComment

:Variables
SETLOCAL
set GPO=GDMS - User - Removable Storage - Allow CDDVD RW
set REGPOL={303F3483-3FEA-4F88-AB85-D076A114314D}\DomainSysvol\GPO\User\registry.pol

:LogStart
FOR /F "TOKENS=2-4 delims=/ " %%a in ('date /t') do (SET date=%%c%%a%%b)
set LOGFILE="%~dp0ApplyLocalGPO.txt"
ECHO %DATE% %TIME% - Info: Executing script %~nx0>>%LOGFILE%


:Begin
pushd %LGPOPATH%
ECHO %DATE% %TIME% - Info: Running: LGPO.exe /un "..\..\GPO\%GPO%\%REGPOL%">>%LOGFILE%
ECHO Applying %GPO%
ECHO ****************************************
LGPO.exe /un "..\..\GPO\%GPO%\%REGPOL%"
popd


:LogEnd
ECHO %DATE% %TIME% - Info: Completed script %~nx0>>%LOGFILE%

ENDLOCAL