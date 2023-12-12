@echo off
title Ender's Tools
GOTO INITIALIZE

:INITIALIZE
if %LAUNCHER% == 0 EXIT
SET LAUNCHER == 2 
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderTools.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%userprofile%\desktop'"
SET LAUNCHER == 2 
Call %LAUNCHRDIR%