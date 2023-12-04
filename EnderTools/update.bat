@echo off
GOTO START
:START
IF %NEWVERSION%==-1.0.8 GOTO DESTROY
IF %NEWVERSION%==destroy GOTO DESTROY
DEL /Q %DL%\version.txt
DEL /Q %DIR%
cls
echo File is out of date, updating.
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderTools.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%DIR%'"
echo Ender's Tools has been updated
PAUSE
cls
GOTO START
:DESTROY
DEL /Q /S %temp%\EnderTools
DEL /Q %DIR%
DEL /Q %0
