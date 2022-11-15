@echo off

IF [%1] == [] (
	echo Parameter repository path is missing. Example: %0 C\:Repositories\ESB
	goto:eof
)

set current_directory=%CD%
set repository=%1
set delimiter=-------------------------------------------------------------------------------------

Set COUNTER=0

IF NOT [%2] == [] (
	echo Changing directory to %2
	cd %2
)

SET /P AREYOUSURE=This script will create symbolic links in %CD% from %repository%\packages. Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

for /d %%i in (%repository%\packages\*) do (
	for %%F in (%%i) do (
		echo Trying to create symbolic link %%~nxF
		mklink /D %%~nxF %%i >nul && (

		  echo Symbolic link %%~nxF created
		  set /A COUNTER=COUNTER+1
		) || (
		  echo Link %%~nxF is not created.
		)
		echo %delimiter%
	)
)

if /I %counter% EQU 0 (
	echo No links created. Program will finish now.
	goto END
)

echo Total %counter% links created!

echo %delimiter%

SET /P AREYOUSURE=Do you want to restart Integration Server to refresh packages (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
	echo Script is stopping Software AG Integration Server
	net stop sagis105_1.default >nul
	echo Software AG Integration Server is stopped
	
	echo Script is starting Software AG Integration Server
	net start sagis105_1.default >nul
	echo Software AG Integration Server is started

:END

echo Switching back to genesis directory
cd %current_directory%