@echo off
title Ender's Tools
pause
GOTO INITIALIZE

:INITIALIZE
IF %STATUS% == 0 EXIT
SET STATUS=2
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderTools.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%userprofile%\desktop'"
SET STATUS=2

Call %LAUNCHRDIR%