@echo off
:: =================================================================================
:: Google Play Games High-Resolution Launcher
::
:: This script forces a game to render at a higher resolution by temporarily
:: changing the desktop resolution, launching the game, and then changing it back.
:: =================================================================================


:: ----------- CONFIGURATION -----------
:: Please edit the settings below to match your system and game.

REM The full URL for the game, found using the Find-GameURL.ps1 script.
set GAME_URL="googleplaygames://launch/?id=com.supercell.clashroyale"

REM The super-resolution you want the game to render at (e.g., 4K).
set HighResolution=/x:3840 /y:2160

REM Your monitor's native resolution that the script will return to.
set NativeResolution=/x:1920 /y:1080

REM The delay in seconds to wait for the game to load. Increase if your PC is slower.
set WaitTimeInSeconds=10

:: ------------------------------------


:: --- SCRIPT EXECUTION ---
cls
echo.
echo ================================================================
echo =            High-Fidelity Game Launcher active            =
echo ================================================================
echo.

echo STEP 1: Setting resolution to %HighResolution% for supersampling...
QRes.exe %HighResolution%
echo.

echo STEP 2: Launching the game...
start "" %GAME_URL%
echo Launch command sent.
echo.

echo STEP 3: Waiting %WaitTimeInSeconds% seconds for the game to fully load...
timeout /t %WaitTimeInSeconds% /nobreak
echo.

echo STEP 4: Restoring native resolution (%NativeResolution%)...
QRes.exe %NativeResolution%
echo Done.
echo.

echo ================================================================
echo Script finished. The game should now be running.
echo This window will close automatically in 3 seconds...
echo ================================================================

timeout /t 3 /nobreak > nul
exit
