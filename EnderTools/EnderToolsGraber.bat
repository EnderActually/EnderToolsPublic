@echo off
title Ender's Tools
GOTO INITIALIZE

:INITIALIZE
If %LAUNCHER% == 0 pause
If %LAUNCHER% == 0 echo invalid dir
If %LAUNCHER% == 0 EXIT
SET STATUS=2
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/EnderTools.bat
powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%userprofile%\desktop'"
SET STATUS=2
Call %LAUNCHRDIR%