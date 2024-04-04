@echo off

IF [%1] == [] (
	echo Parameter repository path is missing. Example: %0 C\:Repositories\
	goto:eof
)

IF [%3] == [] (
	echo Parameter version is missing. Linking all version of packages
	set version=""
) ELSE (
	set version=%3
)

set current_directory=%CD%
set repository=%1
set delimiter=-------------------------------------------------------------------------------------

Set COUNTER=0

IF NOT [%2] == [] (
	echo Changing directory to %2
	cd %2
)

SET /P AREYOUSURE=This script will create symbolic links in %CD% from %repository%. Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

echo %delimiter%
for /d %%i in (%repository%\*) do (
	for %%F in (%%i) do (
		for /d %%d in (%%F\*) do (
			for /d %%G in (%%d\*) do (		
				IF %version% == "" (
					IF NOT %%~nxG==src IF NOT %%~nxG==config IF NOT %%~nxG==test (
						echo Trying to create symbolic link %%~nxG
						mklink /D %%~nxG %%G >nul && (
						  echo Symbolic link %%~nxG created
						  set /A COUNTER=COUNTER+1
						) || (
						  echo Link %%~nxG is not created.
						)
						echo %delimiter%
					)
				
					IF %%~nxG==src (
						for /d %%K in (%%G\*) do (
							echo Trying to create symbolic link %%~nxK
							mklink /D %%~nxK %%K >nul && (
							  echo Symbolic link %%~nxK created
							  set /A COUNTER=COUNTER+1
							) || (
							  echo Link %%~nxK is not created.
							)
							echo %delimiter%
						)
					)  
					
					IF %%~nxG==test (
						for /d %%K in (%%G\*) do (
							echo Trying to create symbolic link %%~nxK
							mklink /D %%~nxK %%K >nul && (
							  echo Symbolic link %%~nxK created
							  set /A COUNTER=COUNTER+1
							) || (
							  echo Link %%~nxK is not created.
							)
							echo %delimiter%
						)
					)
				) ELSE (
					IF %version%==%%~nxd (
						IF %%~nxG==src (
							for /d %%K in (%%G\*) do (
								echo Trying to create symbolic link %%~nxK
								mklink /D %%~nxK %%K >nul && (
								  echo Symbolic link %%~nxK created
								  set /A COUNTER=COUNTER+1
								) || (
								  echo Link %%~nxK is not created.
								)
								echo %delimiter%
							)
						)  
						
						IF %%~nxG==test (
							for /d %%K in (%%G\*) do (
								echo Trying to create symbolic link %%~nxK
								mklink /D %%~nxK %%K >nul && (
								  echo Symbolic link %%~nxK created
								  set /A COUNTER=COUNTER+1
								) || (
								  echo Link %%~nxK is not created.
								)
								echo %delimiter%
							)
						)
					)
				)
			)
		)
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
	net stop sagis1011_2.default >nul
	echo Software AG Integration Server is stopped
	
	echo Script is starting Software AG Integration Server
	net start sagis1011_2.default >nul
	echo Software AG Integration Server is started

:END

echo Switching back to genesis directory
cd %current_directory%