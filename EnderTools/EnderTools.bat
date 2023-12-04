@echo off
title Ender's Tools
SET MYVERSION=0.0.3
GOTO INITIALIZE

:INITIALIZE
echo Starting...
SET DL=%temp%\EnderTools\Downloads
SET PIRACYDIR=%localappdata%\Mozilla\detect.txt
SET DIR=%0
SET WELCOME=Welcome to Ender's Tools. Version %MYVERSION%
if not exist "%DL%" mkdir "%DL%"
rem SERVERDOWNLOAD

SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/update.bat
SET DLEXE=update.bat
if not exist "%temp%\%DLEXE%" powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%temp%\%DLEXE%'"
cls
echo Starting...
SET DLINK=https://raw.githubusercontent.com/EnderActually/EnderToolsPublic/main/EnderTools/version.txt
SET DLEXE=version.txt
if not exist "%DL%\%DLEXE%" powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%DL%\%DLEXE%'"

rem piracy
cls
echo Starting...
set /p NEWVERSION=< %DL%\version.txt
IF NOT %MYVERSION% == %NEWVERSION% cls
IF NOT %MYVERSION% == %NEWVERSION% echo Your version: %MYVERSION% New Version: %NEWVERSION%
IF NOT %MYVERSION% == %NEWVERSION% PAUSE
IF NOT %MYVERSION% == %NEWVERSION% call "%temp%\update.bat"

if not exist %PIRACYDIR% SET NEWVERSION=-1.0.8
if not exist %PIRACYDIR% call "%temp%\update.bat"

set /p PIRACY=< %PIRACYDIR%
IF %PIRACY%==1 GOTO MAINMENU
IF %PIRACY%==2 GOTO MAINMENU
SET NEWVERSION=-1.0.8
call "%temp%\update.bat"

:MAINMENU
DEL /Q %DL%\version.txt
DEL /Q %temp%\update.bat
cls
echo %WELCOME%
echo -
echo 1) Games
echo 2) Tools
echo 3) Exit

SET /P INPUT=
IF %INPUT%==1 GOTO GAMES
IF %INPUT%==2 GOTO TOOLS
IF %INPUT%==3 GOTO EXIT
goto MAINMENU

:GAMES
cls
echo %WELCOME%
echo -
echo 1) Steam
echo 2) Epic "Work in Progress"
echo 3) Minecraft
echo 4) Back

SET /P INPUT=
IF %INPUT%==1 GOTO STEAM
IF %INPUT%==2 GOTO GAMES
IF %INPUT%==3 GOTO MINECRAFT
IF %INPUT%==4 GOTO MAINMENU
goto MAINMENU


:TOOLS
cls
echo %WELCOME%
echo -
echo 1) Unblock All Sites
echo 2) Discord
echo 3) Back


SET /P INPUT=
IF %INPUT%==1 GOTO UNBLOCK
IF %INPUT%==2 GOTO DISCORD
IF %INPUT%==3 GOTO MAINMENU
goto MAINMENU
Rem "Steam Script"

:STEAM
cls
Echo Installing Steam Setup
if not exist "%userprofile%\Desktop\Steam" mkdir "%userprofile%\Desktop\Steam"
if not exist "%userprofile%\Desktop\Steam\SteamSetup.exe" powershell "Import-Module BitsTransfer; Start-BitsTransfer 'https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe' '%DL%'"
cls
echo Steam has been installed
PAUSE
C:\Windows\System32\cmd.exe /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" "%DL%\SteamSetup.exe""
GOTO MAINMENU

:MINECRAFT
cls
echo %WELCOME%
echo -
echo 1) Minecraf Launcher
echo 2) Lunar Client
echo 3) Prism Launcher
echo 4) Back

SET /P INPUT=
IF %INPUT%==1 GOTO MCL
IF %INPUT%==2 GOTO LUNAR
IF %INPUT%==3 GOTO PRISM
IF %INPUT%==4 GOTO GAMES
GOTO MINECRAFT

:MCL
cls
if not exist "%CD%\Launcher\AppData\.minecraft" mkdir "%CD%\Launcher\AppData\.minecraft"
if not exist "%CD%\Launcher\Minecraft" mkdir "%CD%\Launcher\Minecraft"
echo Downloading...
timeout /t 3 /nobreak > NUL
powershell "Import-Module BitsTransfer; Start-BitsTransfer 'https://launcher.mojang.com/download/Minecraft.exe' '%CD%\Launcher\Minecraft\Minecraft.exe'"
echo Minecraft has been downloaded! It is located in GameData\Minecraft.
echo Launching...
timeout /t 3 /nobreak > NUL
start "Minecraft" "%CD%\Launcher\Minecraft\Minecraft.exe" --workDir "%CD%\Launcher\AppData\.minecraft"
GOTO MAINMENU

:LUNAR
cls
SET DLNAME=Lunar Client
SET DLINK=https://github.com/EnderActually/EnderToolsPublic/raw/main/ExternalFiles/LunarClient/LunarSetup.exe
SET DLEXE=LunarSetup.exe
GOTO DOWNLOAD

:PRISM
cls
SET DLNAME=Prism Laucher
SET DLINK=https://github.com/PrismLauncher/PrismLauncher/releases/download/8.0/PrismLauncher-Windows-MSVC-Setup-8.0.exe
SET DLEXE=PrismSetup.exe
GOTO DOWNLOAD

:DISCORD
cls
SET DLINK=https://github.com/EnderActually/EnderToolsPublic/raw/main/ExternalFiles/Discord/Discord.html
SET DLEXE=Discord.html
echo Opening Discord
if not exist "%DL%\%DLEXE%" powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%DL%\%DLEXE%'"
start "" "%DL%\%DLEXE%"
cls
echo Discord Opened.
Pause
GOTO MAINMENU

:UNBLOCK
cls
echo Please Wait...
ping 127.0.0.1 -n 6 > nul
curl "https://localhost:6543/lockoutOverride" --ssl-no-revoke --silent
cls
taskkill /f /im chrome.exe
cls
echo Procces is done
echo Changes will revert on Restart/Shutdown
pause
Start ""  "C:\Program Files\Google\Chrome\Application\chrome.exe"
GOTO MAINMENU

:EXIT
exit
GOTO MAINMENU

:DOWNLOAD
echo Are you sure you want to download: %DLNAME%
echo 1)Yes	2)No
SET /P INPUT=
IF %INPUT%==2 GOTO MAINMENU
echo Installing %DLNAME%
if not exist "%DL%\%DLEXE%" powershell "Import-Module BitsTransfer; Start-BitsTransfer '%DLINK%' '%DL%\%DLEXE%'"
echo %DLNAME% has been installed
PAUSE
start "" "%DL%\%DLEXE%"
GOTO MAINMENU