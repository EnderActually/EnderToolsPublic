@echo off
title Ender's Tools
GOTO INITIALIZE

:INITIALIZE
IF [%STATUS%] EQU [] GOTO START
IF %STATUS%==2 GOTO LAUNCH
if %PIRNUM%==1 GOTO START

:START
echo Starting...
SET DL=%temp%\EnderTools\Downloads
SET SYS=%temp%\EnderTools\SYS
SET LAUNCHRDIR=%0
SET STATUS=1
if not exist "%DL%" mkdir "%DL%"
if not exist "%SYS%" mkdir "%SYS%"
if exist "%SYS%\EnderToolsGraber.bat" DEL /Q "%SYS%\EnderToolsGraber.bat"
if exist "%SYS%\EnderToolsData.bat" DEL /Q "%SYS%\EnderToolsData.bat"

cls
echo Starting...
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderToolsData.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%SYS%\EnderToolsData.bat'"
cls
echo Starting...
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderToolsGraber.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%SYS%\EnderToolsGraber.bat'"
CALL "%SYS%\EnderToolsGraber.bat"
cls
echo There was a problem starting up Ender's Tools
Echo You might be Offline, If problems continue please restart the machine.
pause
EXIT

:LAUNCH
Call %SYS%\EnderToolsData.bat
echo There was a problem starting up Ender's Tools
Echo You might be Offline, If problems continue please restart the machine.
pause
EXIT


