@echo off
title Ender's Tools
GOTO INITIALIZE
:INITIALIZE
echo Starting...
SET DL=%temp%\EnderTools\Downloads
SET SYS=%temp%\EnderTools\SYS
SET LAUNCHRDIR=%0
SET LAUNCHER=1
if not exist "%DL%" mkdir "%DL%"
if not exist "%SYS%" mkdir "%SYS%"
if exist "%DL%\EnderToolsGraber.bat" DEL /Q "%DL%\EnderToolsGraber.bat"
if exist "%DL%\EnderToolsData.bat" DEL /Q "%DL%\EnderToolsData.bat"
if %LAUNCHER% == 2 SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderToolsGraber.bat
if %LAUNCHER% == 2 powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%DL%\EnderToolsGraber.bat'"
cls
echo Starting...
if not %LAUNCHER% == 2 CALL %DL%\EnderToolsGraber.bat
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderToolsData.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%DL%\EnderToolsData.bat'"
cls
echo Starting...
Call %DL%\EnderToolsData.bat
cls
echo There was a problem starting up Ender's Tools
Echo You might be Offline, If problems continue please restart the machine.
pause



