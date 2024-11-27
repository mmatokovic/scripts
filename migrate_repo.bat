@echo off

setlocal EnableDelayedExpansion

set /p GITLAB_URL=Enter the GitLab repository URL: 
set /p BITBUCKET_URL=Enter the Bitbucket repository SSH: 

git clone --bare %GITLAB_URL%

timeout /t 5  >nul

for /d %%i in (*) do (
  set "REPO_NAME=%%~nxi"
  if "%%~nxi"=="%REPO_NAME%.git" (
    set "REPO_NAME=%%~nxi"
    goto FoundRepo
  )
)

:FoundRepo
cd %REPO_NAME%
git remote add bitbucket %BITBUCKET_URL%

git push --all bitbucket
git push --tags bitbucket

cd ..
rd /s /q %REPO_NAME%
