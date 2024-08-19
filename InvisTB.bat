@echo off

:menu
cls
echo.
echo 8888888                d8b    88888888888888888b.   
echo   888                  Y8P        888    888  "88b  
echo   888                             888    888  .88P  
echo   888  88888b. 888  888888.d8888b 888    8888888K.  
echo   888  888 "88b888  88888888K     888    888  "Y88b 
echo   888  888  888Y88  88P888"Y8888b.888    888    888 
echo   888  888  888 Y8bd8P 888     X88888    888   d88P 
echo 8888888888  888  Y88P  888 88888P'888    8888888P" 
echo.
echo by aaronlyy (github.com/aaronlyy)
echo.

echo [1] - Make taskbar transparent
echo [2] - Reset taskbar to normal
echo [3] - Quit
echo.

set /p choice=Please choose a number and press ENTER [1/2/3]?: 
if %choice%==1 goto add
if %choice%==2 goto delete
if %choice%==3 goto quit
goto menu

:add
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /t REG_DWORD /v TaskbarAcrylicOpacity  /d 0 /f
goto restart

:delete
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAcrylicOpacity /f
goto restart

:restart
taskkill /f /im explorer.exe
start explorer.exe
goto menu

:quit
exit 0