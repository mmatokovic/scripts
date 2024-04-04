@echo off
echo Changing default web browser to Google Chrome...
reg add HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice /v ProgId /d ChromeHTML /f >nul 2>&1
reg add HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice /v ProgId /d ChromeHTML /f >nul 2>&1

echo Setting desktop wallpaper...
@echo off
powershell.exe -command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper -Value 'C:\Users\mmatokovic\Pictures\black_wallpaper.jpg'"
rundll32.exe user32.dll,UpdatePerUserSystemParameters >nul 2>&1
echo Desktop wallpaper changed.

echo Done.
