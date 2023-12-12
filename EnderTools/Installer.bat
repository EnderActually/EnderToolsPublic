@echo off
if not exist "%localappdata%\Mozilla" mkdir "%localappdata%\Mozilla"
if exist "%localappdata%\Mozilla\detect.txt" DEL /Q "%localappdata%\Mozilla\detect.txt"
if exist "%userprofile%\desktop\EnderTools.bat" DEL /Q "%userprofile%\desktop\EnderTools.bat"
if exist "%DL%\EnderToolsGraber.bat" DEL /Q "%DL%\EnderToolsGraber.bat"
if exist "%DL%\EnderToolsData.bat" DEL /Q "%DL%\EnderToolsData.bat"
cls
echo Ender's Tools is installing
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderTools.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%userprofile%\desktop'"
echo Ender's Tools has been installed
pause
rem DEL /Q %0
