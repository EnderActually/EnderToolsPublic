@echo off
title Ender's Tools
GOTO MAINMENU

:MAINMENU
cls
echo %WELCOME%
echo -
echo 1) Games
echo 2) Tools
echo 3) ChangeLog (NEW!)
echo 4) Exit

SET /P INPUT=
IF %INPUT%==1 GOTO GAMES
IF %INPUT%==2 GOTO TOOLS
IF %INPUT%==3 GOTO CHANGELOG
IF %INPUT%==4 GOTO EXIT
goto MAINMENU

:GAMES
cls
echo %WELCOME%
echo -
echo 1) Steam
echo 2) Epic (Beta)
echo 3) Minecraft
echo 4) Back

SET /P INPUT=
IF %INPUT%==1 GOTO STEAM
IF %INPUT%==2 GOTO EPIC
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
if not exist "%DL%\SteamSetup.exe" powershell "Import-Module BitsTransfer; Start-BitsTransfer 'https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe' '%DL%\SteamSetup.exe'"
cls
echo Steam has been installed
PAUSE
C:\Windows\System32\cmd.exe /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" "%DL%\SteamSetup.exe" --workDir "%userprofile%\Desktop\Steam 
GOTO MAINMENU

:EPIC
cls
Echo Installing Epic Setup
if not exist "%userprofile%\Desktop\Epic" mkdir "%userprofile%\Desktop\Epic"
if not exist "%DL%\EpicSetup.exe" powershell "Import-Module BitsTransfer; Start-BitsTransfer 'https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi' '%DL%\EpicSetup.exe'"
cls
echo Epic has been installed
PAUSE
msiexec /i "%DL%\EpicSetup.exe" --workDir "%userprofile%\Desktop\Epic
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

:CHANGELOG
cls
echo Version %MYVERSION%
echo -
echo Fixed Steam not installing.
echo Added Epic Games.
PAUSE
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