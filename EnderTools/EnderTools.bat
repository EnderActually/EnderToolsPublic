@echo off
title Ender's Tools
GOTO INITIALIZE

:INITIALIZE
IF [%STATUS%] EQU [] GOTO START
IF %STATUS%==2 GOTO LAUNCH
GOTO START

:START
echo Starting...
SET DL=%temp%\EnderTools\Downloads
SET SYS=%temp%\EnderTools\SYS
SET LAUNCHRDIR=%0
SET STATUS=1
if not exist "%DL%" mkdir "%DL%"
if not exist "%SYS%" mkdir "%SYS%"
if exist "%DL%\EnderToolsGraber.bat" DEL /Q "%DL%\EnderToolsGraber.bat"
if exist "%DL%\EnderToolsData.bat" DEL /Q "%DL%\EnderToolsData.bat"

echo Starting...
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderToolsData.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%DL%\EnderToolsData.bat'"

SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderToolsGraber.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%DL%\EnderToolsGraber.bat'"

CALL "%DL%\EnderToolsGraber.bat"

echo There was a problem starting up Ender's Tools
Echo You might be Offline, If problems continue please restart the machine.
pause
EXIT

:LAUNCH
Call %DL%\EnderToolsData.bat
echo There was a problem starting up Ender's Tools
Echo You might be Offline, If problems continue please restart the machine.
pause



